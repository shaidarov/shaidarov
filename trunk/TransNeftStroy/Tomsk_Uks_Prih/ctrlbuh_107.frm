 Р.form 'ctrlbuh_107'
.nameinlist 'Отчет о привязке КАУ в бухгалтерских проводках'
.group 'Контроль соответствия бухгалтерского контура'
.ard
.defo landscape
.p 60
.var
 d1,d2:date;
 c1:comp;
 s1:string;
 priz1,priz2,priz3,priz4,priz5,priz6,priz7,priz8,priz9,priz10,priz11,priz12,priz13,priz14:boolean;
.endvar
.begin
 c1:= РCoGetTune('FIN.USER.CPLANSSCH Р');
 s1:= РSGetTune('FIN.USER.CPLANSSCH Р');
 d1:=DGetTune('Dat_m_ot');
 d2:=DATE(LAST_DAY(d1),MONTH(d1),YEAR(d1));
 IF RunDialog('C_common::GetIntervalDates',d1,d2)<>cmOK ctrlbuh_107.fexit;
end.
.create view t1 AS SELECT oborot.*,buhschet1.*,buhschet2.*,katdoc.*
FROM oborot,buhschet buhschet1,buhschet buhschet2,katdoc
WHERE
((
 d1<<=oborot.datob
 AND d2>>=oborot.datob
 AND c1==oborot.cplanssch
 AND oborot.scheto==buhschet1.schet
 AND oborot.subossch==buhschet1.subsch
 AND oborot.schetk==buhschet2.schet
 AND oborot.subschk==buhschet2.subsch
 AND oborot.tidk==katdoc.tidkgal
));
.fields
 d1
 d2
 s1
 t1.katdoc.name
 t1.oborot.nodok
 t1.oborot.scheto
 t1.oborot.subossch
 t1.oborot.schetk
 t1.oborot.subschk
 t1.oborot.datob
 t1.oborot.sumob
 IF(priz1,'+','')
 IF(priz2,'+','')
 IF(priz3,'+','')
 IF(priz4,'+','')
 IF(priz5,'+','')
 IF(priz6,'+','')
 IF(priz7,'+','')
 IF(priz8,'+','')
 IF(priz9,'+','')
 IF(priz10,'+','')
 IF(priz11,'+','')
 IF(priz12,'+','')
 IF(priz13,'+','')
 IF(priz14,'+','')
.endfields
.{table 't1'
.[h
                                                Отчет о привязке КАУ в бухгалтерских проводках
                                                       c @@@@@@@@@@ по @@@@@@@@@@
 План счетов:@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@                                                                                                                        Лист @np@
┌────────────────────────────────────────┬───────────┬─────────┬─────────┬──────────┬───────────────┬─────────────────────────────────────────┬─────────────────────────────────────────┐
│                                        │   Номер   │         │         │   Дата   │    Сумма      │          Контроль КАУ в дебете          │       Контроль КАУ в кредите            │
│            Тип документа               │ документа │  Дебет  │ Кредит  │  оборота │   оборота     ├─────┬─────┬─────┬─────┬─────┬─────┬─────┼─────┬─────┬─────┬─────┬─────┬─────┬─────┤
│                                        │           │         │         │          │               │КАУ1 │КАУ2 │КАУ3 │КАУ4 │КАУ5 │КАУ6 │Подра│КАУ1 │КАУ2 │КАУ3 │КАУ4 │КАУ5 │КАУ6 │Подра│
│                                        │           │         │         │          │               │     │     │     │     │     │     │здел.│     │     │     │     │     │     │здел.│
└────────────────────────────────────────┴───────────┴─────────┴─────────┴──────────┴───────────────┴─────┴─────┴─────┴─────┴─────┴─────┴─────┴─────┴─────┴─────┴─────┴─────┴─────┴─────┘
.]h
.begin
IF t1.oborot.scheto<>''
{
 priz1:=t1.oborot.kauos[1]=COMP(0) AND t1.buhschet1.kodtable[1]<>0;
 priz2:=t1.oborot.kauos[2]=COMP(0) AND t1.buhschet1.kodtable[2]<>0;
 priz3:=t1.oborot.kauos[3]=COMP(0) AND t1.buhschet1.kodtable[3]<>0;
 priz4:=t1.oborot.kauos[4]=COMP(0) AND t1.buhschet1.kodtable[4]<>0;
 priz5:=t1.oborot.kauos[5]=COMP(0) AND t1.buhschet1.kodtable[5]<>0;
 priz6:=t1.oborot.kauos[6]=COMP(0) AND t1.buhschet1.kodtable[6]<>0;
 priz7:=t1.oborot.kodspo=COMP(0) AND t1.buhschet1.visib=0;
}
ELSE
{
 priz1:=false;
 priz2:=false;
 priz3:=false;
 priz4:=false;
 priz5:=false;
 priz6:=false;
 priz7:=false;
}
IF t1.oborot.schetk<>''
{
 priz8:=t1.oborot.kauks[1]=COMP(0) AND t1.buhschet2.kodtable[1]<>0;
 priz9:=t1.oborot.kauks[2]=COMP(0) AND t1.buhschet2.kodtable[2]<>0;
 priz10:=t1.oborot.kauks[3]=COMP(0) AND t1.buhschet2.kodtable[3]<>0;
 priz11:=t1.oborot.kauks[4]=COMP(0) AND t1.buhschet2.kodtable[4]<>0;
 priz12:=t1.oborot.kauks[5]=COMP(0) AND t1.buhschet2.kodtable[5]<>0;
 priz13:=t1.oborot.kauks[6]=COMP(0) AND t1.buhschet2.kodtable[6]<>0;
 priz14:=t1.oborot.kodspk=COMP(0) AND t1.buhschet2.visib=0;
}
ELSE
{
 priz8:=false;
 priz9:=false;
 priz10:=false;
 priz11:=false;
 priz12:=false;
 priz13:=false;
 priz14:=false;
}
end.
.{?internal;priz1 OR priz2 OR priz3 OR priz4 OR priz5 OR priz6 OR priz7 OR priz8 OR priz9 OR priz10 OR priz11 OR priz12;
 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ @@@@@@@@@@@ @@@@@ @@@ @@@@@ @@@ @@@@@@@@@@ &&&&&&&&&&&&.&&   @     @     @     @     @     @     @     @     @     @     @     @     @     @
.}
.}
.endform Р