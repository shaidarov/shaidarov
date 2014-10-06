.form 'control_118'
.nameinlist 'Реестр документов без МОЛ'
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
select katsopr.dsopr, katsopr.nsopr,katdoc.name,
sklorder.vidorder,sklorder.tipord,
sporder.dord,sklorder.norder,sporder.descr
from sklorder, sporder, katdoc, katsopr
where((
0==katdoc.sysnum
AND katsopr.vidsopr==katdoc.tidkgal
AND sporder.CSKLORDER==sklorder.nrec
AND sklorder.csopr==katsopr.nrec
AND d1<<=sporder.dord
AND d2>>=sporder.dord))
AND sklorder.cmol=0
ORDER ord1 external BY katsopr.vidsopr,katsopr.dsopr
ORDER ord2 external BY katsopr.vidsopr,katsopr.descr;
.begin
 d1:=DGETTUNE('dat_m_ot');
 d2:=DATE(LAST_DAY(d1),MONTH(d1),YEAR(d1));
 IF RunDialog(control_102,d1,d2,b1)=cmCancel control_118.fexit;
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
 t1.katdoc.name
 npp
 t1.katsopr.dsopr
 t1.katsopr.nsopr
 t1.katsopr.descr
 t1.sporder.dord
 t1.sklorder.norder
 t1.sporder.descr
.endfields
^
                          Реестр документов без МОЛ
                          c @@@@@@@@@@ по @@@@@@@@@@
.{table 't1' BY katsopr.vidsopr
.[h
                                                                 Лист @np@
┌───────┬──────────┬────────────┬───────────┬───────────┬────────┬───────────┐
│   N   │   Дата   │    Номер   │Дескриптор │   Дата    │ Номер  │Дескприптор│
│  п/п  │ накладной│  накладной │в накладной│  ордера   │ордера  │в ордере   │
└───────┴──────────┴────────────┴───────────┴───────────┴────────┴───────────┘
.]h
  Б@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ Б
.{BY katsopr.nrec
.begin
 npp:=npp+1;
end.
  &&&&&  @@@@@@@@@@ @@@@@@@@@@@@  @@@@@@@@@  @@@@@@@@@@@ @@@@@@@   @@@@@@@@@
.}
.}
.endform