 Р.form 'control_108aktsb'
.nameinlist '*Список актов на оказание услуг без бухгалтерских проводок'
.group ' РКонтроль соответствия Р  Рбухгалтерского контура Р'
.ard
.p 60                                                 //кол-во строк на странице
.o 5                                                  //отступ справа
.var                                                  //объявление переменных
 v1,v2,v3:double;
 d1,d2:date;                                          //период формирования отчета
 Р b1:byte;                                             //переменная для опр-я вывода по дескр или по дате
 c1:comp;
 s1:string;
 Р.endvar
.create view table3 as SELECT planssch.*
WHERE
((
 c1==planssch.nrec                                   //определение плана счетов
));
 Р.create view t1 as
SELECT katsopr.desgr,katsopr.descr,katsopr.nrec,katsopr.vidsopr,katsopr.nsopr,katsopr.dsopr,katsopr.summa,
       oborot.tidk,oborot.sumob,grdescr.name
WHERE ((211==katsopr.vidsopr AND
        211==oborot.tidk AND
        katsopr.nrec==oborot.csoprdoc AND
        katsopr.desgr==grdescr.desgr AND
        c1==oborot.cplanssch))
AND (katsopr.dsopr>=d1 AND katsopr.dsopr<=d2) Р
 РORDER ord1 BY katsopr.vidsopr,katsopr.desgr,katsopr.dsopr  //ord1 - переменная для сортировки по группе,дате
ORDER ord2 BY katsopr.vidsopr,katsopr.descr;               //ord2 - переменная для сортировки по дескриптору
.fields
 commonformheader  //вывод 1-й строки:дескриптор, время
 d1
 d2
 s1
 t1.katsopr.desgr
! t1.grdescr.name
 t1.katsopr.descr
 t1.katsopr.nsopr
 t1.katsopr.dsopr
 ROUND(t1.katsopr.summa,2)
 t1.grdescr.name
! ROUND(t1.katsopr.summa,2) : 'SUM'
 ROUND(t1.katsopr.summa,2) : 'SUM'
.endfields
^
.begin
 c1:=coGetTune(' РFIN.USER.CPLANSSCH Р');
 IF table3.getfirst planssch<> tsOK {};
 s1:=table3.planssch.name;
 d1:=DGetTune('dat_m_ot');
 d2:=DATE(LAST_DAY(d1),MONTH(d1),YEAR(d1));
 IF RunDialog('C_common::GetIntervalDates',d1,d2,b1)=cmCancel then
   {
   Message ('Отказ от выбора');
  control_108aktsb.fexit;                                  //при отказе, выход из пр-мы
 Р   }
  t1.getfirst;
 Р IF b1=0 SETORDER(tiOrd1);                               //сортировка по выбранному типу
 ELSE SETORDER(tiOrd2);
 Р v1:=0;
 v2:=0;
end.
.{Table 't1.katsopr'
.[h                                                      //печать шапки на каждом листе
                        БСписок актов на оказание услуг без бухгалтерских проводок Б
                                    Б c  В@@@@@@@@@@ В по  В@@@@@@@@@@ Г

 План счетов:@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@                  Лист @np@
 ┌────────┬───────────┬───────────────────┬────────────┬───────────────────┬─────────────────────────────────────────────────
 │ Группа │Дескриптор │       Номер       │    Дата    │     Сумма по      │             Наименование группы
 │        │           │       акта        │    акта    │       акту        │
 └────────┴───────────┴───────────────────┴────────────┴───────────────────┴─────────────────────────────────────────────────
.]h
.{Table 't1.oborot'
.begin
 v1:=v1+t1.oborot.sumob;
end.
.}
.{?internal;ROUND(v1,2)=0;
!.{table 't1.desgr'
! @@@@@@@@@ -  В@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ В
!.{Table 't1.katsopr'
  @@@@@@@@@ @@@@@@@@@@@ @@@@@@@@@@@@@@@@@@@ @@@@@@@@@@@@ &'&&&&&&&&&&&&&&&.&&  @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
!.}             //katsopr
 В!Всего по группе                                         &'&&&&&&&&&&&&&&&.&& В
!.}            //desgr
.}            //internal
.begin
 v1:=0;
end.
.}
 Б Итого по ведомости:                                    &'&&&&&&&&&&&&&&&.&& С
 Р.endform Р