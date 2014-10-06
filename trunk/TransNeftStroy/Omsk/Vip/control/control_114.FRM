.form 'control_114'
.nameinlist 'Реестр накладных и актов без счетов-фактур'
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
SELECT katsopr.descr,katsopr.nsopr,katsopr.dsopr,katsopr.vidsopr,katsopr.summa,katdoc.name
FROM katsopr, katdoc
WHERE
((
 0==katdoc.sysnum
 AND katsopr.vidsopr==katdoc.tidkgal
))
AND (katsopr.vidsopr=101 OR
katsopr.vidsopr=111 OR
katsopr.vidsopr=201 OR
katsopr.vidsopr=211)
AND katsopr.dsopr>=d1
AND katsopr.dsopr<=d2
AND katsopr.cpayment<>0001000000000007h
AND katsopr.corg<>0001000000000F1Ah
AND katsopr.cschfact=COMP(0)
ORDER ord1 BY katsopr.vidsopr,katsopr.dsopr
ORDER ord2 BY katsopr.vidsopr,katsopr.descr;
.begin
 d1:=DGETTUNE('dat_m_ot');
 d2:=DATE(LAST_DAY(d1),MONTH(d1),YEAR(d1));
 IF RunDialog(control_102,d1,d2,b1)=cmCancel control_114.fexit;
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
 t1.katsopr.summa
.endfields
^
               Реестр накладных и актов без счетов-фактур
                      c @@@@@@@@@@ от @@@@@@@@@@
.{table 't1' BY katsopr.vidsopr
.[h
                                                            Лист @np@
   ┌───────┬───────────┬───────────────┬───────────┬─────────────────┐
   │   N   │   Дата    │     Номер     │Дескриптор │      Сумма      │
   │  п/п  │ документа │   документа   │           │  по документу   │
   └───────┴───────────┴───────────────┴───────────┴─────────────────┘
.]h
 Б    @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ Б
.{BY katsopr.nrec
.begin
 npp:=npp+1;
end.
      &&&&&  @@@@@@@@@@ @@@@@@@@@@@@@@@ @@@@@@@@@@@ &&&&&&&&&&&&&&.&&
.}
.}
.endform