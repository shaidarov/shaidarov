.form 'control_117'
.nameinlist 'Реестр ордеров с нулевой ценой у МЦ'
.group 'Контроль соответствия оперативного контура'
.ard
.p 60
.defo portrait
.var
 d1,d2:date;
 b1:byte;
 npp:integer;
.endvar
.create view t1 as
select  sklorder.vidorder,katmc.name(length=40),
sporder.dord,sklorder.norder,sporder.descr
from sklorder, sporder,katmc
where((
sporder.CSKLORDER==sklorder.nrec
AND d1<<=sporder.dord
AND sporder.CMC==katmc.nrec
AND d2>>=sporder.dord))
AND sporder.vidorder=0
AND sporder.srprice=0
AND sporder.sp=0
ORDER ord1 BY sporder.dord
ORDER ord2 external BY sporder.descr;
.begin
 d1:=DGETTUNE('dat_m_ot');
 d2:=DATE(LAST_DAY(d1),MONTH(d1),YEAR(d1));
 IF RunDialog(control_102,d1,d2,b1)=cmCancel control_117.fexit;
end.
.begin
 IF b1=0 SETORDER(tiOrd1);
 ELSE SETORDER(tiOrd2);
 npp:=0;
end.
.fields
 commonformheader
 d1
 d2
 npp
 t1.katmc.name
 t1.sklorder.dord
 t1.sklorder.norder
 t1.sporder.descr
 .endfields
^
                       Реестр ордеров с нулевой ценой МЦ
                           c @@@@@@@@@@ по @@@@@@@@@@
.{table 't1'
.[h
                                                                Лист @np@
┌───────┬───────────────────────────────┬─────────────┬──────────┬──────────┐
│   N   │         Наименование МЦ       │     Дата    │  Номер   │Дескриптор│
│  п/п  │                               │   документа │ документа│          │
└───────┴───────────────────────────────┴─────────────┴──────────┴──────────┘
.]h Б
 Б.begin
 npp:=npp+1;
end.
  &&&&&  @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@  @@@@@@@@@@@@@ @@@@@@@@@@ @@@@@@@@@@
.}
.endform