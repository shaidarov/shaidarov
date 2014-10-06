/********************************
PUTIV.FRM
Расчет ГСМ по путевым листам
Не менять маштаб в шаблоне!!!
Алгоритмы смотреть в шаблоне
отличить комплектующую от машины
*if(coTXOGetField('PUTGSM','cAgregat',GSM_Nrec)=0,1,0)

********************************/
.linkform 'putway_tns_gsmras' prototype is 'putway'
.NameInList  'TNS Печать расчета ГСМ'
!пусть печатается во всех стандартных группах
.group 'Путевой лист без заказов'
.group 'Список П/Л'
.group 'Реестр П/Л'
.group 'Полный'
.group 'Лицевая'
.group 'Форма 3-С (1997)'
.group 'Полный Форма 3-С (1997)'
.group 'Лицевая Форма 3-С (1997)'
.group ' Форма 6(спец.) (Россия)'
.group 'Полный  Форма 6(спец.) (Россия)'
.group 'Форма 4-П (1997)' 
.group 'Полный Форма 4-П (1997)'
.group 'Путевой лист форма 3 (1997)' 
.group 'Полный Путевой лист форма 3 (1997)'
.group 'Путевой лист автобуса форма 6 (1997)'
.group 'Полный Путевой лист автобуса форма 6 (1997)'
!делаем свою спец.группу для печати по отдельной кнопке
.group 'Печать расчета ГСМ TNS'
.group 'Формы TNS'
.F "NUL"
!.p 60
!=====================================  
#include excel_fun.frn
!=====================================  
.var
  iGsm_CalcNorm: Gsm_CalcNorm;
  kl_first :boolean;
  dtb :date;
  DatSummer, DatWinter, DatAnal :date;
  kl_norma :boolean;
  ww_str,ww_str1,ww_str2,ww_str3,ww_str4,ww_stralg :string;
  w_kodgsm :string;
  w_koef1:double;
  w_itgsm:double;
  ww_i,ww_k:integer;
  ww_rasx_it:double;//итого расчитано
  ww_vidt,ww_rasx,WW_NORM:double;
  wkod_alg :word;
  ww_column:integer;
  wkl_baz:boolean;
  w_Gsm_baz:double;
  fleet: ICyberFleet;
  cf_putlst_fuel:double;
  cf_putlst_km:double;
  cf_putlst_fuelkm:double;
  cf_dtbeg: datetime;
  cf_dtend: datetime;
  resCF:integer;
.endvar
!=====================================  
.create view vvv
as select putlst.nrec
from 
  putlst,My_Toplivo,transp,katos 
, toplivo, normgsm 
,putgsm ,GSMALG
,Compon   Compon_Spec
,MarComp  MarComp_Spec

where ((
  Nrec_Pl == PutLst.Nrec
and PutLst.ctransp == transp.nrec  
and transp.CKATOS == katos.nrec
//and normgsm.ctoplivo == toplivo.nrec
And PutGsm.cToplivo       == Toplivo.nrec
and 0 == Systran.WHATIS 
and cogettune('MYORG') == Systran.NRECMYORG(noindex)
and putlst.nrec == putgsm.cputlst
and putgsm.CGSMALG == GSMALG.Nrec
And PutGsm.cAgregat       == Compon_Spec.nrec
And Compon_Spec.cMarComp  == MarComp_Spec.nrec

 )) ;
!=====================================
.Procedure CyberFleet_Toplivo;
begin
  if (NullVipRef(fleet))
  {
    if (LoadVipRef(fleet, 'M_TRANSP::CyberFleet'))
    {
      cf_dtbeg := _datetime1(putlst.exitdn, putlst.exitch);
      cf_dtend := _datetime1(putlst.returndn, if(putlst.exitch=putlst.returnch and putlst.exitch = time(0,0,0,0),time(23,59,59,99),putlst.returnch));
      resCF :=  fleet.CyberFleet_TripListInfo(transp.garnom,cf_dtbeg, cf_dtend,
                                          cf_putlst_fuel, cf_putlst_km, cf_putlst_fuelkm);
    }
    else
    {
      Message('Системная ошибка - не загружен интерфейс связи с CyberFleet! Обратитесь к администратору.')
    };
  };
end.
!=====================================
.Procedure My_Toplivo_ADD;
begin
      if vvv.getfirst My_Toplivo where (( string(ww_column,3,0)+ww_str1 == My_Toplivo.PUTLST_NOMER
       and string(PutGsm.Nrec) ==  MY_TOPLIVO.TRANSP_MARKA
       )) <>0
      { vvv.Insert into My_Toplivo set 
          My_Toplivo.PUTLST_NOMER:=string(ww_column,3,0)+ww_str1
         ,MY_TOPLIVO.TRANSP_MARKA:= string(PutGsm.Nrec) //ww_str3
         ,My_Toplivo.Toplivo_Name:=ww_str4 //My_WorkTable.Toplivo_Name - НЕ ВЛЕЗАЕТ!
         ,My_Toplivo.Column:=ww_column
         ,My_Toplivo.Vid :=ww_vidt
      //   ,My_Toplivo.TOPLIVO_KOD:=ww_str1
         ,My_Toplivo.rasx:=ww_rasx
         ,My_Toplivo.Toplivo_NameAlg:=replace(ww_str4, ' ', '')//ну и пробелы все затрем, чтобы не рябили

      }
      else
      { vvv.update current My_Toplivo set My_Toplivo.rasx:=My_Toplivo.rasx+ww_rasx, My_Toplivo.Vid:=My_Toplivo.Vid+ww_vidt;
      }
      if My_Toplivo.Vid>0
      { vvv.update current My_Toplivo set My_Toplivo.NORMA:=round((My_Toplivo.rasx/My_Toplivo.Vid)*if(pos('(КМ)',ww_str2)>0,100,1),2)
      }

 end.
!=====================================  
.Function PrintNormKoef :boolean;
begin
  rowcur:=rowcur+1;
  ww_str:='' ;
  PrintNormKoef:=false;
  if xlGetCellValue(rowcur,1,ww_str) {}
  ww_str:=trim(ww_str)
  if ww_str<>'' then exit; //кончилась группа
  //if xlGetCellValue(rowcur,2,ww_str) {}
  //ww_str:=trim(ww_str)
  //if ww_str='' then exit; //кончилась группа
  ww_str:='';
  if xlGetCellValue(rowcur,7,ww_str) {}
  MyLogWrite('стр='+string(rowcur)+', '+ww_str)
  w_koef1:=round(iGsm_CalcNorm.Gsm_Calc_Norm(word(ww_str),vvv.PutGsm.Nrec),4);
  if abs(w_koef1)>0.001
  { xlSetRowHeight(if(abs(w_koef1)<0.01,0,12),rowcur,1,rowcur,255)
    MyXlWrite(string(w_koef1,0,3) ,rowcur,7,2)
  }  
  else
  { xlSetRowHeight(0,rowcur,1,rowcur,255)
  }
  PrintNormKoef:=true;
 end. 
!=====================================  
.Procedure PrintShap;
begin
 if kl_first
 { MyLogWrite('========открыли Excel==========')
   MyXlInit('Avto_putway_GSM_R.xls')
   rowcur:=0;
 }
 else
 { rowcur:=rowcur+3
   MyLogWrite('==========новый лист===========')
   xlRunMacro('Copy_Shap'+chr(40)+string(rowcur)+chr(41)) ;
   rowcur:=rowcur-1
   //message(rowcur)
 }
 kl_first:=false;
 CyberFleet_Toplivo();
 rowcur:=rowcur+2
 //MyXlWrite('CyberFleet (расход/пробег))' ,rowcur,4,3)
 //MyXlWrite(doubletostr(cf_putlst_fuel, '6666666666.88') ,rowcur,6,3)
 //MyXlWrite(doubletostr(cf_putlst_km, '6666666666.88') ,rowcur,7,3)

 rowcur:=rowcur+1
//НОМЕР ТС:
 MyXlWrite(vvv.transp.nomer ,rowcur,3,3)
//ДАТА ВЫПИСКИ ПЛ:
 MyXlWrite(DateToStr(vvv.PUTLST.DATPL,'DD/MM/YYYY') ,rowcur,7,3) // `
 rowcur:=rowcur+1
// ДАТА ПОСТУПЛЕНИЯ:
 DatAnal := if(vvv.getfirst katos=0,vvv.katos.datok,vvv.TRANSP.DATOK)
 MyXlWrite(if(longint(DatAnal)>0, string(DatAnal),'') ,rowcur,3,3)
//ДАТА ОБРАБОТКИ ПЛ:
 DatAnal := vvv.putlst.datobr
 MyXlWrite(if(longint(DatAnal)>0, string(DatAnal),'') ,rowcur,7,3)
 rowcur:=rowcur+1
//МАРКА:
 MyXlWrite(Marka ,rowcur,3,3)
//МАРКА ГСМ
 kl_norma:=true
 w_koef1:=0;
 
 if (vvv.getfirst NormGSM where (( 
   0 == NormGSM.WHATIS
  and 0 == NormGSM.CMARAVT 
  and Transp.Nrec == NORMGSM.CTRANSP 
   ))
  and ( NORMGSM.DATBEG=Date(0,0,0) or NORMGSM.DATBEG<=Putlst.Exitdn) 
  and ( NORMGSM.DATEND=Date(0,0,0) or NORMGSM.DATEND>=Putlst.Exitdn) 
  )  <>0
 { if (vvv.getfirst NormGSM where ((    0 == NormGSM.WHATIS
  and 0 == NormGSM.CMARAVT 
  and 0 == NormGSM.cTransp
  and  Transp.cMarka == NORMGSM.CMARKA(noindex)
   ))
    and ( NORMGSM.DATBEG=Date(0,0,0) or NORMGSM.DATBEG<=Putlst.Exitdn) 
    and ( NORMGSM.DATEND=Date(0,0,0) or NORMGSM.DATEND>=Putlst.Exitdn) 
   )  <>0
   { kl_norma:=false
   }
 }
 rowcur:=rowcur+1
 if kl_norma
 { if vvv.getfirst toplivo=0
   { MyXlWrite(vvv.toplivo.name ,rowcur,3,3)
   }
 }
 else
 { MyXlWrite('Нет действующей нормы!!' ,rowcur,3,3)
 }
 rowcur:=rowcur+1;
 if vvv.Putgsm.cAgregat>0
 { if vvv.getfirst Compon_Spec=0 {}
   if vvv.getfirst MarComp_Spec=0 {}
   MyXlWrite('Наименование агрегата : ' + vvv.MarComp_spec.name +' '+ vvv.Compon_Spec.NomComp,rowcur,1,3)
 }
 //Нормы расхода по транспортному средству:
 rowcur:=rowcur+1
 ww_k:=0
 do {
  ww_k:=ww_k+1
  if ww_k>100 then break;
  if not PrintNormKoef then break;
 } while true
 //Нормы расхода по специальному оборудованию:
 do {
  ww_k:=ww_k+1
  if ww_k>100 then break;
  if not PrintNormKoef then break;
 } while true
 //Коэффициенты, изменяющие базовую норму расхода транспортного средства в путевом листе :
 do {
  ww_k:=ww_k+1
  if ww_k>100 then break;
  if not PrintNormKoef then break;
 } while true
 //Коэффициенты на пробег и спецработу:
 do {
  ww_k:=ww_k+1
  if ww_k>100 then break;
  if not PrintNormKoef then break;
 } while true
 rowcur:=rowcur+4
 vvv.delete all My_Toplivo;
 w_itgsm:=0;ww_rasx_it:=0;

 end. 
!=====================================  
.fields
!Основной лист
 CommonFormHeader
 NameOrg
 Npl Seria
 DatPl datObr
 Gnom GarNom Marka Nmper
 Tabn1 FIO1 SummaOpl1 Tabn2 FIO2  SummaOpl2
 Tabn_St FIO_St SummaOpl_St
 ExitCh ExitDn SpeedExi
 ReturnCh ReturnDn SpeedRet
!время, пробег
 TimeAll TimeMove TimeStop TimeRep TimeLoad KolEz
 ProbegAll ProbegV ProbegGr Gruztn GruzTnKm
!топливо
 KodToplDvi ToplDvi OctatExiDvi  OctatRetDvi  VidanToplDvi  SdanToplDvi
 KofnIzmDvi NormaTopDvi  FaktTopDvi
 ZaprOrgDvi ZaprTimeDvi ZaprDateDvi  ZaprPriceDvi
 KodToplAvt ToplAvt OctatExiAvt  OctatRetAvt  VidanToplAvt  SdanToplAvt
 KofnIzmAvt NormaTopAvt  FaktTopAvt
 ZaprOrgAvt ZaprTimeAvt ZaprDateAvt  ZaprPriceAvt
 KodToplSp ToplSp OctatExiSp  OctatRetSp  VidanToplSp  SdanToplSp
 KofnIzmSp NormaTopSp  FaktTopSp
 ZaprOrgSp ZaprTimeSp ZaprDateSp  ZaprPriceSp
!прицепы
 TrlGnom1 TrlGnom2 ProbegGrPri GruzTnPri  GruzTnKmPri
.endfields
.begin
 kl_first:=true;
 InitServTxo(0);
// logfilekl:=true;
 end.
.{
.begin
 //================================
 if vvv.getfirst putlst=0 {}
 dtb:=vvv.putlst.EXITDN
 if vvv.getfirst transp=0 {}
 if vvv.getfirst putgsm=0 {}
 if vvv.getfirst Systran=0 {}
 DatSummer := vvv.Systran.Begsummer
 DatWinter := vvv.Systran.Begwinter
 if year(dtb)<>year(DatSummer)
 { DatSummer:=date(day(DatSummer),month(DatSummer),year(dtb))
   DatWinter:=date(day(DatWinter),month(DatWinter),year(dtb))
 }
 MylogWrite(vvv.PutLst.Npl)
  vvv._loop PutGsm
  { //if vvv.PutGSM.Normt=0 then continue;
    if vvv.getfirst gsmalg<>0 then continue
    if vvv.PutGsm.DpPokaz9 <> 0 then continue; // заправки не интересны
    MylogWrite('PutGsm.nrec = '+string(PutGsm.nrec))
    PrintShap;
    w_itgsm:=vvv.PutGsm.normt;
    ww_rasx_it:=0;
    ww_stralg:=upcase(vvv.GSMALG.STRALG)
    // убирем округление
    ww_stralg:=replace(ww_stralg,'ROUND(',''); 
    ww_stralg:=replace(ww_stralg,',1)',  '') //(
    ww_stralg:=replace(ww_stralg,',2)',      '') //
    ww_i:=0;
    do
    { ww_i:=ww_i+1
      ww_str:=trim(ExtractDelimitedWord(ww_stralg,ww_i,'+'))
      ww_column:=999
      ww_str1:='Прочие'
      ww_vidt:=0
      ww_rasx:=0
      ww_str2:=0;
      if ww_str='' then continue;
      ww_str:=upcase(ww_str)
      if pos('SUMALGCODE',ww_str)>0
      { ww_str1:=substr(ww_str,pos('[',ww_str)+1,100)
        ww_str1:=substr(ww_str1,1,pos(']',ww_str1)-1)
        wkod_alg:=word(ww_str1)
        ww_Rasx:=round(iGsm_CalcNorm.Gsm_Calc_Norm(wkod_alg,vvv.PutGsm.Nrec),4);
        ww_str1:=iGsm_CalcNorm.GetNameAlg(wkod_alg)
        ww_str2:=upcase(iGsm_CalcNorm.GetNameAlg_2(wkod_alg))
        ww_vidt:=iGsm_CalcNorm.GetPocazatelVal(wkod_alg)
        if ww_str1='Общий пробег'
        { ww_column:=0
        }
        else
        if ww_str1='Спец.оборуд.'
        { ww_column:=1
        }
        else
        if ww_str1='Прочие'
        { ww_column:=999
        }
        else
        { ww_column:=2;
        }
      }// if pos('SUMALGCODE',ww_str)>0
      if abs(ww_Rasx)<=0.0001 and ww_column>0 then continue;
      ww_str3:=iGsm_CalcNorm.GetFormula(wkod_alg)
      ww_str4:=iGsm_CalcNorm.GetFormulaNum(wkod_alg,vvv.putgsm.nrec)
      My_Toplivo_ADD
      ww_rasx_it:=ww_rasx_it+ww_rasx;
      wkl_baz:=true;
    } while ww_str<>''
    if abs(ww_rasx_it- vvv.PutGsm.normt)>0.1
    { ww_column:=999
      ww_str1:='Прочие'
      ww_str4:=''
      ww_vidt:=0 //My_WorkTable.PutLst_ProbegAll;
      ww_rasx:=vvv.PutGsm.normt-ww_rasx_it
      My_Toplivo_ADD

    } //if abs(ww_rasx_it- w_itgsm)>0.1
    HeaderStrCount:=rowcur;
    vvv._loop My_Toplivo ordered by index My_Toplivo_Index1
    { if abs(vvv.My_Toplivo.rasx)<0.005 then continue;
      rowcur:=rowcur+1; colcur:=1;
      if rowcur=HeaderStrCount+1
      { MyXlWrite(vvv.PutLst.NPL+if(vvv.PUTLST.NSERIA<>'','-'+vvv.PUTLST.NSERIA,'') ,rowcur,colcur,3)
      } else colcur:=2
      MyXlWrite(substr(vvv.My_Toplivo.PUTLST_NOMER,4,100),rowcur,colcur,3)//Вид расхода
      xlMergeCells(rowcur,colcur-1,rowcur,colcur+1)
      //colcur:=colcur+2
      //MyXlWrite(string(My_Toplivo.Vid  ,0,3),rowcur,colcur,2)//Значение показателя
      //MyXlWrite(string(My_Toplivo.Norma,0,3),rowcur,colcur,2)//Норма расхода, л/км
      xlMergeCells(rowcur,colcur,rowcur,colcur+3)
      colcur:=colcur+4
      MyXlWrite(string(My_Toplivo.Rasx ,0,3),rowcur,colcur,2)//Расход по норме, л
      //MyXlWrite(vvv.My_Toplivo.TOPLIVO_NAME,rowcur,colcur,3)//Расчёт нормы
      MyXlWrite(vvv.My_Toplivo.TOPLIVO_NAMEalg,rowcur,colcur,3)//вот теперь все полностью видно в этом поле
    } //vvv._loop My_Toplivo ordered by index My_Toplivo_Index1
    if HeaderStrCount+1<rowcur
    { xlMergeCells(HeaderStrCount+1,1,rowcur,1)
    }
    MyxlFrameCells(headerstrcount+1,1,rowcur,colcur-1,1 or 2 or 4 or 8 or 16 or 32);

    rowcur:=rowcur+1; colcur:=1;
    MyXlWrite('Итого нормативный расход топлива составляет',rowcur,colcur,3)					
    xlMergeCells(rowcur,1,rowcur,6)
    colcur:=7;
    MyXlWrite(string(w_itgsm,0,2),rowcur,colcur,2)//Расчёт нормы
    xlSetFontStyle(1, rowcur, 1, rowcur,colcur-1)
    xlSetbackcolor(0C0C0C0h, rowcur, 1,  rowcur, colcur-1)
    MyxlFrameCells(rowcur,1,rowcur,colcur-1,1 or 2 or 4 or 8 or 16 or 32);
    if transp.tiptc = 0
    {
      if transp.garnom <> ''
      {
        CyberFleet_Toplivo();
        rowcur:=rowcur+2; colcur:=1;
        MyXlWrite('Показатели CyberFleet за период с '+_DatetimeToStr(cf_dtbeg, 'DD.MM.YYYY HH:NN:SS')+
                                            ' по '+_DatetimeToStr(cf_dtend, 'DD.MM.YYYY HH:NN:SS'),rowcur,colcur,3)
        xlMergeCells(rowcur,1,rowcur,8)
        xlSetFontStyle(1, rowcur, 1, rowcur,8)
        xlSetbackcolor(0C0C0C0h, rowcur, 1,  rowcur, 8)
        rowcur:=rowcur+1; colcur:=1;
        MyXlWrite('Пробег' ,rowcur,5,3)
        MyXlWrite('Норма' ,rowcur,6,3)
        MyXlWrite('Расход' ,rowcur,7,3)
        rowcur:=rowcur+1; colcur:=1;
        MyXlWrite(doubletostr(cf_putlst_km, '6666666666.88') ,rowcur,5,3)
        MyXlWrite(doubletostr(cf_putlst_fuelkm, '6666666666.88') ,rowcur,6,3)
        MyXlWrite(doubletostr(cf_putlst_fuel, '6666666666.88') ,rowcur,7,3)
      }
      else
      {
        Message('Отсутствует гаражный номер автомобиля, данные из CyberFleet отражены не будут!')
      }

    }
  }//vvv_loop PutGsm
 //================================

 end.
^
────────────────────────────────────────────────────────────────────────────
Организация : @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
────────────────────────────────────────────────────────────────────────────
N  @@@@@@@@ Серия @@@@@@@@@@@@@ Дата выдачи @@@@@@@@@@@ обраб. @@@@@@@@@@@
гос.номер  @@@@@@@@@@@ гар. номер @@@@@@@@@@@
Марка @@@@@@@@@@@@@@@@@@@@@@@@@@@@@ тип @@@@@@@@@@@@@
┌────────┬───────┬─────────────────────────┬───────────┐
│        │ Таб.N │      Ф.И.О.             │  Сумма    │
├────────┼───────┼─────────────────────────┼───────────┤
│Водит. 1│@@@@@@@│@@@@@@@@@@@@@@@@@@@@@@@@@│&#&&&&&&.&&│
│Водит. 2│@@@@@@@│@@@@@@@@@@@@@@@@@@@@@@@@@│&#&&&&&&.&&│
│Стажер  │@@@@@@@│@@@@@@@@@@@@@@@@@@@@@@@@@│&#&&&&&&.&&│
└────────┴───────┴─────────────────────────┴───────────┘
────────────────────────────────────────────────────────────────────────────
   Выезд:    час  @@@@@@@@  день  @@@@@@@@@@  спидометр   &&#&&&&&&&
   Возврат:  час  @@@@@@@@  день  @@@@@@@@@@  спидометр   &&#&&&&&&&
────────────────────────────────────────────────────────────────────────────
       ────── Время (часы)    ──────
┌─────────┬──────────┬──────────┬──────────┬──────────┐
│ Всего   │Движен    │Простой   │Ремонт    │Пог/разг  │
├─────────┼──────────┼──────────┼──────────┼──────────┤
│&#&&&&.&&│&#&&&&&.&&│&#&&&&&.&&│&#&&&&&.&&│&#&&&&&.&&│
└─────────┴──────────┴──────────┴──────────┴──────────┘
┌─Ездки─┬─Пробег──┬─────────┬─────────┬ перевез─┬─выполнено─┐
│       │общий    │по маршр │с грузом │тн/пас   │т/км(пас/км│
├───────┼─────────┼─────────┼─────────┼─────────┼───────────┤
│&#&&&&&│&#&&&&.&&│&#&&&&.&&│&#&&&&.&&│&#&&&&.&&│&#&&&&.&&  │
└───────┴─────────┴─────────┴─────────┴─────────┴───────────┘
────────────────────────────────────────────────────────────────────────────
                           Горючее бак 1
┌───────┬───────────────────────┬───────┬───────┬───────┬───────┬─────┬───────┬───────┬───────────────────────┬──────┬──────────┬─────────┐
│ Код   │Наименование  горючего │ Остат.│ Остат.│ Выдано│ Сдано │Коэф.│ Норма │ Факт. │   Пункт заправки      │ Время│  Дата    │Стоимость│
│       │                       │ выезд │ возвр.│       │       │     │       │       │                       │      │          │         │
├───────┼───────────────────────┼───────┼───────┼───────┼───────┼─────┼───────┼───────┼───────────────────────┼──────┼──────────┼─────────┤
.{
│@@@@@@@│@@@@@@@@@@@@@@@@@@@@@@@│&#&&.&&│&#&&.&&│&#&&.&&│&#&&.&&│&#.&&│&#&&.&&│&#&&.&&│@@@@@@@@@@@@@@@@@@@@@@@│@@@@@@│@@@@@@@@@@│&&&&&#.&&│
.}
└───────┴───────────────────────┴───────┴───────┴───────┴───────┴─────┴───────┴───────┴───────────────────────┴──────┴──────────┴─────────┘

                           Горючее бак 2
┌───────┬───────────────────────┬───────┬───────┬───────┬───────┬─────┬───────┬───────┬───────────────────────┬──────┬──────────┬─────────┐
│ Код   │Наименование  горючего │ Остат.│ Остат.│ Выдано│ Сдано │Коэф.│ Норма │ Факт. │   Пункт заправки      │ Время│  Дата    │Стоимость│
│       │                       │ выезд │ возвр.│       │       │     │       │       │                       │      │          │         │
├───────┼───────────────────────┼───────┼───────┼───────┼───────┼─────┼───────┼───────┼───────────────────────┼──────┼──────────┼─────────┤
.{
│@@@@@@@│@@@@@@@@@@@@@@@@@@@@@@@│&#&&.&&│&#&&.&&│&#&&.&&│&#&&.&&│&#.&&│&#&&.&&│&#&&.&&│@@@@@@@@@@@@@@@@@@@@@@@│@@@@@@│@@@@@@@@@@│&&&&&#.&&│
.}
└───────┴───────────────────────┴───────┴───────┴───────┴───────┴─────┴───────┴───────┴───────────────────────┴──────┴──────────┴─────────┘

                           Горючее бак 3
┌───────┬───────────────────────┬───────┬───────┬───────┬───────┬─────┬───────┬───────┬───────────────────────┬──────┬──────────┬─────────┐
│ Код   │Наименование  горючего │ Остат.│ Остат.│ Выдано│ Сдано │Коэф.│ Норма │ Факт. │   Пункт заправки      │ Время│  Дата    │Стоимость│
│       │                       │ выезд │ возвр.│       │       │     │       │       │                       │      │          │         │
├───────┼───────────────────────┼───────┼───────┼───────┼───────┼─────┼───────┼───────┼───────────────────────┼──────┼──────────┼─────────┤
.{
│@@@@@@@│@@@@@@@@@@@@@@@@@@@@@@@│&#&&.&&│&#&&.&&│&#&&.&&│&#&&.&&│&#.&&│&#&&.&&│&#&&.&&│@@@@@@@@@@@@@@@@@@@@@@@│@@@@@@│@@@@@@@@@@│&&&&&#.&&│
.}
└───────┴───────────────────────┴───────┴───────┴───────┴───────┴─────┴───────┴───────┴───────────────────────┴──────┴──────────┴─────────┘
┌───────────────────┬───────────────────┬────────┬────────┬────────┐
│   Прицеп 1        │   Прицеп 2        │Пробег  │Перевез.│Выполн. │
│                   │                   │c грузом│ тонн   │ т/км   │
├───────────────────┼───────────────────┼────────┼────────┼────────┤
│@@@@@@@@@@@@@@@@@@ │@@@@@@@@@@@@@@@@@@ │&#&&&.&&│&#&&&.&&│&#&&&.&&│
└───────────────────┴───────────────────┴────────┴────────┴────────┘

────────────────────────────────────────────────────────────────────────────
.{
.}
.{
.{
.}
.{
.{
.}
.{
.}
.{
.}
.}
.{
.{
.}
.}
.{
.}

.}
.if brPutWay
.end
.}
.begin
 MyXLEnd;
 DoneServTxo;
 end.
.endform
