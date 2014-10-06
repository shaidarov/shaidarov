/*
 ╔═══════════════════════════════════════════════════════════════════════════╗
 ║                                                  (c) корпорация ГАЛАКТИКА ║
 ║ Галактика 8.10, Управление транспортом                                    ║
 ║ Базовая форма для печати Акта списания комплектующих (Сибнефтепровод)     ║
 ╚═══════════════════════════════════════════════════════════════════════════╝
*/
.linkform 'AktSpisCompSNP_PRM_01' prototype is 'AktSpisCompSNP'
.NameInList 'Карточка учета аккумулутора Excel PRM'
.Group 'Комплектующие'
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
! должность согласующего
	MyXlWrite(sMatchingPost,4,10,3)
! наименование организации
	sNameOrg
! ФИО согласующего
	MyXlWrite(MyGetInitial(sMatchingName,false),5,10,3)
! номер акта
! NumAkt
! дата формирования акта
	sCity
! дата формирования акта  5
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
! должность согласующего   1
^
! наименование организации  2
^
! ФИО согласующего           3
^
! дата формирования акта     5
^ ^
.fields
! председатель комиссии
	MyXlWrite(HeadComissPost,13,6,3) 
	MyXlWrite(MyGetInitial(HeadComissFIO,false),13,12,3)
! данные по комиссии
  MyXlWrite(ComissPost,15+(comis_nom-1),6,3) 
  MyXlWrite(MyGetInitial(ComissFIO,false) ,15+(comis_nom-1),12,3) //9
.endfields
^ ^
.begin
 MyXlWrite(substr(dCreateAkt,1,2),6,11,3)
 MyXlWrite(DateToStr(StrToDate(dCreateAkt,'DD/MM/YYYY'),'mon'),6,13,3)
 MyXlWrite(substr(dCreateAkt,7,4)+' г.',6,15,3)
 MyXlWrite(My_Sclonenie(DateToStr(StrToDate(dCreateAkt,'DD/MM/YYYY'),'month YYYY г.'),6),20,1,3)
 
 comis_nom:=0
 end.
.{ CheckEnter GroupCommissComp
.begin
  comis_nom:=comis_nom+1;
 end.
^ ^
.}
.fields
!	тип комплектующей 10
	MyXlWrite(Tip,24,1,3)
! номер комплектующей   11
	MyXlWrite(if(NumComp='xxx','б/н',NumComp),24,4,3)
! количество комплектующих 12
	MyXlWrite('-'+AmountComp+ ' шт ',24,2,3)
	
! дата установки            13,14
	MyXlWrite(DateTostr(StrToDate(DatZak,'DD/MM/YYYY'),'month'),25,4,3)
	MyXlWrite(DateTostr(StrToDate(DatZak,'DD/MM/YYYY'),'YYYY г.'),25,5,3)
! данные ТС               15 16 17
 	MyXlWrite(RegNum,22,8,3) 
 	MyXlWrite(MarkaTC,22,2,3) 
 	TypeTC
! Норма пробега            18
	NormProbeg             
! Пробег с начала экслуатации 19
	AllProbeg
.endfields

^ ^ ^ 
^ ^ 
^ ^ ^
^ ^
.begin
 w_RegNum:=RegNum
 //6. Списать с подотчета
 MyXlWrite(Tip,34,3,3)
 MyXlWrite('-'+AmountComp+ ' шт ',34,4,3)

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
 { MyXlWrite(wstr+' - '+string(comis_nom)+' шт',29,4,3) 
 }  
 wstr1:=trim(wstr1)
 MyXlWrite(if(wstr1='xxx','б/н',wstr1),29,7,3) 
 comp_nom:=NumComp 
 if v1.getfirst compon_m=0
 { MyXlWrite(DateToStr(dTXOGetExtAttr('COMPON','Дата изготовления',v1.COMPON_M.NREC),'month') ,24,10,3)
   MyXlWrite(DateToStr(dTXOGetExtAttr('COMPON','Дата изготовления',v1.COMPON_M.NREC),'YYYY г.') ,24,11,3)
 }
 end.
.fields
! данные по комиссии
! председатель комиссии
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
