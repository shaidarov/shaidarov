 Р.form ctrloper_104
.nameinlist 'Список накладных на внутреннее перемещение без привязки к объекту строительства'
.group 'Контроль соответствия оперативного контура'
.ard
.p 60
.defo portrait
.var
 npp:integer;
 d1,d2:date;
 priz:boolean;
 nom1,desc1,fio1:string;
 dat1:date;
.endvar
.begin
 d1:=DGETTUNE('dat_m_ot');
 d2:=DATE(LAST_DAY(d1),MONTH(d1),YEAR(d1));
 IF RunDialog('C_Common::GetInterval',d1,d2)=cmCancel ctrloper_104.fexit;
end.
.create view t1 AS
SELECT katsopr.*,spsopr.*,x$users.*
WHERE
((
 600==katsopr.vidsopr
 AND d1<<=katsopr.dsopr
 AND d2>>=katsopr.dsopr
 AND katsopr.nrec==spsopr.csopr
 AND 1==x$users.xu$useroffice
 AND katsopr.descr==x$users.xu$loginname
));
.fields
 commonformheader
 d1
 d2
 npp
 dat1
 nom1
 desc1
 fio1
.endfields
.begin
 npp:=0;
end.
^
.{table 't1.Katsopr'
.[h
                           Список накладных на внутреннее перемещение без привязки к объекту строительства
                                               с @@@@@@@@@@ г. по @@@@@@@@@@ г.
                                                                                                                Лист @np@
┌─────┬──────────┬───────────────────────────────────────┬─────────────┬───────────────────────────────────────────────────────┐
│Номер│   Дата   │            Номер накладной            │ Дескриптор  │                 Ф.И.О. пользователя                   │
│ п/п │накладной │                                       │пользователя │                                                       │
└─────┴──────────┴───────────────────────────────────────┴─────────────┴───────────────────────────────────────────────────────┘
.]h
.begin
 nom1:=t1.katsopr.nsopr;
 desc1:=t1.katsopr.descr;
 dat1:=t1.katsopr.dsopr;
 fio1:=t1.x$users.xu$fullname;
 priz:=false;
end.
.{table 't1.Spsopr'
.begin
 IF t1.spsopr.cuks=COMP(0) priz:=true;
end.
.}
.{?internal;priz;
.begin
 npp:=npp+1;
end.
 &&&&& @@@@@@@@@@ @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ @@@@@@@@@@@@@ @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
.}
.}
.endform Р