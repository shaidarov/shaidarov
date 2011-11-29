.LinkForm 'PRINTINMOVNAK_01_AKT' Prototype is 'PRINTINMOVNAK'
.Group 'Vnut'
.NameInList 'СТН. Акт передачи в эксплуатацию'
.LM 13
.tm 10
.var
  ProcIzn:Double
  SumIzn:Double
  SchetZ:String
  SumIznItog:Double
.endvar
.Create                                view tAkt
 as select * from
  KatSopr
, MBPin
, SpSopr
, KatPodr
, KatMOL
Where ((   НРЕКДОКУМЕНТА      == KatSopr.nRec
       and KatSopr.nRec       == MBPin.cSopr
       and НРЕКПОЗИЦИИ        == SpSopr.nRec
       and SpSopr.cMCUsl      == KatMBP.cMC
       and KatMBP.nRec        == MBPin.cMBP             (noindex)
       and SpSopr.cParty      == MBPin.cPartyF          (noindex)

       and KatSopr.cMolTo     == KatMOL.nRec
       and KatSopr.cPodrTo    == KatPodr.nRec
       )) ;
.fields
  CommonFormHeader
  NOM
  DAT
  NOMMC
  NAMEMC
  ED
  KOL
  PRICE
  SumPr
  ProcIzn
  SumIzn
  Sum
  SumIznItog
  DoubleToString(0, Sum)
  DoubleToString(0, SumIznItog)
  SchetZ
  МОЛ_КУДА
  МОЛ_ОТКУДА
.endfields
.{
 Р ^

                                                    АКТ ^ от ^
                                                  передачи в эксплуатацию
                                     отдельных предметов в составе оборотных средств

  Отпуск разрешил: Жигалов А.М. (зам. директора)

┌───────────┬─────────────────────────────┬────────┬───────┬──────────────┬──────────────┬────────────────┬────────────────────┐
│    Код    │   Наименование предметов    │Ед. изм.│Кол-во │  Цена, руб.  │ Сумма, руб.  │Срок службы     │ Сумма, подлежащая  │
│           │                             │        │       │              │              │в мес. или %    │ отнесению на счета │
│           │                             │        │       │              │              │потери стоимости│ затрат, руб.       │
│           │                             │        │       │              │              │при передачи    │                    │
│           │                             │        │       │              │              │в эксплуатацию  │                    │
.{
.begin
if (tAkt.GetFirst KatSopr = tsOK) {}
if (tAkt.GetFirst MBPin  = tsOK)  {}
if (tAkt.GetFirst SpSopr = tsOK)  {}
  ProcIzn       := tAkt.MBPin.PERCNACH;
  SumIzn        := tAkt.MBPIN.SUMMAISNN;
  SumIznItog    := SumIznItog + SumIzn;
end.
├───────────┼─────────────────────────────┼────────┼───────┼──────────────┼──────────────┼────────────────┼────────────────────│
│@@@@@@@@@@@│@@@@@@@@@@@@@@@@@@@@@@@@@@@@@│@@@@@@@@│&#'&&&&│&#'&&&&&&&&&&&│&#'&&&&&&&&&&&│&&&&&&&&&&&&&&&&│&#'&&&&&&&&&&&&&&.&&│
.}
└───────────┴─────────────────────────────┴────────┴───────┴──────────────┴──────────────┴────────────────┴────────────────────┘
                                 Итого:                                    &#'&&&&&&&&&&&                  &#'&&&&&&&&&&&&&&.&&

Итого передано в эксплуатацию предметов на сумму: @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
.begin
if (tAkt.GetFirst KatPodr = tsOK) {}
if (tAkt.GetFirst KatMOL = tsOK)  {}
   SchetZ := tAkt.KatPodr.Kod;

        Case tAkt.KatMOl.Kod of
              4611793393317973037:
              {SchetZ := '20_10';}
              4611736145954476537:
              {SchetZ := '20_10_2';}
        end; // case
end.
Износ в сумме @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
отнести на счёт  Б^ Б

Принял:   ^

Отпустил: ^
.}
.endform
