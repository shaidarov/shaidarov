/*
 浜様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様�
 �                                                  (c) ��牆���罔� ��������� �
 � �����皋�� 8.10, ����←キ┘ 矗��甎�珥��                                    �
 � ��М��� 筮爼� か� �ョ�皋 ���� 甎������ 荐� (�─�ヤ皀�牀〓�)               �
 藩様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様�
*/
.linkform 'AktSpisShinSNP_PRM_01' prototype is 'AktSpisShinSNP'
.NameInList '��� 甎������ 荐� � Excel (PRM)'
.Group '�┃�'
.F "NUL"
.var
 comis_nom :word;
 wnom_shin :word;
 i:word
 wstr:string;
.endvar
#include excel_fun.frn
#include avto_shina.frn
#include odecl.frn
#include MyGetInitial.Frn
.begin
 MyXlInit('AVTO_AktSpisShina.xls')
 end.
.fields
! ぎ�Ν�痰� 甌���痺鉗ィ�
	MyXlWrite(sMatchingPost,4,13,3)
! ��━キ����┘ �爍��├�罔�
	MyXlWrite(sNameOrg,1,1,3)
! ��� 甌���痺鉗ィ�
	MyXlWrite(MyGetInitial(sMatchingName,False),5,13,3)
! ���ム ����
! NumAkt
! ���� 筮爼�牀����� ����
	sCity
! ���� 筮爼�牀����� ����
	MyXlWrite('�� '+DateToStr(StrToDate(dCreateAkt,'DD/MM/YYYY'),'"DD" mon YYYY �.'),10,9,3)

.endfields
.{

.{ CheckEnter TireSize
^
^
^
^ ^
.begin
 w_dt:=StrToDate(dCreateAkt,'DD/MM/YYYY')
 MyXlWrite(DateToStr(w_dt,'DD'),6,14,3)
 MyXlWrite(DateToStr(w_dt,'mon'),6,16,3)
 MyXlWrite(DateToStr(w_dt,'YYYY'),6,18,3)
 w_RegNum:='';
 MyXlWrite(DateToStr(StrToDate(dCreateAkt,'DD/MM/YYYY'),'"DD" mon YYYY �.'),76,3,3)
 MyXlWrite(DateToStr(StrToDate(dCreateAkt,'DD/MM/YYYY'),'"DD" mon YYYY �.'),27,1,3)

 end.
.fields
! �爛めイ�皀�� ����瘁┬
	MyXlWrite(HeadComissPost,13,9,3) MyXlWrite(MyGetInitial(HeadComissFIO,false),13,16,3)
! ����襯 �� ����瘁┬
  MyXlWrite(ComissPost,16+(comis_nom-1)*3,9,3) MyXlWrite(MyGetInitial(ComissFIO,false),16+(comis_nom-1)*3,16,3)

.endfields
^ ^
.begin
 comis_nom:=0
 end.
.{ CheckEnter GroupCommiss
.begin
  comis_nom:=comis_nom+1;
 end.
.{?internal;comis_nom<=4  
^ ^
.}
.}
.fields
! ���� 筮爼�牀����� ����
	MyXlWrite(DateToStr(StrToDate(dCreateAkt,'DD/MM/YYYY'),'"DD" mon YYYY �.'),27,1,3)
.endfields
^
.fields

!	��Кム 荐��
if(if(TireSize='',Model,TireSize)<>'',MyXlWrite(if(TireSize='',Model,TireSize),29,3,3),'')
! ��ぅ�� 荐��
	Model
! ����腑痰〓 荐� ����爛皚�� ��ぅ��
  AmountMod
! ��〓� ├��皰※皀��
 	MyXlWrite(Manuf,38,9,3)

.endfields
.{ CheckEnter ObjectSpisMod
^ ^ ^ ^
.}

.fields
! ���ム 荐��
	NumShin
! ����襯 ��
 MyXlWrite(RegNum,28,6,3) 
 MyXlWrite(MarkaTC,28,2,3) 
 TypeTC 
 MyXlWrite(AmountShin,28,16,3)

.endfields
.begin
  wnom_shin:=0;
 end.
.{ CheckEnter ObjectSpisTC
.begin
 i:=0;
 do {
   i:=i+1;
   wstr:=trim(ExtractDelimitedWord(NumShin,i,','))
   if wstr<>''
   { wnom_shin:=wnom_shin+1
     MyXlWrite(''''+wstr,30+wnom_shin+if(wnom_shin>7,-7,0),if(wnom_shin>7,9,3),3)
   }
 } while wstr<>'' or wnom_shin>=14
 if w_RegNum='' then w_RegNum:=RegNum
 end.
^
^ ^ ^ ^
.}

.fields
! ��爼� �牀．��
	NormProbeg
! 蹍．� � ������ 蹣甄����罔�
	AllProbeg

.endfields
!.{ CheckEnter ObjectProbeg
^ ^
!.}
.fields
! �痰�皰� �牀皀�皰�� � ��
 MyXlWrite('�諱��� 爬痺��� �牀皀�皰�� �キ跏� '+PGP,39,9,3)								
! ���� 甎������ 荐��
	dSpis

.endfields
.begin
 wnom_shin:=0;
 w_Razmer:='';
 w_izgName:='';
 // ���ぅ� ���襯 荐�� - �ムイ 甎����┘� �礒�� �� 竅����※碎 
 // ��皰� ��↓�� ┼� ��Е� 甎������
 if vShinaF_Transp.getfirst Transp=0
 { vShinaF_Transp._loop ShinaF
   { wnom_shin:=wnom_shin+1; 
     wstr:=vShinaF_Transp.ShinaF.NOMSHIN
     MyXlWrite(''''+wstr,42+wnom_shin+if(wnom_shin>7,-7,0),if(wnom_shin>7,9,3),3)
     if w_Razmer=''
     { if vShinaF_Transp.getfirst MARSHIN=0
       { if vShinaF_Transp.MARSHIN.IZGNAME=''
          w_Razmer:=vShinaF_Transp.MARSHIN.MODSHIN
         else 
          w_Razmer:=vShinaF_Transp.MARSHIN.IZGNAME
       }
     }
     if w_izgName=''
     { if vShinaF_Transp.getfirst ShinaF_M=0
         if vShinaF_Transp.getfirst katorg=0
           w_izgName:=vShinaF_Transp.KATORG.NAME
     }
   
   } //vShinaF_Transp._loop ShinaF
   if vShinaF_Transp.getfirst katpodr=0
     MyXlWrite(vShinaF_Transp.katpodr.name,2,1,3)
 }  //if vShinaF_Transp.getfirst Transp=0
 MyXlWrite(string(wnom_shin,0,0),40,9,3)
 MyXlWrite(w_Razmer,41,9,3)
 MyXlWrite(w_izgName,50,9,3)
 
 end.
.{ CheckEnter ObjectCauseSpis
^ ^
.}
.fields
! ����襯 �� ����瘁┬
  MyXlWrite(EndComissPost,54+(comis_nom-1)*3,9,3) MyXlWrite(MyGetInitial(EndComissFIO,false),54+(comis_nom-1)*3,16,3)

.endfields
.begin
 comis_nom:=-1
 end.
.{ CheckEnter EndGroupCommiss
.begin
  comis_nom:=comis_nom+1;
 end.
.{?internal;comis_nom>0 and comis_nom<=4; 
^ ^
.}
.}
.if AktSpisBrkPage
.end
.}

.}
.begin
 
 MyXLEnd;

 end.
.endform
