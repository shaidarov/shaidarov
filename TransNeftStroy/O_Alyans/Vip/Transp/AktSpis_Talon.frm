#include Commission.frn
.linkform 'AktSpisTalon_01' prototype is printaktspis
.nameinlist '��� � �������� ������� �� ⮯���� (�� �ਬ���)'
.F "NUL"
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
.create view vvv
var wcrec:comp;
from putlst,kndriver,toplivo, katmc ,spsopr,katsopr
where ((comp(�४���㬥��)==katsopr.nrec
and comp(SpSoprnRec) == spsopr.nrec
and wcrec == PutLst.nrec
and wcrec == Toplivo.nrec
and Toplivo.cVidGsm == VidGsm.nrec
and PutLst.cTransp == Transp.nrec
and Transp.cmarka == Marka.nrec
and PUTLST.CPAKETPL==KNDRIVER.NREC
));
.create view tv3
as select catalogs.name,persons.fio from catalogs,persons where
 (('������ �������'==catalogs.name (noindex)
 and catalogs.nrec==persons.cbaseprof (noindex)));
#include MyGetInitial.frn 
#include Excel_Fun.frn 
.procedure MyxlAddRangeNameVar(w :string ; wrow:longint) ;
begin
 xlAddRangeName(w,wrow,3,wrow,3)
 end.
.begin
  InitServTxo(0) 
end.
#CommissionLinkVar
.{
#CommissionLinkInit(printaktspis)
.{
.}
.begin
 w_it:=0
 flOk:=true;
 logfilekl:=false;
 flOk:=True;
 MyXlInit('Avto_AktSpisTalon.xls')
 if not xlSetActiveSheetByName('Gal_TblSheet')
 { message('�� ������ ���� "Gal_TblSheet"') ; 
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
 end.
.{
.begin
  rowcur:=rowcur+1;colcur:=1;
  if vvv.getfirst spsopr=0 {}
  if vvv.getfirst katsopr=0 {}
  wnpl:=''; w_talon:=''; 
  wfio:='';
  vvv.wcrec:=coTXOGetExtAttr('KATMC','��_���_�����_⮯�����',vvv.spsopr.cmcusl)
  if vvv.getfirst Toplivo<>0
  {  flOk:=false;
     MyLogwrite('� ����樨 '+string(vvv.spsopr.npp)+' � �� ��� ��ਡ�� "��_���_�����_⮯�����"')
  }
  else
  { if w_toplivo<>''
    { if w_toplivo<>vvv.Toplivo.name
      { flOk:=false;
        MyLogwrite('� ����樨 '+string(vvv.spsopr.npp)+' ��� ⮯���� �� ࠢ�� �।.'+vvv.Toplivo.name)
      }
    }
    else
    { w_toplivo:=vvv.Toplivo.name
    }  
  }
  if w_ed=''
  { w_ed:=���᪭��_������_����७��
  }
  else
  { if w_ed<>���᪭��_������_����७��
    { flOk:=false;
      MyLogwrite('� ����樨 '+string(vvv.spsopr.npp)+' �� � ��.����७�� '+���᪭��_������_����७��)
    }  
  }
  vvv.wcrec:=coTXOGetExtAttr('SPSOPR','��_���_�����_��⥢���',vvv.spsopr.nrec)
  if vvv.getfirst putlst<>0
  { flOk:=false;
    MyLogwrite('� ����樨 '+string(vvv.spsopr.npp)+' ��� ��⥢��� ���� ')
  }
  else
  { wnpl:=vvv.putlst.npl
  }
  if vvv.getfirst transp<>0
  {
  }
  else
  { 
    if w_gosnom<>''
    { if w_gosnom<>vvv.transp.nomer
      { flOk:=false;
        MyLogwrite('� ����樨 '+string(vvv.spsopr.npp)
        +' ��⥢�� ���� �� ����� ��設� '+vvv.transp.nomer+', ���� �� '+w_gosnom)
      }
    }
    else
    { w_gosnom:=vvv.transp.nomer ;
   //   function coSetAttr(_wTable : word; _cRec : comp; _Name : string; _Val : comp; _ValStr : string) : boolean;
      if piExtAttr.coGetAttr(coKatsopr,vvv.katsopr.nrec,'��_��')<>vvv.transp.nrec
       PiExtAttr.coSetAttr(coKatsopr,vvv.katsopr.nrec,'��_��',vvv.transp.nrec,vvv.transp.nomer)
    }
    if vvv.getfirst marka=0  w_marka:=vvv.marka.nm;
  }
  if vvv.getfirst kndriver=0
  { wfio:=vvv.kndriver.name;
  }
  w_talon:=sTXOGetExtAttr('SPSOPR','��_���_�����_⠫���',vvv.spsopr.nrec)
  if w_talon=''
  { flOk:=false;
    MyLogwrite('� ����樨 '+string(vvv.spsopr.npp)+' ��� ����� ⠫���')
  }
if flOk
{
 MyXlWrite(chr(39)+DateToStr(���, 'DD/MM/YYYY'),rowcur,colcur,3)//��� �뤠� 				
 MyXlWrite(string(������⢮,0,3),rowcur,colcur,2)//���-�� ����祣�					
 MyXlWrite(chr(39)+w_talon,rowcur,colcur,3)//"����� ⠫���"						
 MyXlWrite(chr(39)+wnpl,rowcur,colcur,3)//� ��⥢��� ����							
 MyXlWrite(MyGetInitial(wfio,False),rowcur,colcur,3)//�.�.�. ����⥫�							
 MyXlWrite('',rowcur,colcur,3)//������� �����⥫�	
 w_it:=w_it+������⢮;
 inc(str);
}
 end.
.}
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
 {
  xlSetCellStringValue(chr(39)+'��������� ������ ������-��������� ����������',2 , 3 ,2 ,3 );
  xlSetCellStringValue(DateToStr(cur_date, 'DD/MM/YYYY'),3 , 3 ,3 ,3 );
  MyXlWrite(�࣠������,4,3,3)
  MyXlWrite(���,5,3,3) //
  MyXlWrite(����,6,3,3) //KatOrg.OKPO
  MyXlWrite(���_OKONH,7,3,3) // KatOrg.OKONH
  MyXlWrite(���_����,8,3,3) //KatOrg.Addr
  MyXlWrite(chr(39)+�����,9,3,3) //KatPodr.Name
  MyXlWrite(DateToStr(���, 'DD/MM/YYYY'),10,3,3) //DTB
  MyXlWrite('',11,3,3) //DTE
  MyXlWrite(MyGetInitial(���_��㤠,false),12,3,3) //Podpis
  MyXlWrite(w_toplivo,13,3,3) //Vid_topliva
  MyXlWrite(string(w_it,0,2),14,3,2) //Itogo
  MyXlWrite(w_gosnom,15,3,3) //GOSNOM
  MyXlWrite(w_marka,16,3,3) //MARKA
  MyXlWrite(��⠄���,17,3,3) //DT_DAY
  MyXlWrite(��⠌����,18,3,3) //DT_MONTH
  MyXlWrite(��⠃��,19,3,3) //DT_YEAR

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
 xlAddRangeName('GalDBTbl_Shinaf', 1, 1, str, 17);
//��� �����  xlAddRangeName('GalDBTblFld_'+'', 1, npp, str, npp);
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
    Message('�� ������� �ࢨ᭠� �����ன�� Excel '+'"GalRepBuilder"', Error);
  }
  else
  { xlRunMacro('LoadReport') ;
  }
 }   
 if not xlSetActiveSheetByName('����')
 { message('�� ������ ���� "����"') ; 
  flOk:=false;
 }
  XLGETACTIVEWORKBOOKNAME(wPictBook) ;
  fbasname:='VedTalon'+Nom ;
  fbasname:=replace(fbasname,'\','')
  fbasname:=replace(fbasname,'/','')
  fbasname:=replace(fbasname,'_','')
  fbasname:=replace(fbasname,'.','')
  fbasname:=replace(fbasname,':','')
  fbasname:=MyExDirectoryOut+fbasname+'.xls'
  if fileexist(fbasname) deletefile(fbasname)
  if not xlSaveAsWorkBookByName(wPictbook, fbasname)
  { 
    message('�� ᬮ��� ��࠭��� �����!');
  }
  logfilekl:=false;   
 MyXlEnd; 
 printaktspis.fexit ;
 end.
.}
.begin
 DoneServTxo;
 end.
.endform
