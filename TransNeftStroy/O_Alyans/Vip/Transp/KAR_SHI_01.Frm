/*
����⥪� 設 - �����
*/
.LinkForm 'KAR_SHI_PRM_01' Prototype is 'KAR_SHI'
.Group '��騥 ������⥫�'
.NameInList '����窠 ��� ࠡ��� ��⮬����쭮� 設� XLS(PRM)'
.F "NUL"
.var
  str:word;
  flOk:boolean;
  cnt: word ;
  iCommission : Commission;
  �।ᥤ�⥫�_�����ᨨ_���������: string;
  �।ᥤ�⥫�_�����ᨨ_nRec :comp ;
  �।ᥤ�⥫�_�����ᨨ_���: string;
  �����_童��_�����ᨨ: integer;
  ����_�����ᨨ_���������: string;
  ����_�����ᨨ_���: string;
  ������⢮_童���_�����ᨨ:integer ;
  it_probeg_d , it_probeg_mon, it_probeg_all : double ;
.endvar 
#include excel_fun.frn
#include MyGetInitial.Frn
#include Avto_Shina.Frn
.fields
  CommonFormHeader
  Arch
  NomShin
  MarkaShin
  ProbegAll
  GarProbeg
  IksProbeg
  Cur_AvtoGnom
  AvtoGnom
  TipDvi
  DatZak
  DatSisan
  ProbegZap
  ProbegAvto
.endfields
.begin
 iCommission.InitCommission(204);
 iCommission.RunWindowSelection(0);

 end.
.{
.begin
 vShinaf.w_nomer:=NomShin
 if vShinaf.getfirst Shinaf_M=0 {}
  
 flOk:=true
 MyXlInit('Avto_ShinaKartUch.xls')
 rowcur:=1 ;
 rowcur:=rowcur+1
 matrixkl:=MyXlCreaMatrix(100,20) ;
 wexcel_num_0:=1
 rowcur:=rowcur-1

 if not xlSetActiveSheetByName('Gal_TblSheet')
 { message('�� ������ ���� "Gal_TblSheet"') ; 
   flOk:=false;
 }
 str:=2;

 end.
^
       ��ࠢ�� � �������� 設� ^
������������������������������������������������Ŀ
�@@@@@@@@@�@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@�
������������������������������������������������Ĵ
���騩    ���࠭�.  ���ᯫ��.� ����� �।�⢠   �
������������������������������������������������Ĵ
�&&&&&&.& �&&&&&&.& �&&&&&&&.&�  @@@@@@@@@@@@@   �
��������������������������������������������������
.if KAR_SHI
�����������������������������������������������������������������������Ŀ
������    �    ���      �   ���   �   ���   ���騩 �஡���   �஡��   �
�         � ��९����� ����९���.� ᯨᠭ�� �            � �� ��-���  �
�����������������������������������������������������������������������Ĵ
.{
�@@@@@@@@@�@@@@@@@@@@@@@�@@@@@@@@@@�@@@@@@@@@@�&&&&&&&&.&& �&&&&&&&&.&& �
.{
.}
.begin
 str:=str+1;
 rowcur:=rowcur+1
 colcur:=1 ;
 MyXlWrite(AvtoGnom ,rowcur,colcur,3) //nom_avto	
 MyXlWrite(DatZak ,rowcur,colcur,3) //dt_ust	
 MyXlWrite(DatSisan ,rowcur,colcur,3) //dt_spis	
 MyXlWrite(ProbegAvto ,rowcur,colcur,3) //probeg_d	
 w_RegNum:=AvtoGnom
 var probeg_mes:double;
 probeg_mes:=0;
 w_izgName:='';
 if vShinaf.getfirst Transp=0 
 { if vShinaf.getlast Shinaf where (( Shinaf_M.nrec == Shinaf.cShinaf
    and Transp.nrec == Shinaf.cTransp ))=0
   { //w_izgName:='���.��⥪�� '+string(vShinaf.Shinaf.PGP,0,1) 
     w_izgName:='���.��⥪�� '; //+string(vShinaf.Shinaf.PGP,0,1) 
   }
   vPutLst.wc_Transp:=vShinaf.Transp.nrec
   vPutLst.w_dtb:=StrToDate(DatZak,'DD/MM/YYYY')
   vPutLst.w_dte:=StrToDate(DatSisan,'DD/MM/YYYY')
   if vPutLst.w_dtb<date(1,month(cur_date),year(cur_date))
     vPutLst.w_dtb:=date(1,month(cur_date),year(cur_date))
   if vPutLst.w_dte=date(0,0,0)
     vPutLst.w_dte:=date(last_day(vPutLst.w_dtb),month(cur_date),year(cur_date))
   else
   { if vPutLst.w_dte<vPutLst.w_dtb
       vPutLst.w_dtb:=date(0,0,0)
   }
   if vPutLst.w_dtb<>date(0,0,0)  
   { vPutLst._loop PutLst
     { probeg_mes:=probeg_mes+vPutLst.PutLst.PROBEGALL
     }  
   }  
 } //if vShinaf.getfirst Transp=0 
 MyXlWrite(string(probeg_mes,0,0) ,rowcur,colcur,3) //probeg_mes	
 MyXlWrite(ProbegZap ,rowcur,colcur,3) //probeg_all	
 MyXlWrite(w_izgName ,rowcur,colcur,3) //sost	
 MyXlWrite(TipDvi ,rowcur,colcur,3) //prich_spis	
 MyXlWrite('' ,rowcur,colcur,3) //podpis
    
 end.
.}
�������������������������������������������������������������������������
.else
.end
-----------------------------------------------------------------------
.begin
 if matrixkl
 { MyxlWriteMatrix(rowcur) ;
   xlFreeMatrix ;
   matrixkl:=false;
 }

 if not xlSetActiveSheetByName('Gal_VarSheet')
 { message('�� ������ ���� "Gal_VarSheet"') ; 
  flOk:=false;
 }
 if flOk
 {if vShinaf.getfirst Shinaf=0 {}
  if vShinaf.getfirst Katpodr=0 {}
  if vShinaf.getfirst Katorg=0 {}
  if vShinaF.getfirst MARSHIN=0 {}
  if v1.getfirst Katorg=0 {}
  xlSetCellStringValue(chr(39)+' �����, ����⠭��������, ���� � 㯮�ॡ����� (�㦭�� ����ભ���)',2,3,2,3)//Title
  xlSetCellStringValue(chr(39)+DateToStr(cur_date, 'DD mon YYYY �'),3 , 3 ,3 ,3 );//DateRep
  xlSetCellStringValue(chr(39)+string(vShinaf.Shinaf_M.nrec),4 , 3 ,4 ,3 );//Shinaf.Nrec
  xlSetCellStringValue(chr(39)+'',5 , 3 ,5 ,3 );//NSopr
  xlSetCellStringValue(chr(39)+'',6 , 3 ,6 ,3 );//dSopr
  xlSetCellStringValue(chr(39)+NomShin,7 , 3 ,7 ,3 );//Number
  xlSetCellStringValue(chr(39)+v1.Katorg.name,8 , 3 ,8 ,3 );//KatOrg.Name
  xlSetCellStringValue(chr(39)+v1.Katorg.UNN,9 , 3 ,9 ,3 );//KatOrg.UNN
  xlSetCellStringValue(chr(39)+v1.KatOrg.OKPO,10, 3 ,10,3 );//KatOrg.OKPO
  xlSetCellStringValue(chr(39)+v1.KatOrg.OKONH,11, 3 ,11,3 );//KatOrg.OKONH
  xlSetCellStringValue(chr(39)+v1.KatOrg.Addr,12, 3 ,12,3 );//KatOrg.Addr
  xlSetCellStringValue(chr(39)+vShinaF.KatPodr.Name,13, 3 ,13,3 );//KatPodr.Name
  xlSetCellStringValue(chr(39)+vShinaF.MARSHIN.IZGNAME,14, 3 ,14,3 );//S_Razmer
  xlSetCellStringValue(chr(39)+vShinaF.MARSHIN.MODSHIN,15, 3 ,15,3 );//S_Model
  xlSetCellStringValue(chr(39)+if(vShinaf.getfirst katmc=0,vShinaf.katmc.gost,''),16, 3 ,16,3 );//S_GOST
  xlSetCellStringValue(chr(39)+'',17, 3 ,17,3 );//SER_NOM
  xlSetCellStringValue(chr(39)+vShinaF.katorg.name,18, 3 ,18,3 );//S_IZG
  w_dt:=date(0,0,0)
  if vShinaf.getfirst katparty=0
  { w_dt:=StrToDate(_DateTimeToStr (vShinaf.katparty.CREATEDATETIME,'DD/MM/YYYY'),'DD/MM/YYYY')
  }
  else
  {  w_dt:=cur_date;
    if vShinaf.getfirst Shinaf=0
      w_dt:=vShinaf.Shinaf.DATZAK
  }
  xlSetCellStringValue(chr(39)+DateToStr(w_dt,'DD/MM/YYYY'),19, 3 ,19,3 );//S_DATPOS
  xlSetCellStringValue(chr(39)+GetDolgByFioC(coGetTune('RARS_TRANSP_SHINA_OTV')),20, 3 ,20,3 );//S_Otv_dolg
  xlSetCellStringValue(chr(39)+MyGetInitial(sGetTune('RARS_TRANSP_SHINA_OTV'),true),21, 3 ,21,3 );//S_Otv_Fio v1.persons.fio
  xlSetCellStringValue(chr(39)+'',22, 3 ,22,3 );//S_vivod1
  xlSetCellStringValue(chr(39)+'',23, 3 ,23,3 );//S_vivod2

  ������⢮_童���_�����ᨨ:=iCommission.GetComponentsCount ;
  xlSetCellStringValue(������⢮_童���_�����ᨨ,24,3,24,3);
  �।ᥤ�⥫�_�����ᨨ_���������:= iCommission.GetComponentPost(0);
  �।ᥤ�⥫�_�����ᨨ_��� := iCommission.GetComponentFIO(0) ;
  �।ᥤ�⥫�_�����ᨨ_nRec:= iCommission.GetComponentNRec(0);
  xlSetCellStringValue(chr(39)+�।ᥤ�⥫�_�����ᨨ_���������,35,3,35,3);
  xlSetCellStringValue(chr(39)+MyGetInitial(�।ᥤ�⥫�_�����ᨨ_���,true),25,3,25,3);
  �����_童��_�����ᨨ:=0;
  while (�����_童��_�����ᨨ < ������⢮_童���_�����ᨨ) do
  { �����_童��_�����ᨨ:=�����_童��_�����ᨨ+1;
    ����_�����ᨨ_��������� := iCommission. GetComponentPost(�����_童��_�����ᨨ);
    ����_�����ᨨ_���       := iCommission. GetComponentFIO (�����_童��_�����ᨨ);
    xlSetCellStringValue(chr(39)+MyGetInitial(����_�����ᨨ_���,true),25+�����_童��_�����ᨨ , 3 ,25+�����_童��_�����ᨨ ,3 );
    //tv1.persnrec:=iCommission.GetComponentNRec(�����_童��_�����ᨨ);
    xlSetCellStringValue(chr(39)+����_�����ᨨ_���������,35+�����_童��_�����ᨨ , 3 ,35+�����_童��_�����ᨨ ,3 );
  }

 }
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
MyxlAddRangeNameVar('GalDBVar_S_Razmer',14)
MyxlAddRangeNameVar('GalDBVar_S_Model',15)
MyxlAddRangeNameVar('GalDBVar_S_GOST',16)
MyxlAddRangeNameVar('GalDBVar_SER_NOM',17)
MyxlAddRangeNameVar('GalDBVar_S_IZG',18)
MyxlAddRangeNameVar('GalDBVar_S_DATPOS',19)
MyxlAddRangeNameVar('GalDBVar_S_Otv_dolg',20)
MyxlAddRangeNameVar('GalDBVar_S_Otv_Fio',21)
MyxlAddRangeNameVar('GalDBVar_S_vivod1',22)
MyxlAddRangeNameVar('GalDBVar_S_vivod2',23)
MyxlAddRangeNameVar('GalDBVar_������',24)
MyxlAddRangeNameVar('GalDBVar_���1',25)
MyxlAddRangeNameVar('GalDBVar_���2',26)
MyxlAddRangeNameVar('GalDBVar_���3',27)
MyxlAddRangeNameVar('GalDBVar_���4',28)
MyxlAddRangeNameVar('GalDBVar_���5',29)
MyxlAddRangeNameVar('GalDBVar_���6',30)
MyxlAddRangeNameVar('GalDBVar_���7',31)
MyxlAddRangeNameVar('GalDBVar_���8',32)
MyxlAddRangeNameVar('GalDBVar_���9',33)
MyxlAddRangeNameVar('GalDBVar_���10',34)
MyxlAddRangeNameVar('GalDBVar_��������1',35)
MyxlAddRangeNameVar('GalDBVar_��������2',36)
MyxlAddRangeNameVar('GalDBVar_��������3',37)
MyxlAddRangeNameVar('GalDBVar_��������4',38)
MyxlAddRangeNameVar('GalDBVar_��������5',39)
MyxlAddRangeNameVar('GalDBVar_��������6',40)
MyxlAddRangeNameVar('GalDBVar_��������7',41)
MyxlAddRangeNameVar('GalDBVar_��������8',42)
MyxlAddRangeNameVar('GalDBVar_��������9',43)
MyxlAddRangeNameVar('GalDBVar_��������10',44)

 
// �ନ�㥬 �������� ��� ⠡���� 
 if not xlSetActiveSheetByName('Gal_TblSheet')
 { message('�� ������ ���� "Gal_TblSheet"') ; 
  flOk:=false;
 }
 
  do {
    if not xldelrangename(1)
    { break 
    }
 } while true   
 str:=str-1 ;
 xlAddRangeName('GalDBTbl_Shinaf', 1, 1, str, 15);
//��� �����  xlAddRangeName('GalDBTblFld_'+'', 1, npp, str, npp);
xlAddRangeName('GalDBTblFld_'+'nom_avto',1,1,str,1)	
xlAddRangeName('GalDBTblFld_'+'dt_ust',1,2,str,2)	
xlAddRangeName('GalDBTblFld_'+'dt_spis',1,3,str,3)	
xlAddRangeName('GalDBTblFld_'+'probeg_d',1,4,str,4)
xlAddRangeName('GalDBTblFld_'+'probeg_mes',1,5,str,5)
xlAddRangeName('GalDBTblFld_'+'probeg_all',1,6,str,6)
xlAddRangeName('GalDBTblFld_'+'sost',1,7,str,7)
xlAddRangeName('GalDBTblFld_'+'prich_spis',1,8,str,8)
xlAddRangeName('GalDBTblFld_'+'podpis',1,9,str,9)


 if (not xlAddInsInstal(TranslatePath('%ClientStartPath%') +'XLS\F_XlsRep\', 'GalRepBuilder') )
 {
   Message('�� ������� �ࢨ᭠� �����ன�� Excel '+'"GalRepBuilder"', Error);
 }
 else
 { xlRunMacro('LoadReport') ;
 }  
 if not xlSetActiveSheetByName('����')
 { message('�� ������ ���� "����"') ; 
  flOk:=false;
 }
  XLGETACTIVEWORKBOOKNAME(wPictBook) ;
  fbasname:='KAR_SHI_'+NomShin+'_'+MarkaShin ;
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


 end.
.}
.endform
