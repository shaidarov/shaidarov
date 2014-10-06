.form 'control_119'
.nameinlist 'Реестр накладных на внутреннее перемещение не имеющих ордеров на списание'
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
SELECT katsopr.descr,x$users.XU$FULLNAME,katsopr.nsopr,katsopr.dsopr,katsopr.summa
WHERE
((
600==katsopr.vidsopr
AND d1<<=katsopr.dsopr
AND d2>>=katsopr.dsopr
AND katsopr.nrec==sklorder.csopr
AND katsopr.descr==x$users.XU$LOGINNAME(Noindex)
))
AND IsValidAll(tnsklorder)=false
ORDER ord1 BY katsopr.dsopr
ORDER ord2 external BY katsopr.descr;
.begin
 d1:=DGETTUNE('DAT_M_OT');
 d2:=DATE(LAST_DAY(d1),MONTH(d1),YEAR(d1));
 IF RunDialog(control_102,d1,d2,b1)=cmCancel control_119.fexit;
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
 t1.katsopr.nsopr
 t1.katsopr.dsopr
 t1.katsopr.summa
 t1.katsopr.descr
 t1.x$users.xu$fullname
 t1.katsopr.summa: 'SUM'
 .endfields
^
                   БРеестр накладных на внутреннее перемещение
                       не имеющих ордеров на списание Б
                         c  В@@@@@@@@@@ В по  В@@@@@@@@@@ В
.{table 't1'
.[h
                                                                Лист @np@
 И┌─────┬───────────┬──────────┬────────────┬──────────┬─────────────────────────────────┐
│  N  │   Номер   │   Дата   │    Сумма   │Дескриптор│      Полное имя пользователя    │
│ п/п │ накладной │ документа│по накладной│          │                                 │
└─────┴───────────┴──────────┴────────────┴──────────┴─────────────────────────────────┘ И
.]h Б
 Б.begin
 npp:=npp+1;
end.
 И &&&&  @@@@@@@@@@@ @@@@@@@@@@ &&&&&&&&&.&& @@@@@@@@@@ @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ И
.}
 И---------------------------------------------------------------------------------------- И
 Итог по реестру:         И&&&&&&&&&.&& И
.endform