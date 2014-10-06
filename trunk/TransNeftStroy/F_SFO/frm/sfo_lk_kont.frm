.LinkForm 'PERSCARDongss' Prototype is 'PERSCARDPROT'
.Group 'Личные карточки учета СФО'
.Group 'Личные карточки учета СФО (Беларусь)'
.NameInList 'ТНС. Контроль заполнения внешних атрибутов'
.var
prim :string;
.endvar

.Create view t1
as select
perssfo.nrec
from
     perssfo,
     mbpin,
     attrnam attrnams,
     attrval attrvals,
     attrnam attrnamv,
     attrval attrvalv,
     attrnam attrnamc,
     attrval attrvalc,
     attrnam attrnamp,
     attrval attrvalp,
     attrnam attrnamo,
     attrval attrvalo,
     attrnam,
     attrval

where ((
        CardNo              == perscard.cardnom

        and word(4005)      == attrnams.wtable
        and 'Статьи затрат' == attrnams.name
        and word(4005)      == attrvals.wtable
        and perscard.nrec   == attrvals.crec
        and attrnams.nrec   == attrvals.cattrnam

        and word(4005)      == attrnamv.wtable
        and 'Виды продукции, работ, услуг' == attrnamv.name
        and word(4005)      == attrvalv.wtable
        and perscard.nrec   == attrvalv.crec
        and attrnamv.nrec   == attrvalv.cattrnam

        and perscard.cpodr  == fpco.cmean(noindex)

        and word(4005)      == attrnamc.wtable
        and 'Центры ответственности' == attrnamc.name
        and word(4005)      == attrvalc.wtable
        and perscard.nrec   == attrvalc.crec
        and attrnamc.nrec   == attrvalc.cattrnam

        and perscard.cpodr  ==  katpodr.nrec

        and word(4005)      == attrnamp.wtable
        and 'Подразделение отнесения затрат' == attrnamp.name
        and word(4005)      == attrvalp.wtable
        and perscard.nrec   == attrvalp.crec
        and attrnamp.nrec   == attrvalp.cattrnam

        and word(4005)      == attrnam.wtable
        and 'Счет отнесения затрат' == attrnam.name
        and word(4005)      == attrval.wtable
        and perscard.nrec   == attrval.crec
        and attrnam.nrec    == attrval.cattrnam

        and word(4005)      == attrnamo.wtable
        and 'Объекты строительства' == attrnamo.name
        and word(4005)      == attrvalo.wtable
        and perscard.nrec   == attrvalo.crec
        and attrnamo.nrec   == attrvalo.cattrnam

      ))
;

.fields
  CardNo
  substr(trim(prim),1,length(trim(prim))-1)
.endfields
Отчет о проверке заполнения атрибутов в Личных карточках

┌────────────────┬─────────────────────────────────────────────────────────────────────────────┐
│Номер карточки  │                                Описание                                     │
├────────────────┼─────────────────────────────────────────────────────────────────────────────┤
.{
.begin

prim:='';

t1._loop perscard
 {
if t1.getfirst attrnam = tsok
if t1.getfirst attrval <> tsok
 {
  prim:='Не указан счет затрат, ';
 }

if t1.getfirst attrnamo = tsok
if t1.getfirst attrvalo <> tsok
 {
  prim:=prim+'Не указан объект строительства, ';
 }

if t1.getfirst attrnams = tsok
if t1.getfirst attrvals <> tsok
 {
  prim:=prim+'Не указана статья затрат, ';
 }

if t1.getfirst attrnamv = tsok
if t1.getfirst attrvalv <> tsok
 {
  prim:=prim+'Не указан вид продукции, ';
 }

if t1.getfirst attrnamc = tsok
if t1.getfirst attrvalc <> tsok
 {
  prim:=prim+'Не указан центр ответственности, ';
 }

if t1.getfirst attrnamp = tsok
if t1.getfirst attrvalp <> tsok
 {
  prim:=prim+'Не указано подразделение отнесения затрат,';
 }

 }
end.
.{?internal; prim<>''
│@@@@@@@@@@@@@@@@│@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@│
├────────────────┼─────────────────────────────────────────────────────────────────────────────┤
.}
.{?internal; (IsCustom)
.}
.{?internal;(frmFlag=True)
.{CheckEnter FRMCIRCLE
.}
.}
.{?internal;(spcFlag=True)
.{CheckEnter SPCCIRCLE
.}
.}
.{
.}
.}
└──────────────────────────────────────────────────────────────────────────────────────────────┘
.endform
