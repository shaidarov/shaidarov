 Р.form 'ctrlbuh_105_n'
.nameinlist '2008 Отчет о соответствии книги покупок бухгалтерским проводкам'
.group 'Контроль соответствия бухгалтерского контура'
.p 80
.ard
.var
 d1,d2:date;
 booknr:comp;
 sums:double;
 npp:integer;
.endvar
.create view table3
AS SELECT tmpgrn.*
WHERE
((
 1981==tmpgrn.wlist
));
.create view table2
AS  РSELECT oborot.*
WHERE
((
 'T68'==oborot.scheto
 AND 'T19'==oborot.schetk
 AND d1<<=oborot.datob
 AND d2>>=oborot.datob
))
 AND oborot.subossch='14'
 AND oborot.kauos[1]=0064000000000969h;
 Р.create view t1
AS SELECT bookprzk.*,katorg.*
WHERE
((
 2==bookprzk.direct
 AND 0==bookprzk.regdoc
 AND d1<<=bookprzk.dreg
 AND d2>>=bookprzk.dreg
 AND bookprzk.corg==katorg.nrec
));
.begin
 table3.delete tmpgrn WHERE ((1981==wlist));
 npp:=0;
 d1:=DGetTune('Dat_m_ot');
 d2:=DATE(LAST_DAY(d1),MONTH(d1),YEAR(d1));
 IF RunDialog('C_common::GetIntervalDates',d1,d2)<>cmOK ctrlbuh_105_n.fexit;
end.
.{table 't1'
.begin
 booknr:=t1.bookprzk.cschfact;
 IF table3.getfirst tmpgrn WHERE ((1981==tmpgrn.wlist AND booknr==tmpgrn.crec1))<>tsOK
 {
  table3.tmpgrn.wlist:=1981;
  table3.tmpgrn.crec1:=booknr;
  table3.tmpgrn.d:=t1.bookprzk.dreg;
  table3.tmpgrn.s:=t1.bookprzk.num;
  table3.tmpgrn.ss[1]:=IF(t1.katorg.tiporg<>'',t1.katorg.tiporg+' ','')+t1.katorg.name;
  table3.tmpgrn.sums[1]:=t1.bookprzk.sum[2]+t1.bookprzk.sum[5];
  table3.tmpgrn.sums[2]:=0;
  table3.insert CURRENT tmpgrn;
 }
 ELSE
 {
  table3.tmpgrn.sums[1]:=table3.tmpgrn.sums[1]+t1.bookprzk.sum[2]+t1.bookprzk.sum[5];
  table3.tmpgrn.sums[2]:=table3.tmpgrn.sums[2];
  table3.update CURRENT tmpgrn;
 }
end.
.}
.{table 'Table2'
.begin
 booknr:= РIF(table2.oborot.tblks[1]=79,table2.oborot.kauks[1],IF(table2.oborot.tblks[2]=79,table2.oborot.kauks[2],
         IF(table2.oborot.tblks[3]=79,table2.oborot.kauks[3],IF(table2.oborot.tblks[4]=79,table2.oborot.kauks[4],
         IF(table2.oborot.tblks[5]=79,table2.oborot.kauks[5],IF(table2.oborot.tblks[6]=79,table2.oborot.kauks[6],COMP(0))))))) Р;
 IF table3.getfirst tmpgrn WHERE ((1981==tmpgrn.wlist AND booknr==tmpgrn.crec1))=tsOK
 {
  table3.tmpgrn.sums[1]:=table3.tmpgrn.sums[1];
  table3.tmpgrn.sums[2]:=table3.tmpgrn.sums[2]+table2.oborot.sumob;
  table3.update CURRENT tmpgrn;
 }
end.
.}
.begin
 table3.update tmpgrn WHERE ((1981==wlist)) SET tmpgrn.crec1:=COMP(0);
end.
.fields
 d1
 d2
 npp
 table3.tmpgrn.s
 table3.tmpgrn.d
 table3.tmpgrn.ss[1]
 table3.tmpgrn.sums[1]
 table3.tmpgrn.sums[2]
.endfields
.{table 'Table3'
.[h
                       Отчет о соответствии книги покупок бухгалтерским проводкам c @@@@@@@@@@ по @@@@@@@@@@
                                                                                                                        Лист @np@
┌─────┬───────────────────────────┬───────────┬──────────────────────────────────────────────────────┬─────────────┬─────────────┐
│  №  │    Номер счета-фактуры    │   Дата    │                     Контрагент                       │Сумма в книге│   Сумма     │
│ п/п │                           │регистрации│                                                      │   покупок   │  оборотов   │
└─────┴───────────────────────────┴───────────┴──────────────────────────────────────────────────────┴─────────────┴─────────────┘
.]h
.{?internal;ROUND(table3.tmpgrn.sums[1],2)<>ROUND(table3.tmpgrn.sums[2],2);
.begin
 npp:=npp+1;
end.
 &&&&& @@@@@@@@@@@@@@@@@@@@@@@@@@@ @@@@@@@@@@@ @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ &&&&&&&&&&.&& &&&&&&&&&&.&&
.}
.}
.begin
 table3.delete tmpgrn WHERE ((1981==wlist));
end.
.endform Р