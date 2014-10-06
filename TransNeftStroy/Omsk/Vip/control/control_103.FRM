.form 'control_103'
.nameinlist 'Реестр приходных накладных не привязанных к ДО на закупку'
.group 'Контроль соответствия оперативного контура'
.ard
.p 60
.o 5
.[h
   БРеестр приходных накладных не привязанных к ДО на закупку Б
                                                   Лист  @np@
┌──────┬────────┬──────────────────┬──────────┬──────────────┐
│N п/п │ Дескр. │  Номер документа │   Дата   │    Сумма     │
│      │пользов.│                  │ документа│              │
└──────┴────────┴──────────────────┴──────────┴──────────────┘
.]h
.var
 d1,d2:date;
 b1:byte;
 npp:integer;
.endvar
.begin
 npp:=0;
 d1:=DGETTUNE('dat_m_ot');
 d2:=DATE(LAST_DAY(d1),MONTH(d1),YEAR(d1));
 IF RunDialog(control_102,d1,d2,b1)=cmCancel control_103.fexit;
end.
.create view t1 as
SELECT katsopr.descr,katsopr.nsopr,katsopr.dsopr,katsopr.summa
FROM katsopr
WHERE
((
0==katsopr.cstepdoc
AND 101==katsopr.vidsopr
AND d1<<=katsopr.dsopr
AND d2>>=katsopr.dsopr
))
AND katsopr.cpayment<>0001000000000007h
AND katsopr.corg<>0001000000000F1Ah
AND katsopr.corg<>0001000000004A25h
ORDER ord1 BY katsopr.cstepdoc,katsopr.vidsopr,katsopr.dsopr
ORDER ord2 EXTERNAL BY katsopr.descr,katsopr.dsopr;
.begin
 IF b1=0 SETORDER(tiOrd1);
 ELSE SETORDER(tiOrd2);
end.
.fields
npp
t1.katsopr.descr
t1.katsopr.nsopr
IF(t1.katsopr.dsopr=DATE(0,0,0),'',STRING(t1.katsopr.dsopr))
t1.katsopr.summa
.endfields
.begin
 npp:=0;
end.
.{Table 't1:Main'
.begin
 npp:=npp+1;
end.
 &&&&&& @@@@@@@@ @@@@@@@@@@@@@@@@@@ @@@@@@@@@@ &&&&&&&&&&&.&&
.}
.endform