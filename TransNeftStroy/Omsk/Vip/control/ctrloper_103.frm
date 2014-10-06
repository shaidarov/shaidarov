 Р.form 'ctrloper_103'
.nameinlist 'Список документов с некорректным номером'
.group 'Контроль соответствия оперативного контура'
.ard
.p 60
.defo portrait
.var
 npp:integer;
 d1,d2:date;
 vid1:word;
 priz:boolean;
 s1,s2,s3,s4,s5,s6:string;
.endvar
.begin
 d1:=DGETTUNE('dat_m_ot');
 d2:=DATE(LAST_DAY(d1),MONTH(d1),YEAR(d1));
 IF RunDialog('C_common::GetIntervalDates',d1,d2)=cmCancel ctrloper_103.fexit;
end.
.create view t1
AS SELECT katsopr.*,x$users.*
WHERE
((
 vid1==katsopr.vidsopr
 AND d1<<=katsopr.dsopr
 AND d2>>=katsopr.dsopr
 AND 1==x$users.xu$useroffice
 AND katsopr.descr==x$users.xu$loginname
));
.fields
 commonformheader
 d1
 d2
 npp
 t1.katsopr.descr
 t1.x$users.xu$fullname
 t1.katsopr.dsopr
 t1.katsopr.nsopr:'T:-'
 'true':'s'
 d1
 d2
 npp
 t1.katsopr.descr
 t1.x$users.xu$fullname
 t1.katsopr.dsopr
 t1.katsopr.nsopr:'T:-'
 'true':'s'
 d1
 d2
 npp
 t1.katsopr.descr
 t1.x$users.xu$fullname
 t1.katsopr.dsopr
 t1.katsopr.nsopr:'T:-'
.endfields
.begin
 vid1:=600;
 npp:=0;
end.
^
.{table 't1'
.[h
                           Список накладных на внутреннее перемещение с некорректным номером
                                         с @@@@@@@@@@ г. по @@@@@@@@@@ г.
                                                                                                                Лист @np@
┌─────┬─────────────┬───────────────────────────────────────────────────────┬──────────┬───────────────────────────────────────┐
│Номер│ Дескриптор  │                 Ф.И.О. пользователя                   │   Дата   │                Номер накладной        │
│ п/п │пользователя │                                                       │накладной │                                       │
└─────┴─────────────┴───────────────────────────────────────────────────────┴──────────┴───────────────────────────────────────┘
.]h
.begin
 s1:=SUBSTR(t1.katsopr.nsopr,1,1);
 s2:=SUBSTR(t1.katsopr.nsopr,2,1);
 s3:=SUBSTR(t1.katsopr.nsopr,3,1);
 s4:=SUBSTR(t1.katsopr.nsopr,4,1);
 s5:=SUBSTR(t1.katsopr.nsopr,5,1);
 s6:=SUBSTR(t1.katsopr.nsopr,6,1);
 priz:=IF(LENGTH(t1.katsopr.nsopr)<>6,true,IF(s1>='0' AND s1<='9'
 AND s2>='0' AND s2<='9' AND s3>='0' AND s3<='9' AND s4>='0' AND s4<='9'
 AND s5>='0' AND s5<='9' AND s6>='0' AND s6<='9',false,true));
end.
.{?internal;priz;
.begin
 npp:=npp+1;
end.
 &&&&& @@@@@@@@@@@@@ @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ @@@@@@@@@@ @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
.}
.}
^
.begin
 vid1:=501;
 npp:=0;
end.
.{table 't1'
.[h
                           Список накладных на передачу в производство с некорректным номером
                                         с @@@@@@@@@@ г. по @@@@@@@@@@ г.
                                                                                                                Лист @np@
┌─────┬─────────────┬───────────────────────────────────────────────────────┬──────────┬───────────────────────────────────────┐
│Номер│ Дескриптор  │                 Ф.И.О. пользователя                   │   Дата   │                Номер накладной        │
│ п/п │пользователя │                                                       │накладной │                                       │
└─────┴─────────────┴───────────────────────────────────────────────────────┴──────────┴───────────────────────────────────────┘
.]h
.begin
 s1:=SUBSTR(t1.katsopr.nsopr,1,1);
 s2:=SUBSTR(t1.katsopr.nsopr,2,1);
 s3:=SUBSTR(t1.katsopr.nsopr,3,1);
 s4:=SUBSTR(t1.katsopr.nsopr,4,1);
 s5:=SUBSTR(t1.katsopr.nsopr,5,1);
 s6:=SUBSTR(t1.katsopr.nsopr,6,1);
 priz:=IF(LENGTH(t1.katsopr.nsopr)<>6,true,IF(s1>='0' AND s1<='9'
 AND s2>='0' AND s2<='9' AND s3>='0' AND s3<='9' AND s4>='0' AND s4<='9'
 AND s5>='0' AND s5<='9' AND s6>='0' AND s6<='9',false,true));
end.
.{?internal;priz;
.begin
 npp:=npp+1;
end.
 &&&&& @@@@@@@@@@@@@ @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ @@@@@@@@@@ @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
.}
.}
^
.begin
 vid1:=504;
 npp:=0;
end.
.{table 't1'
.[h
                           Список актов на списание из производства с некорректным номером
                                         с @@@@@@@@@@ г. по @@@@@@@@@@ г.
                                                                                                                Лист @np@
┌─────┬─────────────┬───────────────────────────────────────────────────────┬──────────┬───────────────────────────────────────┐
│Номер│ Дескриптор  │                 Ф.И.О. пользователя                   │   Дата   │                Номер накладной        │
│ п/п │пользователя │                                                       │накладной │                                       │
└─────┴─────────────┴───────────────────────────────────────────────────────┴──────────┴───────────────────────────────────────┘
.]h
.begin
 s1:=SUBSTR(t1.katsopr.nsopr,1,1);
 s2:=SUBSTR(t1.katsopr.nsopr,2,1);
 s3:=SUBSTR(t1.katsopr.nsopr,3,1);
 s4:=SUBSTR(t1.katsopr.nsopr,4,1);
 s5:=SUBSTR(t1.katsopr.nsopr,5,1);
 s6:=SUBSTR(t1.katsopr.nsopr,6,1);
 priz:=IF(LENGTH(t1.katsopr.nsopr)<>6,true,IF(s1>='0' AND s1<='9'
 AND s2>='0' AND s2<='9' AND s3>='0' AND s3<='9' AND s4>='0' AND s4<='9'
 AND s5>='0' AND s5<='9' AND s6>='0' AND s6<='9',false,true));
end.
.{?internal;priz;
.begin
 npp:=npp+1;
end.
 &&&&& @@@@@@@@@@@@@ @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ @@@@@@@@@@ @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
.}
.}
.endform Р