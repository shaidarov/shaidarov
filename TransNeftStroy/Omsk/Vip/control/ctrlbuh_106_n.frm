 Р.form 'ctrlbuh_106_n'
.nameinlist '2008 Отчет о наличии записей в книге покупок'
.group 'Контроль соответствия бухгалтерского контура'
.p 80
.ard
.var
 d1,d2:date;
 npp:integer;
.endvar
.create view t1
AS Select oborot.kauks[2],schfact.NREC,oborot.tblks[2],schfact.num,schfact.dpost,bookprzk.num,bookprzk.dreg,katorg.name
 FROM  oborot, schfact, bookprzk, KATORG
 WHERE
((
 'T68'==oborot.scheto
 AND '14'==oborot.subossch
 AND d1<<=oborot.datob
 AND d2>>=oborot.datob
 AND IF(oborot.tblks[1]=79,oborot.kauks[1],IF(oborot.tblks[2]=79,oborot.kauks[2],IF(oborot.tblks[3]=79,oborot.kauks[3],
     IF(oborot.tblks[4]=79,oborot.kauks[4],IF(oborot.tblks[5]=79,oborot.kauks[5],IF(oborot.tblks[6]=79,oborot.kauks[6],COMP(0)))))))/==schfact.nrec
 AND schfact.nrec==bookprzk.cschfact
 AND schfact.corg==katorg.nrec
))
 AND oborot.schetk='T19'
 AND oborot.kauos[1]=0064000000000969h
 AND NOT IsValidAll(tnbookprzk);  
.begin
 npp:=0;
 d1:=DGetTune('Dat_m_ot');
 d2:=DATE(LAST_DAY(d1),MONTH(d1),YEAR(d1));
 IF RunDialog('C_common::GetIntervalDates',d1,d2)<>cmOK ctrlbuh_106_n.fexit;
end.
.fields
 d1
 d2
 npp
 t1.schfact.num
 t1.schfact.dpost
 IF(t1.katorg.tiporg<>'',t1.katorg.tiporg+' ','')+t1.katorg.name
 SUBSTR(t1.oborot.scheto,2,2)
 t1.oborot.subossch
 SUBSTR(t1.oborot.schetk,2,2)
 t1.oborot.subschk
 t1.oborot.datob
 t1.oborot.sumob
.endfields
.{table 't1'
.[h
                             Отчет о наличии записей в книге покупок c @@@@@@@@@@ по @@@@@@@@@@
                                                                                                                        Лист @np@
┌──────┬───────────────────────┬──────────┬────────────────────────────────────────────┬─────────────┬──────────┬────────────────┐
│  №   │         Номер         │   Дата   │                Контрагент                  │   Оборот    │   Дата   │     Сумма      │
│ п/п  │     счета-фактуры     │получения │                                            ├──────┬──────┤ оборота  │    оборота     │
│      │                       │          │                                            │  ДТ  │  КТ  │          │                │
└──────┴───────────────────────┴──────────┴────────────────────────────────────────────┴──────┴──────┴──────────┴────────────────┘
.]h
.begin
 npp:=npp+1;
end.
 &&&&&& @@@@@@@@@@@@@@@@@@@@@@@ @@@@@@@@@@ @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ @@ @@@ @@ @@@ @@@@@@@@@@ &&&&&&&&&&&&&.&&
.}
.endform Р