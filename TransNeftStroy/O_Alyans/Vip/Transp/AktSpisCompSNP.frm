/*
 浜様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様�
 �                                                  (c) ��牆���罔� ��������� �
 � �����皋�� 8.10, ����←キ┘ 矗��甎�珥��                                    �
 � ��М��� 筮爼� か� �ョ�皋 ���� 甎������ �����オ矣鉗�� (�─�ヤ皀�牀〓�)     �
 藩様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様�
*/
.linkform 'AktSpisCompSNP_PRM_01' prototype is 'AktSpisCompSNP'
.NameInList '��珥�腦� 竍モ� ���祠祀竄��� Excel PRM'
.Group '�����オ矣鉗┘'
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
! ぎ�Ν�痰� 甌���痺鉗ィ�
	MyXlWrite(sMatchingPost,4,10,3)
! ��━キ����┘ �爍��├�罔�
	sNameOrg
! ��� 甌���痺鉗ィ�
	MyXlWrite(MyGetInitial(sMatchingName,false),5,10,3)
! ���ム ����
! NumAkt
! ���� 筮爼�牀����� ����
	sCity
! ���� 筮爼�牀����� ����  5
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
! ぎ�Ν�痰� 甌���痺鉗ィ�   1
^
! ��━キ����┘ �爍��├�罔�  2
^
! ��� 甌���痺鉗ィ�           3
^
! ���� 筮爼�牀����� ����     5
^ ^
.fields
! �爛めイ�皀�� ����瘁┬
	MyXlWrite(HeadComissPost,13,6,3) 
	MyXlWrite(MyGetInitial(HeadComissFIO,false),13,12,3)
! ����襯 �� ����瘁┬
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
!	皋� �����オ矣鉗ォ 10
	MyXlWrite(Tip,24,1,3)
! ���ム �����オ矣鉗ォ   11
	MyXlWrite(if(NumComp='xxx','�/�',NumComp),24,4,3)
! ����腑痰〓 �����オ矣鉗�� 12
	MyXlWrite('-'+AmountComp+ ' 萵 ',24,2,3)
	
! ���� 竅����→�            13,14
	MyXlWrite(DateTostr(StrToDate(DatZak,'DD/MM/YYYY'),'month'),25,4,3)
	MyXlWrite(DateTostr(StrToDate(DatZak,'DD/MM/YYYY'),'YYYY �.'),25,5,3)
! ����襯 ��               15 16 17
 	MyXlWrite(RegNum,22,8,3) 
 	MyXlWrite(MarkaTC,22,2,3) 
 	TypeTC
! ��爼� �牀．��            18
	NormProbeg             
! 蹍．� � ������ 蹣甄����罔� 19
	AllProbeg
.endfields

^ ^ ^ 
^ ^ 
^ ^ ^
^ ^
.begin
 w_RegNum:=RegNum
 //6. �����碎 � ��ぎ砒モ�
 MyXlWrite(Tip,34,3,3)
 MyXlWrite('-'+AmountComp+ ' 萵 ',34,4,3)

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
 { MyXlWrite(wstr+' - '+string(comis_nom)+' 萵',29,4,3) 
 }  
 wstr1:=trim(wstr1)
 MyXlWrite(if(wstr1='xxx','�/�',wstr1),29,7,3) 
 comp_nom:=NumComp 
 if v1.getfirst compon_m=0
 { MyXlWrite(DateToStr(dTXOGetExtAttr('COMPON','���� ├��皰←キ��',v1.COMPON_M.NREC),'month') ,24,10,3)
   MyXlWrite(DateToStr(dTXOGetExtAttr('COMPON','���� ├��皰←キ��',v1.COMPON_M.NREC),'YYYY �.') ,24,11,3)
 }
 end.
.fields
! ����襯 �� ����瘁┬
! �爛めイ�皀�� ����瘁┬
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
