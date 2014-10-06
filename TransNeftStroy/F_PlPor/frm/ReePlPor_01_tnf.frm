.LinkForm 'REEPLPOR_01_tnf' Prototype is 'REEPLPOR'
.Group 'Налоговое платежное поручение'
.Group 'Платежное поручение'
.Group 'Бухгалтерская справка'  
.NameInList 'Расхождения суммы по документу и проводок к нему'
.p 60
.DEFO LANDSCAPE
.create view obor
from plpor, oborot
where
((
PlPorNRec    == plpor.nrec      and
plpor.tidk   == oborot.tidk     and
plpor.nrec   == oborot.csoprdoc and
cogettune('FIN.USER.CPLANSSCH') == oborot.cplanssch
));
.var
 sumobor: double
.endvar
.fields
  CommonFormHeader
  c0p9
  c0p1
  c0p4
  cFil0
  cFil1
  c1p1
  c1p2
  c1p3
  OrgName
  c1p5
  BankName
  BankKod
  BankSchet
  c1p9
.endfields
 Р^
          Реестр документов : ^
                               ^
Ведомость сформирована в ^
.if REEPLPORFIL
Применен фильтр...
.{
  ^ ^
.}
.else
.end
.{
.[H
                                                                                                                                                                         лист @np@
──────────┬──────────┬──────┬────────────────────────────────┬────────────────┬─────────────────────┬─────────────┬───────────────┬─────────────────────────────────────────────────
   Дата   │   Дата   │Номер │          Плательщик /          │    Сумма       │       Банк          │    Код      │   Расчетный   │                Наименование платежа
 выписки  │  оплаты  │док-та│          Получатель            │                │   плат./ получат.   │   банка     │     счет      │
──────────┴──────────┴──────┴────────────────────────────────┴────────────────┴─────────────────────┴─────────────┴───────────────┴─────────────────────────────────────────────────
.]H
.if REEPLPOR00
.else
.end
.{
.begin
sumobor:=0;
obor._loop plpor
{
 obor._loop oborot
 {
  if (obor.oborot.VHPROP='+') and (obor.oborot.datob=obor.plpor.datob)
   sumobor:=sumobor+obor.oborot.sumob;
 };
};
end.
.{?internal;round(sumobor,6)<>double(c1p5);
@@@@@@@@@@ @@@@@@@@@@ @@@@@@ @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ &'&&&&&&&&&&&&&& @@@@@@@@@@@@@@@@@@@@@ @@@@@@@@@@@@@ @@@@@@@@@@@@@@@ @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
.}
.if REEPLPOR01
.{
.}
.else
.end
.}
.if REEPLPOR02
.else
.end
.} Р
.endform