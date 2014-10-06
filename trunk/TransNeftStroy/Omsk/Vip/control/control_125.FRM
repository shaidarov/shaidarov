.form 'control_125'
.nameinlist 'Реестр несоответствий ДО в платежных документах и бухгалтерских проводках'
.group 'Контроль соответствия бухгалтерского контура'
.ard
.p 60
.defo portrait
.var
 typedoc:integer;
 namedoc:string;
 numb1,numb2:string;
 d1,d2,dat1,dat2:date;
 summ1:double;
 c1:comp;
 s1:string;
 priz,priz1:boolean;
.endvar
.create view table3 AS
SELECT tmpgrn.*,katdoc.*
WHERE
((
1991==tmpgrn.wlist
AND 0==katdoc.sysnum
AND tmpgrn.l==katdoc.tidkgal
));
.create view table2 AS
SELECT tmpgrn.*;
.create view t1 AS
SELECT tmpgrn.*,plpor.*,oborot.*,basedoc1.*,basedoc2.*,basefin.*,katdoc.*,katbank1.*,katbank2.*
FROM basedoc basedoc1,basedoc basedoc2,katbank katbank1,katbank katbank2
WHERE
((
1990==tmpgrn.wlist
AND tmpgrn.l/==plpor.tidkgal
AND d1<<=plpor.datvip
AND d2>>=plpor.datvip
AND plpor.tidk/==oborot.tidk
AND plpor.nrec/==oborot.csoprdoc
AND CoGettune('FIN.USER.CPLANSSCH')==oborot.cplanssch
AND oborot.kauos[3]==basedoc1.nrec
AND oborot.kauks[3]==basedoc2.nrec
AND plpor.nrec==basefin.cplpor
AND plpor.cbankplat==katbank1.nrec
AND plpor.cbankpol==katbank2.nrec
))
AND (oborot.tblos[3]=6 OR oborot.tblks[3]=6);
.begin
 d1:=dGetTune('DAT_M_OT');
 d2:=DATE(LAST_DAY(d1),MONTH(d1),YEAR(d1));
 IF RunDialog('C_common::GetIntervalDates',d1,d2)<> cmOK control_125.fexit;
end.
.begin
 table2.delete tmpgrn WHERE ((1990==wlist));
 table2.delete tmpgrn WHERE ((1991==wlist));
 table2.tmpgrn.wlist:=1990;
 table2.tmpgrn.l:=1;
 table2.insert CURRENT tmpgrn;
 table2.tmpgrn.l:=2;
 table2.insert CURRENT tmpgrn;
 table2.tmpgrn.l:=21;
 table2.insert CURRENT tmpgrn;
 table2.tmpgrn.l:=22;
 table2.insert CURRENT tmpgrn;
end.
.{table 't1.tmpgrn'
.{table 't1.Plpor'
.{table 't1.Oborot'
.begin
 typedoc:=t1.plpor.tidkgal;
 numb1:=t1.plpor.nodok;
 dat1:=t1.plpor.datvip;
 dat2:=t1.oborot.datob;
 summ1:=t1.oborot.sumob;
 numb2:=IF(t1.oborot.tblos[3]=6,t1.basedoc1.nodoc,t1.basedoc2.nodoc)+' от '+STRING(IF(t1.oborot.tblos[3]=6,t1.basedoc1.ddoc,t1.basedoc2.ddoc));
 c1:=IF(t1.oborot.tblos[3]=6,t1.oborot.kauos[3],t1.oborot.kauks[3]);
 s1:=IF(t1.plpor.direct=0,t1.katbank1.name,t1.katbank2.name);
 priz:=true;
end.
.{table 't1.Basefin'
.begin
 IF t1.basefin.cbasedoc=c1 priz:=false;
end.
.}
.{?internal;priz;
.begin
 table2.tmpgrn.wlist:=1991;
 table2.tmpgrn.l:=typedoc;
 table2.tmpgrn.s:=s1;
 table2.tmpgrn.ss[1]:=numb1;
 table2.tmpgrn.ss[2]:=numb2;
 table2.tmpgrn.ds[1]:=dat1;
 table2.tmpgrn.ds[2]:=dat2;
 table2.tmpgrn.sums[1]:=summ1;
 table2.insert CURRENT tmpgrn;
end.
.}
.}
.}
.}
.fields
 commonformheader
 d1
 d2
 table3.katdoc.name
 table3.tmpgrn.s
 table3.tmpgrn.ss[1]
 table3.tmpgrn.ds[1]
 table3.tmpgrn.ds[2]
 table3.tmpgrn.sums[1]
 table3.tmpgrn.ss[2]
.endfields
.begin
 typedoc:=0;
end.
^
.{table 'Table3'
.[h
 И          Реестр несоответствий ДО в платежных документах и бухгалтерских проводках
                               c @@@@@@@@@@ по @@@@@@@@@@
                                                                                    Лист @np@
┌────────────┬──────────┬──────────┬────────────┬────────────────────────────────────────────┐
│   Номер    │ Дата     │   Дата   │   Сумма    │                                            │
│ платежного │платежного│  оборота │  оборота   │   Номер,дата ДО в бухгалтерской проводке   │
│ документа  │документа │          │            │                                            │
└────────────┴──────────┴──────────┴────────────┴────────────────────────────────────────────┘ И
.]h
.begin
 priz:=IF(table3.tmpgrn.l<>typedoc,true,false);
 typedoc:=table3.tmpgrn.l;
 priz1:=IF(priz,true,IF(table3.tmpgrn.s<>namedoc,true,false));
 namedoc:=table3.tmpgrn.s;
end.
.{?internal;priz;
 Й @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ Й
.}
.{?internal;priz1;
 Й      @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ Й
.}
 И @@@@@@@@@@@@ @@@@@@@@@@ @@@@@@@@@@ &&&&&&&&&.&& @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ И
.}
.begin
 table2.delete tmpgrn WHERE ((1990==wlist));
 table2.delete tmpgrn WHERE ((1991==wlist));
end.
.endform