/*
 ╔═══════════════════════════════════════════════════════════════════════════╗
 ║                                                  (c) корпорация ГАЛАКТИКА ║
 ║ Галактика 8.10, Управление транспортом                                    ║
 ║ Базовая форма для печати Акта списания шин (Сибнефтепровод)               ║
 ╚═══════════════════════════════════════════════════════════════════════════╝
*/
.linkform 'AktSpisShinSNP_PRM_01' prototype is 'AktSpisShinSNP'
.NameInList 'Акт списания шин в Excel (PRM)'
.Group 'Шины'
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
! должность согласующего
	MyXlWrite(sMatchingPost,4,13,3)
! наименование организации
	MyXlWrite(sNameOrg,1,1,3)
! ФИО согласующего
	MyXlWrite(MyGetInitial(sMatchingName,False),5,13,3)
! номер акта
! NumAkt
! дата формирования акта
	sCity
! дата формирования акта
	MyXlWrite('от '+DateToStr(StrToDate(dCreateAkt,'DD/MM/YYYY'),'"DD" mon YYYY г.'),10,9,3)

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
 MyXlWrite(DateToStr(StrToDate(dCreateAkt,'DD/MM/YYYY'),'"DD" mon YYYY г.'),76,3,3)
 MyXlWrite(DateToStr(StrToDate(dCreateAkt,'DD/MM/YYYY'),'"DD" mon YYYY г.'),27,1,3)

 end.
.fields
! председатель комиссии
	MyXlWrite(HeadComissPost,13,9,3) MyXlWrite(MyGetInitial(HeadComissFIO,false),13,16,3)
! данные по комиссии
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
! дата формирования акта
	MyXlWrite(DateToStr(StrToDate(dCreateAkt,'DD/MM/YYYY'),'"DD" mon YYYY г.'),27,1,3)
.endfields
^
.fields

!	размер шины
if(if(TireSize='',Model,TireSize)<>'',MyXlWrite(if(TireSize='',Model,TireSize),29,3,3),'')
! модель шины
	Model
! количество шин конкретной модели
  AmountMod
! завод изготовитель
 	MyXlWrite(Manuf,38,9,3)

.endfields
.{ CheckEnter ObjectSpisMod
^ ^ ^ ^
.}

.fields
! номер шины
	NumShin
! данные ТС
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
! Норма пробега
	NormProbeg
! Пробег с начала экслуатации
	AllProbeg

.endfields
!.{ CheckEnter ObjectProbeg
^ ^
!.}
.fields
! Остаток протектора в мм
 MyXlWrite('высота рисунка протектора меньше '+PGP,39,9,3)								
! Дата списания шины
	dSpis

.endfields
.begin
 wnom_shin:=0;
 w_Razmer:='';
 w_izgName:='';
 // найдем новые шины - перед списанием нужно их установить 
 // датой равной или позже списания
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
! данные по комиссии
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
