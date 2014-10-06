.form 'control_124'
.nameinlist 'Реестр документов без ордеров с привязкой ТХО'
.group 'Контроль соответствия бухгалтерского контура'
.ard
.p 60
.defo portrait
.var
 d1,d2:date;
 npp:integer;
 c1:word;
 c2:comp;
 priz1,priz2:boolean;
.endvar
.create view table2 as
SELECT oborot.*;
.create view t1 as
SELECT tmpgrn.*,katsopr.*,katdoc.*
FROM katsopr(KATSOPR02)
WHERE
((
 1071==tmpgrn.wlist
 AND tmpgrn.l/==katsopr.vidsopr
 AND 0==katdoc.sysnum
 AND tmpgrn.l==katdoc.tidkgal
 AND d1<<=katsopr.dsopr
 AND d2>>=katsopr.dsopr
 AND katsopr.nrec==sklorder.csopr
)) AND NOT IsValidAll(tnsklorder);
.begin
 d1:=dGetTune('DAT_M_OT');
 d2:=DATE(LAST_DAY(d1),MONTH(d1),YEAR(d1));
 IF RunDialog('C_common::GetIntervalDates',d1,d2)<> cmOK control_124.fexit;
end.
.begin
 npp:=0;
 c1:=0;
 priz1:=false;
 priz2:=false;
 t1.delete tmpgrn WHERE ((1071==tmpgrn.wlist));
 t1.tmpgrn.wlist:=1071;
 t1.tmpgrn.l:=101;
 t1.insert CURRENT tmpgrn;
 t1.tmpgrn.l:=106;
 t1.insert CURRENT tmpgrn;
 t1.tmpgrn.l:=201;
 t1.insert CURRENT tmpgrn;
 t1.tmpgrn.l:=204;
 t1.insert CURRENT tmpgrn;
 t1.tmpgrn.l:=206;
 t1.insert CURRENT tmpgrn;
 t1.tmpgrn.l:=501;
 t1.insert CURRENT tmpgrn;
 t1.tmpgrn.l:=502;
 t1.insert CURRENT tmpgrn;
 t1.tmpgrn.l:=503;
 t1.insert CURRENT tmpgrn;
 t1.tmpgrn.l:=504;
 t1.insert CURRENT tmpgrn;
 t1.tmpgrn.l:=506;
 t1.insert CURRENT tmpgrn;
 t1.tmpgrn.l:=600;
 t1.insert CURRENT tmpgrn;
 t1.tmpgrn.l:=611;
 t1.insert CURRENT tmpgrn;
 t1.tmpgrn.l:=612;
 t1.insert CURRENT tmpgrn;
 t1.tmpgrn.l:=630;
 t1.insert CURRENT tmpgrn;
end.
.fields
 commonformheader
 d1
 d2
 t1.katdoc.name
 npp
 t1.katsopr.dsopr
 t1.katsopr.nsopr
 t1.katsopr.descr
 t1.katsopr.summa
.endfields
^
.{table 't1'
.[h
             Реестр документов без ордеров с привязкой ТХО
                    с @@@@@@@@@@ по @@@@@@@@@@
                                                            Лист @np@
   ┌────┬──────────┬───────────────┬────────────────┬────────────────┐
   │  № │   Дата   │     Номер     │   Дескриптор   │     Сумма      │
   │ п/п│ документа│   документа   │                │  по документу  │
   └────┴──────────┴───────────────┴────────────────┴────────────────┘
.]h
.begin
 IF NOT priz2 priz2:=IF(t1.katsopr.vidsopr<>c1,true,false);
 c1:=t1.katsopr.vidsopr;
 c2:=t1.katsopr.nrec;
 IF table2.getfirst oborot WHERE ((c1==oborot.tidk AND c2==oborot.csoprdoc))<>tsOK priz1:=false;
 ELSE priz1:=true;
end.
.{?internal;priz1;
.begin
 npp:=npp+1;
end.
.{?internal;priz2;
.begin
 priz2:=false;
end.
 Б    @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ Б
.}
    &&&& @@@@@@@@@@ @@@@@@@@@@@@@@@ @@@@@@@@@@@@@@@@ &&&&&&&&&&&&&.&&
.}
.}
.begin
 t1.delete tmpgrn WHERE ((1071==tmpgrn.wlist));
end.
.endform