.LinkForm 'SFO_DsdfsdfOLG_01A' Prototype is 'SFO_DOLGPROT'
.Group 'Расчет задолженности по начисленному проценту износа'
.NameInList 'ТНС. Справка о задолженности по СФО'
.var
  frmSum,dolgok:Double
  spcSum,sr_n,ost_pr,sum_nds,p_nds:Double
  Sum_frm_Spec,Sum_frm_Spec1,Sum_frm_Spec2:Double
  wRound:Word
  perssfo_nrec:comp
  zb:boolean
  sum_izn:double
.endvar

.Create view t1
as select
perssfo.nrec
from
     perssfo,
     mbpin,
     attrnam,
     attrval,
     attrnam attrnam1,
     attrval attrval1
where ((
             perssfo_nrec      == perssfo.nrec
        and  perssfo.CCURMBPIN == mbpin.nrec

        and  word(2001)       == AttrNam.wTable
        and  'Признак счета'  == AttrNam.Name
        and  word(2001)       == AttrVal.wTable
        and  mbpin.nrec       == AttrVal.cRec
        and  AttrNam.Nrec     == AttrVal.cAttrNam
        and  attrval.vcomp    == spkau.nrec

        and  word(2001)       == AttrNam1.wTable
        and  'Процент износа' == AttrNam1.Name
        and  word(2001)       == AttrVal1.wTable
        and  mbpin.nrec       == AttrVal1.cRec
        and  AttrNam1.Nrec     == AttrVal1.cAttrNam

      ))
;

.fields
  CommonFormHeader
  OrgName
  DateToStr( sprDate, 'DD')
  DateToStr( sprDate, 'Mon')
  DateToStr( sprDate, 'YYYY')
  FIO
  TabN
  Podr
  frName
  frKod
  frEd
  DateToStr( frGiveDate, 'DD/MM/YYYY')
  frKol
  frPrice
  if ( Longint( frEndDate) > 0, DateToStr( frEndDate, 'DD/MM/YYYY'), '')
  trim(string(ost_pr,100,2))
  dolgok
  Sum_frm_Spec1
  spName
  spKod
  spEd
  DateToStr( spGiveDate, 'DD/MM/YYYY')
  spKol
  spPrice
  if ( Longint( spEndDate) > 0, DateToStr( spEndDate, 'DD/MM/YYYY'), '')
  //if ( Word( spSrok) > 0, spPrice/Word( spSrok), 0)
  trim(string(ost_pr,100,2))
  dolgok
  Sum_frm_Spec2
.endfields
.function MY_ROUND(value: Double; tochn: Double; tip: Word): Double; // Функция округления для справки о задолженности;
var i: Integer;    // tip : 0 - округлять рл правилам, 1 - в большую сторону
var tmp: Double;  // value - что округлять, tochn - точность
begin

  if (tochn <> 0)
  {
    i := 0;
    my_Round := Value;
    tmp := tochn;

    Case tip Of
    //------------------
      0: if (tochn > 1)
         {
           do
           {
             i := i + 1;
             tochn := tochn / 10;
           }
           While tochn > 1

           my_Round := Round(Value, -i);
         }
         else
         {
           While tochn < 1
           do
           {
             i := i + 1;
             tochn := tochn * 10;
           }

           my_Round := Round(Value, i);
         }
    //------------------
      1: if (tochn > 1)
         {
           do
           {
             i := i + 1;
             tochn := tochn / 10;
           }
           While tochn > 1

           my_Round := Trunc(Value, -i);

           if ((Value - Trunc(Value, -i)) > 0)
             my_Round := my_Round + Tmp;
         }
         else
         {
           While tochn < 1
           do
           {
             i := i + 1;
             tochn := tochn * 10;
           }

           my_Round := Trunc(Value, i);

           if ((Value - Trunc(Value, i)) > 0)
             my_Round := my_Round + Tmp;
         }
    //------------------
      End; // case
  }
  else
    my_Round := Value;
end.
.function GETKOP( pSum : double) : String;
begin
  getKop := DoubleToStr( pSum, '\2p88');
end.

.fields
//  Round(sum_nds, 2)
//  DoubleToStr( Round(sum_nds, 2), '\2p\m4')
//  GetKop(Round(sum_nds, 2))
//  Round(Sum_frm_Spec, 2)+Round(sum_nds, 2)
//  DoubleToStr( Round(Sum_frm_Spec, 2)+Round(sum_nds,2), '\2p\m4')
//  GetKop(Round(Sum_frm_Spec, 2)+Round(sum_nds, 2))

sum_nds
DoubleToStr( sum_nds, '\2p\m4')
GetKop(sum_nds)
Sum_frm_Spec+sum_nds
DoubleToStr(Sum_frm_Spec+sum_nds, '\2p\m4')
GetKop(Sum_frm_Spec+sum_nds)

.endfields
.begin
  frmSum := 0;
  spcSum := 0;
  wRound := wGetTune ( 'Fin.ReportRound');
  p_nds:=dogettune('Nalog.Stav1');
end.
 ^
 ^

                                 СПРАВКА
                        о задолженности работника
                    по специальной (форменной) одежде
                             "^" ^ ^ г.

Фамилия Имя Отчество:  ^
Таб. номер: ^
Подразделение: ^
.{?internal;(frmFlag=True)

 Форменная одежда и обувь
 Р┌─────────────────────────┬────────────┬─────────┬──────────┬──────┬─────────────────┬──────────┬───────┬───────────────────┐
│                         │            │         │          │      │     Цена на     │   Срок   │ Остат │       Сумма       │
│       Наименование      │ Номенкл. № │ Ед.изм. │Дата выдач│Кол-во│      момент     │ окончания│   %   │    к удержанию    │
│                         │            │         │          │      │     расчета     │   носки  │       │                   │
├─────────────────────────┼────────────┼─────────┼──────────┼──────┼─────────────────┼──────────┼───────┼───────────────────┤
.{CheckEnter FRMDLGCIR
.begin
dolgok:=0;
ost_pr:=0;
perssfo_nrec:=frNrec;
if t1.getfirst perssfo = tsok
if t1.getfirst mbpin = tsok
 {
   sr_n:=0;

   if (t1.mbpin.DATEEKSP<>date(0,0,0) and t1.mbpin.DATEEND<>date(0,0,0))
    {
    sr_n:=Months_Between(t1.mbpin.DATEEKSP,t1.mbpin.DATEEND);
    }
    else
       {
        sr_n:=0;
       }

  zb := false;

  if sr_n<=12
   {
    zb:=true;
   }

  if t1.getfirst attrnam = tsok
   {
    if t1.getfirst attrval = tsok
     {
      if t1.getfirst spkau = tsok
       {
        if t1.spkau.code = '002'
         {
          zb:=true;
         }
         else
          {
           zb:=false;
          }
       }
     }
   }
 }
  sum_izn:=0;
  if zb
   {
    if t1.getfirst attrnam1 = tsok
     {
     if t1.getfirst attrval1 = tsok
      {
       sum_izn:=t1.attrval.vdouble*spKol*spPrice/100;
      }
     }
   }
   else
    {
     sum_izn:=t1.mbpin.SUMMAISNP;
    }

  dolgok:=frKol*frPrice-sum_izn-((frKol*frPrice-sum_izn)/Months_Between(t1.mbpin.DIN,t1.mbpin.DATEEND))*Months_Between(t1.mbpin.DIN,uvDate);
  ost_pr:=dolgok*100/(frKol*frPrice);


   if dolgok<0
    {
     dolgok:=0;
    }
   if ost_pr<0
    {
      ost_pr:=0;
    }
  dolgok := if (wRound <> 0, my_Round( dolgok, doGetTune( 'Fin.RoundRubDouble'), wRound - 1), dolgok);
  Sum_frm_Spec1 := Sum_frm_Spec1+dolgok;
  sum_nds      := sum_nds+if (wRound <> 0, my_Round( dolgok/100*p_nds, doGetTune( 'Fin.RoundRubDouble'), wRound - 1),dolgok/100*p_nds);
end.
│@@@@@@@@@@@@@@@@@@@@@@@@@│@@@@@@@@@@@@│@@@@@@@@@│@@@@@@@@@@│&#&&&&│&#'&&&&&&&&&&&.&&│@@@@@@@@@@│&#&&.&&│&#'&&&&&&&&&&&&&.&&│
.}
└─────────────────────────┴────────────┴─────────┴──────────┴──────┴─────────────────┴──────────┴───────┴───────────────────┘ Р
 С                                                                                                    Итого: &#'&&&&&&&&&&&.&& С
.}
.{?internal;(spcFlag=True)

 Специальная одежда и обувь
 Р┌─────────────────────────┬────────────┬─────────┬──────────┬──────┬─────────────────┬──────────┬───────┬───────────────────┐
│                         │            │         │          │      │     Цена на     │   Срок   │ Остат │       Сумма       │
│       Наименование      │ Номенкл. № │ Ед.изм. │Дата выдач│Кол-во│      момент     │ окончания│   %   │    к удержанию    │
│                         │            │         │          │      │     расчета     │   носки  │       │                   │
├─────────────────────────┼────────────┼─────────┼──────────┼──────┼─────────────────┼──────────┼───────┼───────────────────┤
.{CheckEnter SPCDLGCIR
.begin
dolgok:=0;
ost_pr:=0;
perssfo_nrec:=spNrec;
if t1.getfirst perssfo = tsok
if t1.getfirst mbpin = tsok
 {
   sr_n:=0;

   if (t1.mbpin.DATEEKSP<>date(0,0,0) and t1.mbpin.DATEEND<>date(0,0,0))
    {
    sr_n:=Months_Between(t1.mbpin.DATEEKSP,t1.mbpin.DATEEND);
    }
    else
       {
        sr_n:=0;
       }

  zb:=false;

  if sr_n<=12
   {
    zb:=true;
   }


  if t1.getfirst attrnam = tsok
   {
    if t1.getfirst attrval = tsok
     {
      if t1.getfirst spkau = tsok
       {
        if t1.spkau.code = '002'
         {
          zb:=true;
         }
         else
          {
           zb:=false;
          }
       }
     }
   }
 }
  sum_izn:=0;
  if zb
   {
    if t1.getfirst attrnam1 = tsok
     {
     if t1.getfirst attrval1 = tsok
      {
       sum_izn:=t1.attrval.vdouble*spKol*spPrice/100;
      }
     }
   }
   else
    {
     sum_izn:=t1.mbpin.SUMMAISNP;
    }

  dolgok:=spKol*spPrice-sum_izn-((spKol*spPrice-sum_izn)/Months_Between(t1.mbpin.DIN,t1.mbpin.DATEEND))*Months_Between(t1.mbpin.DIN,uvDate);
  ost_pr:=dolgok*100/(spKol*spPrice);

   if dolgok<0
    {
     dolgok:=0;
    }
   if ost_pr<0
    {
      ost_pr:=0;
    }

  dolgok := if (wRound <> 0, my_Round( dolgok, doGetTune( 'Fin.RoundRubDouble'), wRound - 1), dolgok);
  Sum_frm_Spec2 := Sum_frm_Spec2+dolgok;
  sum_nds      := sum_nds+if (wRound <> 0, my_Round( dolgok/100*p_nds, doGetTune( 'Fin.RoundRubDouble'), wRound - 1),dolgok/100*p_nds);

end.
│@@@@@@@@@@@@@@@@@@@@@@@@@│@@@@@@@@@@@@│@@@@@@@@@│@@@@@@@@@@│&#&&&&│&#'&&&&&&&&&&&.&&│@@@@@@@@@@│&#&&.&&│&#'&&&&&&&&&&&&&.&&│
.}
└─────────────────────────┴────────────┴─────────┴──────────┴──────┴─────────────────┴──────────┴───────┴───────────────────┘ Р
 С                                                                                                    Итого: &#'&&&&&&&&&&&.&& С
.}
.begin
Sum_frm_Spec:=Sum_frm_Spec1+Sum_frm_Spec2;
end.
 ССумма НДС : &#'&&&&&&&&&&&.&& ( ^руб. ^ коп.) С

 СИтого к удержанию : &#'&&&&&&&&&&&.&& ( ^руб. ^ коп.) С

Главный бухгалтер ______________________

.endform
