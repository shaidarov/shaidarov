/*
 浜様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様�
 �                     (c) 1994,97 ��牆���罔� ���������                      �
 � 蹍オ�        : ���������                                                 �
 � ��痰ガ�       : �≒�矗��甎�珥                                             �
 � �ム瓱�        : 5.50                                                      �
 � ��Л�腑�┘    : ������ �������                                            �
 � �癶モ痰▲��覃 : ��瓱�� �����跫 �������↓�                                 �
 藩様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様�
*/
.linkform PutJrn_PRM_01 prototype is 'PutJrn'
.NameInList '��瑙�-����� Excel (PRM)'
!.p 60
.Group '�腑� あ└キ�� ��痰��'
.Group '��痰�� �諷���'
.F "NUL"
#include excel_fun.frn
#include MyGetInitial.Frn
#include tmp_sbor.frn
.var
 wstr,wstr1:string;
 w_npl :string;
 w_nomer:string;
 wc_spkau :comp;
 wc_podr  :comp;
 w_dt  :date;
 w_nm_maravt :string;
 wnach_cex:string;
.endvar
.create view vvv
as select Transp.nomer 
from transp,marka,tiptex , putlst , katpodr , spkau, MARAVT, MARAVT MARAVT_1, systran, katpodr podr_trans
where (( coGetTune('MyOrg') == katorg.nrec
and katorg.nrec == transp.corg
and w_nomer == transp.nomer
and transp.cmarka == marka.nrec
and marka.ctiptex == TIPTEX.NREC
and w_npl == Putlst.npl
and w_dt == Putlst.Datpl(noindex)
and wc_podr == katpodr.nrec
and wc_spkau == spkau.nrec
and PutLst.CMARAVT == MARAvt.nrec
and PutLst.nrec == KATZAK.cPutLst
and KATZAK.CMARAVT == MARAVT_1.nrec
and systran.tmpcomp6 == podr_trans.nrec
)) ;
.fields
!�甅�↓�� ��痰
 NameOrg Addr Tel Okpo
 BegDate 
 Npl Seria
 DatPl
 Tabn1 FullFio1
 Nudov KlassV NomKom Gnom GarNom  Marchrut Mol Usluga Memo

.endfields
^ ^ ^ ^ ^
.begin
 InitServTxo(0)
 MyXlInit('Avto_PutJrn_Naryad.xls')
 MyXlWrite(MyGetInitial(sGetTune('BOSS'),False),5,10,3)
 MyXlWrite(DateToStr(BegDate,'DD mon YYYY �.'),8,8,3)
 HeaderStrCount:=11
 rowcur:=HeaderStrCount;
 MyXlCreaMatrix(1000,20) ;
 rowcur:=rowcur-1
 if vvv.getfirst katorg=0 {}
 if vvv.getfirst systran=0 {}
 if vvv.getfirst podr_trans=0 {}
 wnach_cex:=vvv.podr_trans.fio
 Sbor_init(0)
 end.
.{
.{
.{?internal;trim(NPL)<>'';
^ ^ ^
^ ^ ^ ^
^ ^ ^
^ ^ ^ ^
------------------------------
.begin
 w_nomer:=GNom;
 w_npl:=NPL
 w_dt:=strtodate(DATPL,'DD/MM/YYYY')
 wstr:=pad(' ',10) ; wstr1:=''
 //: 1. ��� 皋�� ��, 2. ����� ��, 3. �������� ��  4. ����� ��.   
 if vvv.getfirst transp=0
 { if vvv.getfirst marka=0
   { wstr1:=vvv.marka.nm
     if vvv.getfirst tiptex=0
     { //wstr:=vvv.tiptex.name
     
       wstr:=pad(substr(vvv.tiptex.KODTIP,1,10),10)
     }
     wstr:=wstr+pad(substr(vvv.marka.nm,1,20),20)+pad(vvv.transp.nomer,20)+ npl
   } //if vvv.getfirst marka=0
    
 } //if vvv.getfirst transp=0
 if vvv.getfirst PutLst=0 {}
 if vvv.getfirst MARAVT=0 {}
 wc_podr:=Putlst.CPOL
 w_nm_maravt:=vvv.MARAVT.NMARAVT;
 if vvv.getfirst katzak=0 and vvv.katzak.cpodrto>0
 { wc_podr:=vvv.katzak.cpodrto
   w_nm_maravt:=''
   vvv._loop katzak
   { if vvv.getfirst MARAVT_1=0
//       w_nm_maravt:=w_nm_maravt+if(w_nm_maravt<>'',chr(10),'')+vvv.MARAVT_1.NMARAVT
       w_nm_maravt:=w_nm_maravt+if(w_nm_maravt<>'','; ','')+vvv.MARAVT_1.NMARAVT
   } //vvv._loop katzak
 } //if vvv.getfirst katzak=0 and vvv.katzak.cpodrto>0
 if vvv.getfirst Katpodr=0 {}
 
 Sbor_AddNrec(0,wstr,wstr1,gnom,0,0,0,vvv.transp.nrec)
 vtmp_shap.tmp_sbor.name[3]:=NPL//"� �竄ア�����痰�"	
 vtmp_shap.tmp_sbor.name[4]:=FullFio1//�.�.�. 〓え皀��	
 vtmp_shap.tmp_sbor.name[5]:=if(vvv.Putlst.EXITDN<>vvv.PUTLST.RETURNDN,DateTostr(vvv.Putlst.EXITDN,'DD/MM '),'')+TimeTostr(vvv.Putlst.EXITCH,'HH:MM')//�爛��	�襯Г�	
 vtmp_shap.tmp_sbor.name[6]:=if(vvv.Putlst.EXITDN<>vvv.PUTLST.RETURNDN,DateTostr(vvv.Putlst.RETURNDN,'DD/MM '),'')+TimeTostr(vvv.Putlst.RETURNCH,'HH:MM')//踸°皋�		
 if vvv.Putlst.EXITDN=vvv.PUTLST.RETURNDN and TimeTostr(vvv.Putlst.RETURNCH,'HH:MM')='24:00'
   vtmp_shap.tmp_sbor.name[5]:='            ．� ������腑���'  				
 vtmp_shap.tmp_sbor.name[7]:=vvv.katpodr.name//��｀�� �� ��錢�� �發カ�� � 甄礒�	
 vtmp_shap.tmp_sbor.name[8]:=w_nm_maravt //vvv.MARAVT.NMARAVT//�����←キ┘			
 wc_spkau:=coTXOGetExtAttr('PUTLST','���碎� ��矗��',vvv.PUTLST.NREC)
 wstr:=if(vvv.getfirst spkau=0,vvv.spkau.name,'') 
 vtmp_shap.tmp_sbor.name[9]:=wstr//���碎� ��矗��	
 vtmp_shap.update current tmp_sbor;
 end.
!.{?internal;trim(NPL)<>'';
.} 
.}
.}
.begin
 wnpp:=0
 vtmp_rep1.wwpa:=0;
 end. 
.{table 'vtmp_rep1.tmp_sbor'
.begin
  rowcur:=rowcur+1 ;colcur:=1
  wnpp:=wnpp+1
//  xlMergeCells(rowcur,9,rowcur,11)
  xlMergeCells(rowcur,10,rowcur,11)
//  XLALIGNCELLS(rowcur,10,rowcur,11,xlCenter)
  MyXlWrite(string(wnpp),rowcur,colcur,2) //"��/�"	
  MyXlWrite(vtmp_rep1.tmp_sbor.name[1],rowcur,colcur,3)//��爲� �/�	
  MyXlWrite(vtmp_rep1.tmp_sbor.name[2],rowcur,colcur,3)//���. � �/�	
  MyXlWrite(vtmp_rep1.tmp_sbor.name[3],rowcur,colcur,3)//"� �竄ア�����痰�"	
  MyXlWrite(vtmp_rep1.tmp_sbor.name[4],rowcur,colcur,3)//�.�.�. 〓え皀��	
  MyXlWrite(vtmp_rep1.tmp_sbor.name[5],rowcur,colcur,3)//�爛��	�襯Г�	
  if vtmp_rep1.tmp_sbor.name[5]='            ．� ������腑���'
	 xlMergeCells(rowcur,6,rowcur,7)
  
  MyXlWrite(vtmp_rep1.tmp_sbor.name[6],rowcur,colcur,3)//踸°皋�						
  MyXlWrite(vtmp_rep1.tmp_sbor.name[7],rowcur,colcur,3)//��｀�� �� ��錢�� �發カ�� � 甄礒�	
  MyXlWrite(vtmp_rep1.tmp_sbor.name[8],rowcur,colcur,3)//�����←キ┘			
  MyXlWrite(vtmp_rep1.tmp_sbor.name[9],rowcur,colcur,3)//���碎� ��矗��	

 end.
.}
.begin
 if matrixkl then
    { MyxlWriteMatrix(rowcur) ;
      xlFreeMatrix ;
      matrixkl:=false ;
    }

 MyxlFrameCells(headerstrcount,1,rowcur,11,1 or 2 or 4 or 8 or 16 or 32);
 xlWrapText(headerstrcount,1,rowcur,11)

  rowcur:=rowcur+2 ; colcur:=2 ;
  MyXLwrite('�����讚┴ (���メ皋皀��) ��� � ��___________________________'+MyGetInitial(wnach_cex,False),rowcur,colcur, 3)
  MyXLwrite(DateToStr(cur_date,'"DD" mon YYYY �'),rowcur,10, 3)
  xlSetFontStyle(wxlBold,rowcur ,1,rowcur,10)

 
 xlRunMacro('AfterForm') ;
 MyXLEnd;
 DoneServTxo;
 end.
.endform