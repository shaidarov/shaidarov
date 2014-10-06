.LinkForm 'LimZapReceptGSM_PRM_Talon_L' prototype is 'LimZapReceptGSM'
.NameInList 'PRM Ведомость на отпуск ГСМ в талонах(на последнюю заправку)'
.F "NUL"
.var
wTabn_zapr :longint;
ved_nom :string
dt_ved  :date
itogo :double;
kl_first :Boolean;
need_print:Boolean;
w_Unit   : string;
.endvar
.var
  str:word;
  tmpstr:string;
  skomission: array [0..5] of string;  
  i:word;
  
  flOk:boolean;
  spodr:string ;
  w_it:double;
  w_gosnom:string;
  w_marka:string;
  wnpl,w_talon,wfio:string;
  w_ed,w_toplivo:string;
  piExtAttr: iExtAttr
.endvar
.create view tv3
as select catalogs.name,persons.fio from catalogs,persons where
 (('Главный инженер'==catalogs.name (noindex)
 and catalogs.nrec==persons.cbaseprof (noindex)));
#include MyGetInitial.frn 
#include Excel_Fun.frn 
.procedure MyxlAddRangeNameVar(w :string ; wrow:longint) ;
begin
 xlAddRangeName(w,wrow,3,wrow,3)
 end.
.create view vvv
var w_fio:string;
as select TOPLIVO.KODGSM
from TOPLIVO , TRANSP , PERSONS , LIMZAPH, LIMZAPL , LIMZAPL LIMZAPL01//(LIMZAPL04)
where (( MarkFuel  == TOPLIVO.NAME
and 'С' == persons.ISEMPLOYEE
and w_fio == persons.fio
And cogettune('MYORG') == TRANSP.CORG
and RegNum == TRANSP.NOMER
and dt_ved  == LIMZAPH.DATELIM(noindex)
and TRANSP.NREC == LIMZAPH.TEMP2(noindex)
and  LIMZAPH.NREC == LIMZAPL.CLIMZAP  
and TRANSP.NREC == LIMZAPL.cTRANSP(noindex)
//and dt_ved == LIMZAPL.DATEZAP
and double(AmountLiter) == LIMZAPL.kol(noindex)
and LIMZAPH.NREC == LIMZAPL01.CLIMZAP
)) ;
.Function GetTabnByFio(ww_fio:string): longint;
begin
  GetTabnByFio:=0
  vvv.w_fio := ww_fio
  if vvv.getfirst persons=0
     GetTabnByFio:=vvv.persons.tabnmb;
 end.
.Function MyUP(w:string):string;
begin
 MyUp:=Upcase(substr(w,1,1))+substr(w,2,200)
 end.

.begin
 kl_first :=false;
 w_it:=0
 flOk:=true;
 logfilekl:=false;
 flOk:=True;
 MyXlInit('Avto_AktSpisTalon.xls')
 if not xlSetActiveSheetByName('Gal_TblSheet')
 { message('Не найден лист "Gal_TblSheet"') ; 
  flOk:=false;
 }
 str:=2;
 HeaderStrCount:=1;
 rowcur:=HeaderStrCount+1;
 matrixkl:=MyXlCreaMatrix(100,20) ;
 wexcel_num_0:=1
 rowcur:=rowcur-1;
  w_gosnom:=''
  w_marka:=''
  w_toplivo:=''
  logfilekl:=true;
    InitServTxo(0);

 end.
.{
.{ CheckEnter LimZapH
.{ CheckEnter LimZapLFIOPers
.}
.{ CheckEnter LimZapL
.{ CheckEnter LimZapLCommiss
.}
.begin
 itogo:=0
 //ved_nom := NumReport
 dt_ved  := StrToDate(dCreateRep,'DD/MM/YYYY')
 //if vvv.getfirst LIMZAPH=0 {}
end.
.begin
  itogo:=itogo+ double(AmountLiter)
  if vvv.getfirst toplivo=0 
  {
  }

  if vvv.getfirst transp<>0 
  { mylogwrite('не нашли машину') 
  }
if vvv.getfirst LIMZAPH<>0 
{ mylogwrite('не нашли ведомость')
}
//mylogwrite('ведомость '+vvv.LIMZAPH.NUM)
ved_nom:=vvv.LIMZAPH.NUM
//if locase(Unit)='литр' Unit:='л' else Unit:='кг'
w_Unit:='л.'
need_print:=false;
vvv._loop limzapl
{ if vvv.getlast LIMZAPL01=0 and vvv.LIMZAPL01.nrec= vvv.LIMZAPL.nrec
  { need_print:=true;
    break;
  }
}
 end.
.{?internal;need_print;
.begin
   rowcur:=rowcur+1;colcur:=1;
  wfio:='';
  if vvv.getfirst putlst<>0
  { flOk:=false;
    MyLogwrite('нет путевого листа ')
  }
  else
  { wnpl:=vvv.putlst.npl
  }
  w_marka:=MarkaTC;
  if vvv.getfirst kndriver=0
  { wfio:=vvv.kndriver.name;
  }
  w_gosnom:=vvv.transp.nomer ;

  w_talon:=sTXOGetExtAttr('LIMZAPL','Номер талона',vvv.LIMZAPL.nrec)
  if w_talon=''
  { flOk:=false;
    MyLogwrite('нет номера талона')
  }
if flOk
{
 MyXlWrite(chr(39)+DateToStr(dt_ved, 'DD/MM/YYYY'),rowcur,colcur,3)//Дата выдачи 				
 MyXlWrite(string(AmountLiter,0,3),rowcur,colcur,2)//Кол-во горючего					
 MyXlWrite(chr(39)+w_talon,rowcur,colcur,3)//"Номер талона"						
 MyXlWrite(chr(39)+wnpl,rowcur,colcur,3)//№ путевого листа							
 MyXlWrite(MyGetInitial(wfio,False),rowcur,colcur,3)//Ф.И.О. Водителя							
 MyXlWrite('',rowcur,colcur,3)//Подпись получателя	
 w_it:=w_it+double(AmountLiter);
 inc(str);
}
 end.
.}
.}
.if LimZapReceptBrkPage
.end
.}
.}
.begin
 if matrixkl
 { MyxlWriteMatrix(rowcur) ;
   xlFreeMatrix ;
   matrixkl:=false;
 }

 if not xlSetActiveSheetByName('Gal_VarSheet')
 { message('Не найден лист "Gal_VarSheet"') ; 
  flOk:=false;
 }
 if flOk
 {
  xlSetCellStringValue(chr(39)+'ВЕДОМОСТЬ ВЫДАЧИ ГОРЮЧЕ-СМАЗОЧНЫХ МАТЕРИАЛОВ',2 , 3 ,2 ,3 );
  xlSetCellStringValue(DateToStr(cur_date, 'DD/MM/YYYY'),3 , 3 ,3 ,3 );
  MyXlWrite(NameOrg,4,3,3)
  MyXlWrite('',5,3,3) //
  MyXlWrite('',6,3,3) //KatOrg.OKPO
  MyXlWrite('',7,3,3) // KatOrg.OKONH
  MyXlWrite('',8,3,3) //KatOrg.Addr
  MyXlWrite(chr(39)+'',9,3,3) //KatPodr.Name
  MyXlWrite(DateToStr(dt_ved, 'DD/MM/YYYY'),10,3,3) //DTB
  MyXlWrite('',11,3,3) //DTE
  MyXlWrite(MyGetInitial('',false),12,3,3) //Podpis
  MyXlWrite(w_toplivo,13,3,3) //Vid_topliva
  MyXlWrite(string(w_it,0,2),14,3,2) //Itogo
  MyXlWrite(w_gosnom,15,3,3) //GOSNOM
  MyXlWrite(w_marka,16,3,3) //MARKA
  MyXlWrite(DateToStr(dt_ved, 'DD'),17,3,3) //DT_DAY
  MyXlWrite(DateToStr(dt_ved, 'mon'),18,3,3) //DT_MONTH
  MyXlWrite(DateToStr(dt_ved, 'YYYY'),19,3,3) //DT_YEAR

//==============
  do {
    if not xldelrangename(1)
    { break 
    }
 } while true 
MyxlAddRangeNameVar('GalDBVar_Title',2)
MyxlAddRangeNameVar('GalDBVar_DateRep',3)
MyxlAddRangeNameVar('GalDBVar_KatOrg.Name',4)
MyxlAddRangeNameVar('GalDBVar_KatOrg.UNN',5)
MyxlAddRangeNameVar('GalDBVar_KatOrg.OKPO',6)
MyxlAddRangeNameVar('GalDBVar_KatOrg.OKONH',7)
MyxlAddRangeNameVar('GalDBVar_KatOrg.Addr',8)
MyxlAddRangeNameVar('GalDBVar_KatPodr.Name',9)
MyxlAddRangeNameVar('GalDBVar_DTB',10)
MyxlAddRangeNameVar('GalDBVar_DTE',11)
MyxlAddRangeNameVar('GalDBVar_Podpis',12)
MyxlAddRangeNameVar('GalDBVar_Vid_topliva',13)
MyxlAddRangeNameVar('GalDBVar_Itogo',14)
MyxlAddRangeNameVar('GalDBVar_GOSNOM',15)
MyxlAddRangeNameVar('GalDBVar_MARKA',16)
MyxlAddRangeNameVar('GalDBVar_DT_DAY',17)
MyxlAddRangeNameVar('GalDBVar_DT_MONTH',18)
MyxlAddRangeNameVar('GalDBVar_DT_YEAR',19)

 
// формируем диапазрны для таблицы 
 if not xlSetActiveSheetByName('Gal_TblSheet')
 { message('Не найден лист "Gal_TblSheet"') ; 
  flOk:=false;
 }
 
  do {
    if not xldelrangename(1)
    { break 
    }
 } while true   
 str:=str-1 ;
 xlAddRangeName('GalDBTbl_Shinaf', 1, 1, str, 17);
//для полей  xlAddRangeName('GalDBTblFld_'+'', 1, npp, str, npp);
 xlAddRangeName('GalDBTblFld_'+'noma',1,1,str,1)	
 xlAddRangeName('GalDBTblFld_'+'nomb',1,2,str,2)
 xlAddRangeName('GalDBTblFld_'+'nomc',1,3,str,3)
 xlAddRangeName('GalDBTblFld_'+'nomd',1,4,str,4)
 xlAddRangeName('GalDBTblFld_'+'nome',1,5,str,5)
 xlAddRangeName('GalDBTblFld_'+'nomf',1,6,str,6)
 xlAddRangeName('GalDBTblFld_'+'nomg',1,7,str,7)
 xlAddRangeName('GalDBTblFld_'+'nomh',1,8,str,8)
 xlAddRangeName('GalDBTblFld_'+'nomi',1,9,str,9)
 xlAddRangeName('GalDBTblFld_'+'nomj',1,10,str,10)
 xlAddRangeName('GalDBTblFld_'+'nomk',1,11,str,11)
 xlAddRangeName('GalDBTblFld_'+'noml',1,12,str,12)
 xlAddRangeName('GalDBTblFld_'+'nomm',1,13,str,13)
 xlAddRangeName('GalDBTblFld_'+'nomn',1,14,str,14)
 xlAddRangeName('GalDBTblFld_'+'nomo',1,15,str,15)
 xlAddRangeName('GalDBTblFld_'+'nomp',1,16,str,16)
 xlAddRangeName('GalDBTblFld_'+'nomq',1,17,str,17)


  if (not xlAddInsInstal(TranslatePath('%ClientStartPath%') +'XLS\F_XlsRep\', 'GalRepBuilder') )
  {
    Message('Не найдена сервисная надстройка Excel '+'"GalRepBuilder"', Error);
  }
  else
  { xlRunMacro('LoadReport') ;
  }
 }   
 if not xlSetActiveSheetByName('Отчет')
 { message('Не найден лист "Отчет"') ; 
  flOk:=false;
 }
  XLGETACTIVEWORKBOOKNAME(wPictBook) ;
  fbasname:='VedTalon'+ved_nom ;
  fbasname:=replace(fbasname,'\','')
  fbasname:=replace(fbasname,'/','')
  fbasname:=replace(fbasname,'_','')
  fbasname:=replace(fbasname,'.','')
  fbasname:=replace(fbasname,':','')
  fbasname:=MyExDirectoryOut+fbasname+'.xls'
  if fileexist(fbasname) deletefile(fbasname)
  if not xlSaveAsWorkBookByName(wPictbook, fbasname)
  { 
    message('Не смогли сохранить книгу!');
  }
  logfilekl:=false;   
 MyXlEnd; 
 DoneServTxo
 end.
.endform
