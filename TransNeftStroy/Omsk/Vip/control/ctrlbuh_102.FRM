 Ш.form ctrlbuh_102
.nameinlist 'Список проводок с неправильным выбором уровня пользовательской аналитики'
.group 'Контроль соответствия бухгалтерского контура'
.ard
.p 80
.var
 d1,d2:date;
 i:integer;
 w1,w2:word;
 priz:ARRAY [1..12] OF boolean;
 c1,c2:comp;
 nameplan:string;
.endvar
.create view table2 AS SELECT katkau.*
WHERE
((
 w1==katkau.kodgroup
));
.create view table3 AS SELECT spkau1.*,spkau2.*
FROM spkau spkau1,spkau spkau2
WHERE
((
 c1==spkau1.nrec
 AND spkau1.kodgrkau/==spkau2.kodgrkau
 AND spkau1.nrec/==spkau2.cnode
));
.create view t1 AS SELECT oborot.*,katdoc.*
WHERE
((
 c2==oborot.cplanssch
 AND d1<<=oborot.datob
 AND d2>>=oborot.datob
 AND 0==katdoc.sysnum
 AND oborot.tidk==katdoc.tidkgal
));
.fields
 commonformheader
 d1
 d2
 nameplan
 t1.oborot.datob
 t1.katdoc.name
 t1.oborot.sumob
 SUBSTR(t1.oborot.scheto,2,3)
 t1.oborot.subossch
 IF(priz[1],'+','')
 IF(priz[2],'+','')
 IF(priz[3],'+','')
 IF(priz[4],'+','')
 IF(priz[5],'+','')
 IF(priz[6],'+','')
 SUBSTR(t1.oborot.schetk,2,3)
 t1.oborot.subschk
 IF(priz[7],'+','')
 IF(priz[8],'+','')
 IF(priz[9],'+','')
 IF(priz[10],'+','')
 IF(priz[11],'+','')
 IF(priz[12],'+','')
.endfields
.begin
 c2:=CoGetTune('FIN.USER.CPLANSSCH');
 nameplan:=SGetTune('FIN.USER.CPLANSSCH');
 d1:=DGetTune('dat_m_ot');
 d2:=DATE(LAST_DAY(d1),MONTH(d1),YEAR(d1));
 IF RunDialog('C_common::GetIntervalDates',d1,d2)=cmCancel ctrlbuh_102.fexit;
end.
^
.{table 't1'
.[h
                         Список проводок с неправильным выбором уровня пользовательской аналитики c @@@@@@@@@@ г. по @@@@@@@@@@ г.
 План счетов: @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@                                                Лист @np@
┌──────────┬─────────────────────────────────────────────────────────────────┬───────────────┬──────────────────────────────┬──────────────────────────────┐
│          │                                                                 │               │          Д е б е т           │          К р е д и т         │
│   Дата   │                                                                 │     Сумма     ├──────┬───────────────────────┼──────┬───────────────────────┤
│  оборота │                   Хозяйственный документ                        │    оборота    │ Счет,│         К А У         │ Счет,│         К А У         │
│          │                                                                 │               │ суб- ├───┬───┬───┬───┬───┬───┤ суб- ├───┬───┬───┬───┬───┬───┤
│          │                                                                 │               │ счет │ 1 │ 2 │ 3 │ 4 │ 5 │ 6 │ счет │ 1 │ 2 │ 3 │ 4 │ 5 │ 6 │
└──────────┴─────────────────────────────────────────────────────────────────┴───────────────┴──────┴───┴───┴───┴───┴───┴───┴──────┴───┴───┴───┴───┴───┴───┘
.]h
.begin
 FOR (i:=1;i<14;i:=i+1)
 {
  priz[i]:=false;
 }
 c1:=t1.oborot.kauos[1];
 w1:=t1.oborot.tblos[1];
 w2:=0;
 IF table2.getfirst katkau=tsOK
 {
  w2:=table2.katkau.sysnum;
  IF w2=1
  {
   IF table3.getfirst = tsOK priz[1]:=true;
  }
 }
 c1:=t1.oborot.kauos[2];
 w1:=t1.oborot.tblos[2];
 w2:=0;
 IF table2.getfirst katkau=tsOK
 {
  w2:=table2.katkau.sysnum;
  IF w2=1
  {
   IF table3.getfirst = tsOK priz[2]:=true;
  }
 }
 c1:=t1.oborot.kauos[3];
 w1:=t1.oborot.tblos[3];
 w2:=0;
 IF table2.getfirst katkau=tsOK
 {
  w2:=table2.katkau.sysnum;
  IF w2=1
  {
   IF table3.getfirst = tsOK priz[3]:=true;
  }
 }
 c1:=t1.oborot.kauos[4];
 w1:=t1.oborot.tblos[4];
 w2:=0;
 IF table2.getfirst katkau=tsOK
 {
  w2:=table2.katkau.sysnum;
  IF w2=1
  {
   IF table3.getfirst = tsOK priz[4]:=true;
  }
 }
 c1:=t1.oborot.kauos[5];
 w1:=t1.oborot.tblos[5];
 w2:=0;
 IF table2.getfirst katkau=tsOK
 {
  w2:=table2.katkau.sysnum;
  IF w2=1
  {
   IF table3.getfirst = tsOK priz[5]:=true;
  }
 }
 c1:=t1.oborot.kauos[6];
 w1:=t1.oborot.tblos[6];
 w2:=0;
 IF table2.getfirst katkau=tsOK
 {
  w2:=table2.katkau.sysnum;
  IF w2=1
  {
   IF table3.getfirst = tsOK priz[6]:=true;
  }
 }
 c1:=t1.oborot.kauks[1];
 w1:=t1.oborot.tblks[1];
 w2:=0;
 IF table2.getfirst katkau=tsOK
 {
  w2:=table2.katkau.sysnum;
  IF w2=1
  {
   IF table3.getfirst = tsOK priz[7]:=true;
  }
 }
 c1:=t1.oborot.kauks[2];
 w1:=t1.oborot.tblks[2];
 w2:=0;
 IF table2.getfirst katkau=tsOK
 {
  w2:=table2.katkau.sysnum;
  IF w2=1
  {
   IF table3.getfirst = tsOK priz[8]:=true;
  }
 }
 c1:=t1.oborot.kauks[3];
 w1:=t1.oborot.tblks[3];
 w2:=0;
 IF table2.getfirst katkau=tsOK
 {
  w2:=table2.katkau.sysnum;
  IF w2=1
  {
   IF table3.getfirst = tsOK priz[9]:=true;
  }
 }
 c1:=t1.oborot.kauks[4];
 w1:=t1.oborot.tblks[4];
 w2:=0;
 IF table2.getfirst katkau=tsOK
 {
  w2:=table2.katkau.sysnum;
  IF w2=1
  {
   IF table3.getfirst = tsOK priz[10]:=true;
  }
 }
 c1:=t1.oborot.kauks[5];
 w1:=t1.oborot.tblks[5];
 w2:=0;
 IF table2.getfirst katkau=tsOK
 {
  w2:=table2.katkau.sysnum;
  IF w2=1
  {
   IF table3.getfirst = tsOK priz[11]:=true;
  }
 }
 c1:=t1.oborot.kauks[6];
 w1:=t1.oborot.tblks[6];
 w2:=0;
 IF table2.getfirst katkau=tsOK
 {
  w2:=table2.katkau.sysnum;
  IF w2=1
  {
   IF table3.getfirst = tsOK priz[12]:=true;
  }
 }
end.
.{?internal;priz[1] OR priz[2] OR priz[3] OR priz[4] OR priz[5] OR priz[6] OR priz[7] OR priz[8] OR priz[9] OR priz[10] OR priz[11] OR priz[12]
 @@@@@@@@@@ @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ &&&&&&&&&&&&.&& @@@ @@  @   @   @   @   @   @  @@@ @@  @   @   @   @   @   @
.}
.}

*Неправильный выбор - выбран не последний уровень иерархии.
Знаком + отмечен уровень КАУ в котором неправильно выбрано значение пользовательской аналитики.
.endform