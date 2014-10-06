/*
 ╔═══════════════════════════════════════════════════════════════════════════╗
 ║                     (c) 1994,97 корпорация ГАЛАКТИКА                      ║
 ║ Проект        : ГАЛАКТИКА                                                 ║
 ║ Система       : Автотранспорт                                             ║
 ║ Версия        : 5.00                                                      ║
 ║ Назначение    : Картотека агрегатов                                       ║
 ║ Ответственный : Лисица Наталья                                            ║
 ╚═══════════════════════════════════════════════════════════════════════════╝
 по меню внешние атрибуты
 dTXOGetExtAttr('MARCOMP','Дата закупки',<Nrec>)  - к марке
 dTXOGetExtAttr('MARCOMP','Дата изготовления',<Nrec>)  - к марке
 конфигуратором создать
 dTXOGetExtAttr('COMPON','Дата закупки',<Nrec>)  - к марке
 dTXOGetExtAttr('COMPON','Дата изготовления',<Nrec>)  - к марке
*/

.linkform 'kar_Agt_PRM_01' prototype is 'kar_Agt'
.NameInList 'Карточка аккумуляторной батареи(XLS) PRM'
.F "NUL"
.group 'Общие показатели'
.Defo Landscape
.var
 w_nomer:string;
  str:word;
  flOk:boolean;
  cnt: word ;
  i:word;
.endvar
.create view v1
as select katorg.name
from katorg,COMPON,MARCOMP,KATORG KATORG_IZG,SAVE_DRV,transp
where ((
  cogettune('myorg') == katorg.nrec
and 0 == COMPON.WHATIS  
and 0 == compon.ccompon
and w_nomer == COMPON.NOMCOMP
and  COMPON.CMARCOMP == MARCOMP.NREC
and  COMPON.IZGNREC==KATORG_IZG.NREC
and  compon.cavto == transp.nrec
and transp.nrec == SAVE_DRV.ctransp 
and transp.cmarka ==MARKA.nrec
and transp.cpodr == katpodr.nrec
));
#include excel_fun.frn
#include MyGetInitial.Frn
.procedure MyxlAddRangeNameVar(w :string ; wrow:longint) ;
begin
 xlAddRangeName(w,wrow,3,wrow,3)
 end. 
.fields
 CommonFormHeader
 Arch
 NameOrg CurDate

 VidAgr aNomAgt aNum aProbegGar aProbegExpl aMotoExpl aPrice


.endfields
.begin
 InitServTxo(0)
 end.
 Р^
                                    Картотека комплектующих ^
                                         по организации
                              @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
                                    на @@@@@@@@@@@@@@@@@@@@

.{
.begin
 w_nomer:=aNomAgt;
 flOk:=true
 MyXlInit('Avto_AkumKartUch.xls')
 rowcur:=1 ;
 rowcur:=rowcur+1
 matrixkl:=MyXlCreaMatrix(100,20) ;
 wexcel_num_0:=1
 rowcur:=rowcur-1

 if not xlSetActiveSheetByName('Gal_TblSheet')
 { message('Не найден лист "Gal_TblSheet"') ; 
   flOk:=false;
 }
 str:=2;

 end.

        Карточка учета комплектующей @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
                          номер  @@@@@@@@@@@@@@@@@@
        Размер ______ Модель _________  Заводской N @@@@@@@@@
                   Завод-изготовитель _________ ГОСТ ___________
Гарантийная норма пробега &&&&&&&.& Эксплуатационная норма пробега &&&&&&&.&
Эксплуатационная норма моточасов &&&&&&&&&&&&.&
Стоимость на момент закрепления &&&&&&&&&&&&.&
.if Ext_Atr
.{
.}
.end
.if Kar_Agt
─────────┬─────────┬──────────┬─────────┬────────┬────────┬──────────┬───────────┬──────────┬───────────┬────────────
   Гос.  │Гаражный │  Дата    │  Тип    │ Пробег │ Пробег │ Моточасы │ Моточасы  │   Дата   │   Тип     │ Источник
  номер  │  номер  │установки │(новый с │ общий  │ за ТС  │  общие   │  за ТС    │  снятия  │открепления│поступления
средства │средства │          │кап.рем) │        │        │          │           │          │           │
─────────┴─────────┴──────────┴─────────┴────────┴────────┴──────────┴───────────┴──────────┴───────────┴────────────
.{
.fields
 DaAvtoNom DaAvtoGNom DaDateOn DaStatus DaProbegn DaProbegF
 DaMotoSr DaMotoAll DaDateOff DaStatusO DaIst
.endfields
@@@@@@@@@ @@@@@@@@@ @@@@@@@@@@ @@@@@@@@@ @@@@@@@@ @@@@@@@@ @@@@@@@@@@ @@@@@@@@@@@ @@@@@@@@@@ @@@@@@@@@@@ @@@@@@@@@@@@
.begin
 str:=str+1;
 rowcur:=rowcur+1
 colcur:=1 ;
 MyXlWrite(DaDateOff ,rowcur,1,3) //Дата снятия АКБ с автомобиля	
 MyXlWrite(string(DaProbegF,0) ,rowcur,2,3) //Пробег автомобиля с данной АКБ, (км),	АКБ, поступившая на проведение регламентных работ		
 for(i:=3;i<15;i:=i+1)
   MyXlWrite('-' ,rowcur,i,3)
 MyXlWrite(DaStatusO ,rowcur,15,3) //Причина снятия АКБ с автомобиля  (ТО,ТР, восстановление, списание)	
 MyXlWrite(DaDateOn  ,rowcur,16,3) //Дата установки АКБ после ТО, ТР или восстановления	

 end.
.{
.}
.}
.end
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
.{ CheckEnter ComissKarAgt
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
 {if v1.getfirst COMPON=0 {}
  if v1.getfirst Katpodr=0 {}
  if v1.getfirst Katorg=0 {}
  if v1.getfirst Katorg_Izg=0 {}
  if v1.getfirst MARCOMP=0 {}
  if v1.getfirst transp=0 {}
  if v1.getfirst save_drv=0 {}
  if v1.getfirst marka=0 {}
  xlSetCellStringValue(chr(39)+' Новая, восстановленная, бывшая в употреблении (нужное подчеркнуть)',2,3,2,3)//Title
  xlSetCellStringValue(chr(39)+DateToStr(cur_date, 'DD mon YYYY г'),3 , 3 ,3 ,3 );//DateRep
  xlSetCellStringValue(chr(39)+string(v1.COMPON.nrec),4 , 3 ,4 ,3 );//Shinaf.Nrec
  xlSetCellStringValue(chr(39)+'',5 , 3 ,5 ,3 );//NSopr
  xlSetCellStringValue(chr(39)+'',6 , 3 ,6 ,3 );//dSopr
  xlSetCellStringValue(chr(39)+aNomAgt,7 , 3 ,7 ,3 );//Number
  xlSetCellStringValue(chr(39)+v1.Katorg.name,8 , 3 ,8 ,3 );//KatOrg.Name
  xlSetCellStringValue(chr(39)+v1.Katorg.UNN,9 , 3 ,9 ,3 );//KatOrg.UNN
  xlSetCellStringValue(chr(39)+v1.KatOrg.OKPO,10, 3 ,10,3 );//KatOrg.OKPO
  xlSetCellStringValue(chr(39)+v1.KatOrg.OKONH,11, 3 ,11,3 );//KatOrg.OKONH
  xlSetCellStringValue(chr(39)+v1.KatOrg.Addr,12, 3 ,12,3 );//KatOrg.Addr
  xlSetCellStringValue(chr(39)+v1.KatPodr.Name,13, 3 ,13,3 );//KatPodr.Name
  xlSetCellStringValue(chr(39)+v1.MARCOMP.NAME,14, 3 ,14,3 );//AKB_main
  xlSetCellStringValue(chr(39)+v1.COMPON.NOMCOMP+if(v1.COMPON.ZAVNUM<>'','/'+v1.COMPON.ZAVNUM,'')	,15, 3 ,15,3 );//AKB_nomer
  xlSetCellStringValue(chr(39)+DateToStr(dTXOGetExtAttr('COMPON','Дата изготовления',v1.COMPON.NREC),'DD/MM/YYYY'),16, 3 ,16,3 );//AKB_dtizg
  xlSetCellStringValue(chr(39)+v1.Transp.Nomer,17, 3 ,17,3 );//AKB_car
  xlSetCellStringValue(chr(39)+DateToStr(v1.COMPON.DATZAK,'DD/MM/YYYY'),18, 3 ,18,3 );//AKB_DtUst
  xlSetCellStringValue(chr(39)+v1.MARKA.NM,19, 3 ,19,3 );//Marka
  xlSetCellStringValue(chr(39)+v1.SAVE_DRV.fio,20, 3 ,20,3 );//Driver
  xlSetCellStringValue(chr(39)+v1.Transp.GarNom,21, 3 ,21,3 );//GosNom
//  xlSetCellStringValue(chr(39)+DateToStr(dTXOGetExtAttr('COMPON','Дата ввода',v1.COMPON.NREC),'DD/MM/YYYY'),22, 3 ,22,3 );//AKB_DtVvod
  xlSetCellStringValue(chr(39)+DateToStr(v1.COMPON.DATZAK,'DD/MM/YYYY'),22, 3 ,22,3 );//AKB_DtVvod=AKB_DtUst
  xlSetCellStringValue(chr(39)+string(v1.MARCOMP.IKSDNI/30,0,0),23, 3 ,23,3 );//AKB_norm_srok
  xlSetCellStringValue(chr(39)+string(v1.marcomp.IKSPR),24, 3 ,24,3 );//AKB_norm_km  - эксплуатационный пробег , г GARDNI
  xlSetCellStringValue(chr(39)+DateToStr(v1.COMPON.DATSP,'DD/MM/YYYY'),25, 3 ,25,3 );//AKB_dtspis
  xlSetCellStringValue(chr(39)+v1.katorg_izg.name,26, 3 ,26,3 );//AKB_izgotov v1.katorg_izg.shortname
//==============
  do {
    if not xldelrangename(1)
    { break 
    }
 } while true 
MyxlAddRangeNameVar('GalDBVar_Title',2)
MyxlAddRangeNameVar('GalDBVar_DateRep',3)
MyxlAddRangeNameVar('GalDBVar_Shinaf.Nrec',4)
MyxlAddRangeNameVar('GalDBVar_NSopr',5)
MyxlAddRangeNameVar('GalDBVar_dSopr',6)
MyxlAddRangeNameVar('GalDBVar_Number',7)
MyxlAddRangeNameVar('GalDBVar_KatOrg.Name',8)
MyxlAddRangeNameVar('GalDBVar_KatOrg.UNN',9)
MyxlAddRangeNameVar('GalDBVar_KatOrg.OKPO',10)
MyxlAddRangeNameVar('GalDBVar_KatOrg.OKONH',11)
MyxlAddRangeNameVar('GalDBVar_KatOrg.Addr',12)
MyxlAddRangeNameVar('GalDBVar_KatPodr.Name',13)
MyxlAddRangeNameVar('GalDBVar_AKB_main',14)
MyxlAddRangeNameVar('GalDBVar_AKB_nomer',15)
MyxlAddRangeNameVar('GalDBVar_AKB_dtizg',16)
MyxlAddRangeNameVar('GalDBVar_AKB_car',17)
MyxlAddRangeNameVar('GalDBVar_AKB_DtUst',18)
MyxlAddRangeNameVar('GalDBVar_Marka',19)
MyxlAddRangeNameVar('GalDBVar_Driver',20)
MyxlAddRangeNameVar('GalDBVar_GosNom',21)
MyxlAddRangeNameVar('GalDBVar_AKB_DtVvod',22)
MyxlAddRangeNameVar('GalDBVar_AKB_norm_srok',23)
MyxlAddRangeNameVar('GalDBVar_AKB_norm_km',24)
MyxlAddRangeNameVar('GalDBVar_AKB_dtspis',25)
MyxlAddRangeNameVar('GalDBVar_AKB_izgotov',26)

 
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
 if not xlSetActiveSheetByName('Отчет')
 { message('Не найден лист "Отчет"') ; 
  flOk:=false;
 }
  XLGETACTIVEWORKBOOKNAME(wPictBook) ;
  fbasname:='KAR_SHI_'+aNomAgt ;
  fbasname:=replace(fbasname,'\','')
  fbasname:=replace(fbasname,'/','')
  fbasname:=replace(fbasname,'_','')
  fbasname:=replace(fbasname,'.','')
  fbasname:=replace(fbasname,':','')
  fbasname:=MyExDirectoryOut+fbasname+'.xls'

 if fileexist(fbasname) deletefile(fbasname) 
 if fileexist(fbasname) deletefile(fbasname) 
 if xlSaveAsWorkBookByName(wPictbook, fbasname)
 { // xlCloseWorkBookByName(wPictBook) ;
 }
 If (not xlKillExcel) then message ('xlKillExcel=false');
 }
 end.
.} Р
.begin
 DoneServTxo;
 end.
.endform

