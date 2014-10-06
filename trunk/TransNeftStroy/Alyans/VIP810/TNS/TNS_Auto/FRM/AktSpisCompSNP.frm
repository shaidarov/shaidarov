/*
 ���������������������������������������������������������������������������ͻ
 �                                                  (c) ��௮��� ��������� �
 � �����⨪� 8.10, ��ࠢ����� �࠭ᯮ�⮬                                    �
 � ������� �ଠ ��� ���� ��� ᯨᠭ�� ������������ (������⥯஢��)     �
 ���������������������������������������������������������������������������ͼ
*/
.linkform 'AktSpisCompSNP_PRM_01' prototype is 'AktSpisCompSNP'
.NameInList '����窠 ��� �������� Excel PRM'
.Group '����������騥'
.F "NUL"
#include excel_fun.frn
#include MyGetInitial.Frn
#include odecl.frn
.var
 w_RegNum:string;
 w_dt :date
 comis_nom:integer
 comp_nom :string;
.endvar 
.create view v1
as select transp.nrec
from transp,katorg,COMPON,MARCOMP , compon compon_m
where ((
 cogettune('myorg') == katorg.nrec
and katorg.nrec == transp.corg
and w_RegNum == transp.nomer
and 0 == COMPON.WHATIS
and transp.nrec == COMPON.cavto
and w_dt<<=COMPON.DATZAK(noindex)
and add_day(w_dt,1)>>=COMPON.DATZAK(noindex)
and 0 << COMPON.cCOMPON(noindex)
and 1 == COMPON.DVIGE(noindex)
and  COMPON.CMARCOMP == MARCOMP.NREC
and 0 == compon_m.WHATIS
and transp.nrec == COMPON_M.cavto
and 0 == compon_m.ccompon(noindex)
and comp_nom == compon_m.NOMCOMP (noindex)
//and w_dt>>COMPON_M.DATZAK(noindex)
)) ;
.fields    
! ��������� ᮣ�����饣�
	MyXlWrite(sMatchingPost,4,10,3)
! ������������ �࣠����樨
	sNameOrg
! ��� ᮣ�����饣�
	MyXlWrite(MyGetInitial(sMatchingName,false),5,10,3)
! ����� ���
! NumAkt
! ��� �ନ஢���� ���
	sCity
! ��� �ନ஢���� ���  5
	MyXlWrite(DateToStr(StrToDate(dCreateAkt,'DD/MM/YYYY'),'DD mon YYYY'),10,5,3)
.endfields
.begin
  InitServTxo(0) ;
 end.
.{
.{ CheckEnter GroupTS
.begin
 MyXlInit('Avto_AkumAktSpis.xls')

 end.
! ��������� ᮣ�����饣�   1
^
! ������������ �࣠����樨  2
^
! ��� ᮣ�����饣�           3
^
! ��� �ନ஢���� ���     5
^ ^
.fields
! �।ᥤ�⥫� �����ᨨ
	MyXlWrite(HeadComissPost,13,6,3) 
	MyXlWrite(MyGetInitial(HeadComissFIO,false),13,12,3)
! ����� �� �����ᨨ
  MyXlWrite(ComissPost,15+(comis_nom-1),6,3) 
  MyXlWrite(MyGetInitial(ComissFIO,false) ,15+(comis_nom-1),12,3) //9
.endfields
^ ^
.begin
 MyXlWrite(substr(dCreateAkt,1,2),6,11,3)
 MyXlWrite(DateToStr(StrToDate(dCreateAkt,'DD/MM/YYYY'),'mon'),6,13,3)
 MyXlWrite(substr(dCreateAkt,7,4)+' �.',6,15,3)
 MyXlWrite(My_Sclonenie(DateToStr(StrToDate(dCreateAkt,'DD/MM/YYYY'),'month YYYY �.'),6),20,1,3)
 
 comis_nom:=0
 end.
.{ CheckEnter GroupCommissComp
.begin
  comis_nom:=comis_nom+1;
 end.
^ ^
.}
.fields
!	⨯ ����������饩 10
	MyXlWrite(Tip,24,1,3)
! ����� ����������饩   11
	MyXlWrite(if(NumComp='xxx','�/�',NumComp),24,4,3)
! ������⢮ ������������ 12
	MyXlWrite('-'+AmountComp+ ' �� ',24,2,3)
	
! ��� ��⠭����            13,14
	MyXlWrite(DateTostr(StrToDate(DatZak,'DD/MM/YYYY'),'month'),25,4,3)
	MyXlWrite(DateTostr(StrToDate(DatZak,'DD/MM/YYYY'),'YYYY �.'),25,5,3)
! ����� ��               15 16 17
 	MyXlWrite(RegNum,22,8,3) 
 	MyXlWrite(MarkaTC,22,2,3) 
 	TypeTC
! ��ଠ �஡���            18
	NormProbeg             
! �஡�� � ��砫� ����樨 19
	AllProbeg
.endfields

^ ^ ^ 
^ ^ 
^ ^ ^
^ ^
.begin
 w_RegNum:=RegNum
 //6. ������ � �������
 MyXlWrite(Tip,34,3,3)
 MyXlWrite('-'+AmountComp+ ' �� ',34,4,3)

 if v1.getfirst katorg=0 {}
 if v1.getfirst transp=0 {}
 w_dt:=StrToDate(dCreateAkt,'DD/MM/YYYY')
 comis_nom:=0
 var wstr,wstr1:string;
 wstr:=''   ;wstr1:=''
 v1._loop COMPON
 { if v1.getfirst MARCOMP=0
   { if pos(MARCOMP.name,wstr)=0
      wstr:=wstr+if(wstr<>'',', ','')+MARCOMP.name
   }  
   comis_nom:=comis_nom+1
   wstr1:=wstr1+' '+v1.COMPON.nomcomp
   
 } //v1._loop COMPON
 if comis_nom>0
 { MyXlWrite(wstr+' - '+string(comis_nom)+' ��',29,4,3) 
 }  
 wstr1:=trim(wstr1)
 MyXlWrite(if(wstr1='xxx','�/�',wstr1),29,7,3) 
 comp_nom:=NumComp 
 if v1.getfirst compon_m=0
 { MyXlWrite(DateToStr(dTXOGetExtAttr('COMPON','��� ����⮢�����',v1.COMPON_M.NREC),'month') ,24,10,3)
   MyXlWrite(DateToStr(dTXOGetExtAttr('COMPON','��� ����⮢�����',v1.COMPON_M.NREC),'YYYY �.') ,24,11,3)
 }
 end.
.fields
! ����� �� �����ᨨ
! �।ᥤ�⥫� �����ᨨ
  MyXlWrite(HeadComissPost,36,4,3) 
  MyXlWrite(MyGetInitial(HeadComissFIO,false) ,36,12,3)
  MyXlWrite(EndComissPost,38+(comis_nom-1)*2,4,3) 
  MyXlWrite(MyGetInitial(EndComissFIO,false) ,38+(comis_nom-1)*2,12,3)
.endfields
^ ^
.begin
 comis_nom:=-1
 end.
.{ CheckEnter EndGroupCommissComp
.begin
  comis_nom:=comis_nom+1;
 end.
.{?internal;comis_nom>0 and comis_nom<=4;
^ ^
.}
.}
.if BrkPageComp
.end
.begin
 MyXLEnd;

 end.
.}

.}
.begin
  DoneServTxo ;
 end.
.endform
