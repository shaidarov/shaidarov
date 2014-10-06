.form 'control_102'
.nameinlist 'Реестр счетов на продажу не привязанных к договорам'
.group 'Контроль соответствия оперативного контура'
.ard
.p 60
.o 5
.[h
      БРеестр счетов на продажу не привязанных к договорам Б
                                                   Лист  @np@
┌──────┬────────┬──────────────────┬──────────┬──────────────┐
│N п/п │ Дескр. │  Номер документа │   Дата   │    Сумма     │
│      │пользов.│                  │ документа│              │
└──────┴────────┴──────────────────┴──────────┴──────────────┘
.]h
.var
 d1,d2:date;
 b1:byte;
 npp:integer;
 prizfst:boolean;
.endvar
.begin
 npp:=0;
 prizfst:=TRUE;
 d1:=DGETTUNE('dat_m_ot');
 d2:=DATE(LAST_DAY(d1),MONTH(d1),YEAR(d1));
 IF RunDialog(control_102,d1,d2,b1)=cmCancel control_102.fexit;
end.
.create view t1 as
SELECT basedoc.descr,basedoc.nodoc,basedoc.ddoc,basedoc.total
FROM basedoc
WHERE
((
201==basedoc.viddoc
AND 0==basedoc.cdogovor
AND d1<<=basedoc.ddoc
AND d2>>=basedoc.ddoc
))
AND basedoc.status<>1
ORDER ord1 BY basedoc.viddoc,basedoc.cdogovor,basedoc.ddoc
ORDER ord2 EXTERNAL BY basedoc.descr,basedoc.ddoc;
.begin
 IF b1=0 SETORDER(tiOrd1);
 ELSE SETORDER(tiOrd2);
end.
.create view t2 as
SELECT basedoc.descr,basedoc.nodoc,basedoc.ddoc,basedoc.total
FROM basedoc
WHERE
((
211==basedoc.viddoc
AND 0==basedoc.cdogovor
AND d1<<=basedoc.ddoc
AND d2>>=basedoc.ddoc
))
AND basedoc.status<>1
ORDER ord1 BY basedoc.viddoc,basedoc.cdogovor,basedoc.ddoc
ORDER ord2 EXTERNAL BY basedoc.descr,basedoc.ddoc;
.begin
 IF b1=0 SETORDER(tiOrd1);
 ELSE SETORDER(tiOrd2);
end.
.fields
'Счета на продажу'
npp
t1.basedoc.descr
t1.basedoc.nodoc
IF(t1.basedoc.ddoc=DATE(0,0,0),'',STRING(t1.basedoc.ddoc))
t1.basedoc.total
'Счета на предоплату продаж'
npp
t2.basedoc.descr
t2.basedoc.nodoc
IF(t2.basedoc.ddoc=DATE(0,0,0),'',STRING(t2.basedoc.ddoc))
t2.basedoc.total
.endfields
.{Table 't1:Main'
.{?internal;prizfst;

 Б^ Б

.}
.begin
 prizfst:=FALSE;
 npp:=npp+1;
end.
 &&&&&& @@@@@@@@ @@@@@@@@@@@@@@@@@@ @@@@@@@@@@ &&&&&&&&&&&.&&
.}
.begin
 npp:=0;
 prizfst:=TRUE;
end.
.{Table 't2:Main'
.{?internal;prizfst;

 Б^ Б

.}
.begin
 prizfst:=FALSE;
 npp:=npp+1;
end.
 &&&&&& @@@@@@@@ @@@@@@@@@@@@@@@@@@ @@@@@@@@@@ &&&&&&&&&&&.&&
.}
.endform