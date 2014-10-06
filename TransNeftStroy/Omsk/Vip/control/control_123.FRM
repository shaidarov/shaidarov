.form 'control_123'
.nameinlist 'Реестр несоответствий контрагента в ДО и сопроводительных документах'
.group 'Контроль соответствия оперативного контура'
.ard
.p 60
.defo portrait
.var
 d1,d2:date;
 b2,b3:byte;
 npp:integer;
 str:string;
.endvar
.create view t1 as
SELECT katsopr.nsopr,katsopr.dsopr,katsopr.descr,katsopr.summa,katorg1.name,katorg2.name,katdoc.name
FROM katsopr,katdoc, katorg katorg1,katorg katorg2
WHERE
((
katsopr.cstepdoc/==stepdoc.nrec
AND stepdoc.cbasedoc/==basedoc.nrec
AND katsopr.corg==katorg1.nrec
AND basedoc.corg==katorg2.nrec
AND 0==katdoc.sysnum
AND katsopr.vidsopr==katdoc.tidkgal
))
AND katsopr.corg<>basedoc.corg
AND katsopr.dsopr>=d1
AND katsopr.dsopr<=d2
ORDER ord1 by katsopr.vidsopr,katsopr.dsopr
ORDER ord2 by katsopr.vidsopr,katsopr.descr;
.begin
 d1:=DGETTUNE('dat_m_ot');
 d2:=DATE(LAST_DAY(d1),MONTH(d1),YEAR(d1));
 IF RunInterface(control_105,d1,d2,b2,b3)=cmCancel control_123.fexit;
 IF b3=0 SETORDER(tiOrd1);
 ELSE SETORDER(tiOrd2);
 IF b2=1 d1:=date(1,6,2001);
 npp:=0;
end.
.fields
 commonformheader
 d1
 d2
 t1.katdoc.name
 npp
 t1.katsopr.dsopr
 t1.katsopr.descr
 t1.katsopr.nsopr
 t1.katorg1.name
 t1.katorg2.name
 t1.katsopr.summa
.endfields
 Ш^
                                          Реестр несоответствий контрагента в ДО и сопроводительных документах
                                                                c @@@@@@@@@@ по @@@@@@@@@@ Ш
.{table 't1' BY katsopr.vidsopr
. Ш[h
                                                                                                                                               Лист @np@
   ┌───────┬───────────┬──────────┬──────────────┬──────────────────────────────────────────────┬───────────────────────────────────────────┬──────────────┐
   │   N   │   Дата    │Дескриптор│     Номер    │         Контрагент по накладной/акту         │     Контрагент по документу-основанию     │    Cумма     │
   │  п/п  │ документа │          │   документа  │                                              │                                           │ по документу │
   └───────┴───────────┴──────────┴──────────────┴──────────────────────────────────────────────┴───────────────────────────────────────────┴──────────────┘
.]h
     Б@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ Б
.{BY katsopr.nrec
.begin
 npp:=npp+1;
end.
      &&&&& @@@@@@@@@@@ @@@@@@@@@@ @@@@@@@@@@@@@@ @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@  @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@   &&&&&&&&&.&& Ш
.}
.}
.endform