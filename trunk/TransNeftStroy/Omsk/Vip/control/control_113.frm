 Ш.form 'control_113'
.nameinlist 'Реестр МЦ с отрицательными остатками'
.group 'Контроль соответствия оперативного контура'
.ard
.var
 d1,d2:date;
 b1,b2:byte;
.endvar
.p 80
.defo portrait
.o 5
.create view t1 as
SELECT SUB_DAY(saldomc.dsaldo,1)(FIELDNAME=dataost),katmc.name,saldomc.kol,
       saldomc.srprice,katmol.name,katpodr.name
FROM saldomc, katmc, katmol, katpodr
where
((
saldomc.cmc==katmc.nrec
AND saldomc.cmol==katmol.nrec
and saldomc.cpodr==katpodr.nrec
AND d1<<saldomc.dsaldo
AND add_day(d2,1)>>=saldomc.dsaldo
AND b1==saldomc.sp
))
and saldomc.kol<0
and saldomc.cpodr<>0
ORDER EXTERNAL BY saldomc.dsaldo,katpodr.name,katmol.name;
.begin
 d1:=DGetTune('DAT_M_OT');
 d2:=DATE(LAST_DAY(d1),MONTH(d1),YEAR(d1));
 IF RunInterface(control_103,d1,d2,b1,b2)=cmCancel control_113.fexit;
end.
.begin
 IF b2=1 d1:=DATE(1,10,2001);
end.
.fields
 commonformheader
 IF(b1=0,'(складской учет)','(производство)')
 d1
 d2
 t1.dataost
 t1.katmc.name
 t1.saldomc.kol
 t1.saldomc.srprice
 t1.katmol.name
 t1.katpodr.name
.endfields
^
                                        Реестр МЦ с отрицательными остатками @@@@@@@@@@@@@@@@@
                                                       с @@@@@@@@@@ по @@@@@@@@@@
.{table 't1'
.[h
                                                                                                                                        Лист @np@
┌──────────┬──────────────────────────────────────┬──────────────┬─────────────┬─────────────────────────────────┬────────────────────────────────────┐
│  Дата    │          Наименование МЦ             │  Количество  │    Цена     │                   МОЛ           │              Подразделение         │
│ остатков │                                      │              │             │                                 │                                    │
└──────────┴──────────────────────────────────────┴──────────────┴─────────────┴─────────────────────────────────┴────────────────────────────────────┘
.]h
.{?internal;round(t1.saldomc.kol,5)<>0;
 @@@@@@@@@@ @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ &&&&&&&&.&&&&& &&&&&&&&&&.&& @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
.}
.}
.endform Ш
