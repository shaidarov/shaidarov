/*
 浜様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様�
 �                     (c) 1994,97 ��牆���罔� ���������                      �
 � 蹍オ�        : ���������                                                 �
 � ��痰ガ�       : �≒�矗��甎�珥                                             �
 � �ム瓱�        : 5.00                                                      �
 � ��Л�腑�┘    : ��珥�皀�� ��爛��皰�                                       �
 � �癶モ痰▲��覃 : ��瓱�� �����跫                                            �
 藩様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様�
 �� �キ� ↓ヨ�┘ �矗─竄�
 dTXOGetExtAttr('MARCOMP','���� ���祚��',<Nrec>)  - � ��爲�
 dTXOGetExtAttr('MARCOMP','���� ├��皰←キ��',<Nrec>)  - � ��爲�
 ���筥ｃ��皰牀� 甌Г�碎
 dTXOGetExtAttr('COMPON','���� ���祚��',<Nrec>)  - � ��爲�
 dTXOGetExtAttr('COMPON','���� ├��皰←キ��',<Nrec>)  - � ��爲�
*/

.linkform 'kar_Agt_PRM_01' prototype is 'kar_Agt'
.NameInList '��珥�腦� ���祠祀閧�爿�� ����爛�(XLS) PRM'
.F "NUL"
.group '｡薑� ������皀��'
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
��^
                                    ��珥�皀�� �����オ矣鉗�� ^
                                         �� �爍��├�罔�
                              @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
                                    �� @@@@@@@@@@@@@@@@@@@@

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
 { message('�� ���ぅ� ��痰 "Gal_TblSheet"') ; 
   flOk:=false;
 }
 str:=2;

 end.

        ��珥�腦� 竍モ� �����オ矣鉗ォ @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
                          ���ム  @@@@@@@@@@@@@@@@@@
        ��Кム ______ ��ぅ�� _________  ��〓め��� N @@@@@@@@@
                   ��〓�-├��皰※皀�� _________ ���� ___________
�����皋���� ��爼� �牀．�� &&&&&&&.& ��甎�����罔����� ��爼� �牀．�� &&&&&&&.&
��甎�����罔����� ��爼� ��皰��甌� &&&&&&&&&&&&.&
�皰━�痰� �� ���キ� ���爛��キ�� &&&&&&&&&&&&.&
.if Ext_Atr
.{
.}
.end
.if Kar_Agt
陳陳陳陳賃陳陳陳陳賃陳陳陳陳陳堕陳陳陳陳堕陳陳陳賃陳陳陳陳堕陳陳陳陳賃陳陳陳陳陳賃陳陳陳陳陳堕陳陳陳陳陳堕陳陳陳陳陳�
   ���.  �����Ν覃 �  ����    �  �┓    � 蹍．� � 蹍．� � ��皰��瘠 � ��皰��瘠  �   ����   �   �┓     � �痰�膈┴
  ���ム  �  ���ム  潟痰���→� �(���覃 � � �♂┤  � �� ��  �  �♂┘   �  �� ��    �  甅閧��  凱皖爛��キ�鏗��痰祚�キ��
痼イ痰�� 梶爛め癶� �          蟹��.爛�) �        �        �          �           �          �           �
陳陳陳陳珍陳陳陳陳珍陳陳陳陳陳祖陳陳陳陳祖陳陳陳珍陳陳陳陳祖陳陳陳陳珍陳陳陳陳陳珍陳陳陳陳陳祖陳陳陳陳陳祖陳陳陳陳陳�
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
 MyXlWrite(DaDateOff ,rowcur,1,3) //���� 甅閧�� ��� � �≒���；��	
 MyXlWrite(string(DaProbegF,0) ,rowcur,2,3) //蹍．� �≒���；�� � ������ ���, (��),	���, ��痰祚│��� �� �牀▲ぅ�┘ 爛����キ皚諷 ��｀�		
 for(i:=3;i<15;i:=i+1)
   MyXlWrite('-' ,rowcur,i,3)
 MyXlWrite(DaStatusO ,rowcur,15,3) //踸腮�� 甅閧�� ��� � �≒���；��  (��,��, 〓瘁����←キ┘, 甎����┘)	
 MyXlWrite(DaDateOn  ,rowcur,16,3) //���� 竅����→� ��� ��甄� ��, �� ┼� 〓瘁����←キ��	

 end.
.{
.}
.}
.end
陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳�
.{ CheckEnter ComissKarAgt
.}
.begin
 if matrixkl
 { MyxlWriteMatrix(rowcur) ;
   xlFreeMatrix ;
   matrixkl:=false;
 }

 if not xlSetActiveSheetByName('Gal_VarSheet')
 { message('�� ���ぅ� ��痰 "Gal_VarSheet"') ; 
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
  xlSetCellStringValue(chr(39)+' �����, 〓瘁����←キ���, °∵�� � 祚�矗ァ�キ┬ (�礒��� ��ょム��竄�)',2,3,2,3)//Title
  xlSetCellStringValue(chr(39)+DateToStr(cur_date, 'DD mon YYYY �'),3 , 3 ,3 ,3 );//DateRep
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
  xlSetCellStringValue(chr(39)+DateToStr(dTXOGetExtAttr('COMPON','���� ├��皰←キ��',v1.COMPON.NREC),'DD/MM/YYYY'),16, 3 ,16,3 );//AKB_dtizg
  xlSetCellStringValue(chr(39)+v1.Transp.Nomer,17, 3 ,17,3 );//AKB_car
  xlSetCellStringValue(chr(39)+DateToStr(v1.COMPON.DATZAK,'DD/MM/YYYY'),18, 3 ,18,3 );//AKB_DtUst
  xlSetCellStringValue(chr(39)+v1.MARKA.NM,19, 3 ,19,3 );//Marka
  xlSetCellStringValue(chr(39)+v1.SAVE_DRV.fio,20, 3 ,20,3 );//Driver
  xlSetCellStringValue(chr(39)+v1.Transp.GarNom,21, 3 ,21,3 );//GosNom
//  xlSetCellStringValue(chr(39)+DateToStr(dTXOGetExtAttr('COMPON','���� □���',v1.COMPON.NREC),'DD/MM/YYYY'),22, 3 ,22,3 );//AKB_DtVvod
  xlSetCellStringValue(chr(39)+DateToStr(v1.COMPON.DATZAK,'DD/MM/YYYY'),22, 3 ,22,3 );//AKB_DtVvod=AKB_DtUst
  xlSetCellStringValue(chr(39)+string(v1.MARCOMP.IKSDNI/30,0,0),23, 3 ,23,3 );//AKB_norm_srok
  xlSetCellStringValue(chr(39)+string(v1.marcomp.IKSPR),24, 3 ,24,3 );//AKB_norm_km  - 蹣甎�����罔���覃 �牀．� , � GARDNI
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

 
// 筮爼�珮ガ え���о�� か� ��゛�肓 
 if not xlSetActiveSheetByName('Gal_TblSheet')
 { message('�� ���ぅ� ��痰 "Gal_TblSheet"') ; 
  flOk:=false;
 }
 
  do {
    if not xldelrangename(1)
    { break 
    }
 } while true   
 str:=str-1 ;
 xlAddRangeName('GalDBTbl_Shinaf', 1, 1, str, 17);
//か� ���ォ  xlAddRangeName('GalDBTblFld_'+'', 1, npp, str, npp);
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
   Message('�� ���ぅ�� 瓮燿�甅�� ��め矗���� Excel '+'"GalRepBuilder"', Error);
 }
 else
 { xlRunMacro('LoadReport') ;
 }  
 if not xlSetActiveSheetByName('�砒モ')
 { message('�� ���ぅ� ��痰 "�砒モ"') ; 
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
.}��
.begin
 DoneServTxo;
 end.
.endform

