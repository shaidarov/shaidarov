ÿ˜.form 'ctrlbuh_103'
.nameinlist 'Š®­âà®«ì ¯à¨¢ï§ª¨ ’• ª ¤®ªã¬¥­â ¬'
.group 'Š®­âà®«ì á®®â¢¥âáâ¢¨ï ¡ãå£ «â¥àáª®£® ª®­âãà '
.ard
.defo landscape
.p 50
.var
 c1:comp;
 w1:word;
 d1,d2:date;
 doc1,nom1,usr1,usr2:string;
 dat1,dat2,dat3:date;
 old1,new1:comp;
 hoz1:comp;
.endvar
.create view table3 AS
SELECT tmpgrn.*
WHERE
((
 1971==wlist
));
.create view table2 AS
SELECT magoper.*,x$users.*,x$journal.*
WHERE
((
 w1==magoper.tipdoc
 AND c1==magoper.csoprdoc
 AND ÿ˜0001000000000038hÿ˜==magoper.cplanssch
 AND 1163==x$journal.tablecode
 AND magoper.nrec==x$journal.tablenrec
 AND x$journal.usercode==x$users.atl_nrec
))
AND x$journal.operation=1;
.create view t1 AS
SELECT katdoc.*,katsopr.*,x$users.*,x$journal.*
WHERE
((
 katsopr.vidsopr==katdoc.tidkgal
 AND 1109==x$journal.tablecode
 AND katsopr.nrec==x$journal.tablenrec
 AND x$journal.usercode==x$users.atl_nrec
))
AND x$journal.operation=0
AND (katsopr.vidsopr=101 OR katsopr.vidsopr=111 OR katsopr.vidsopr=201 OR katsopr.vidsopr=211 OR
     katsopr.vidsopr=502 OR katsopr.vidsopr=503 OR katsopr.vidsopr=504 OR katsopr.vidsopr=600 OR
     katsopr.vidsopr=611 OR katsopr.vidsopr=612 OR katsopr.vidsopr=630)
AND katsopr.dsopr>=d1 AND katsopr.dsopr<=d2;
.begin
 d1:=DGetTune('Dat_M_Ot');
 d2:=DATE(LAST_DAY(d1),MONTH(d1),YEAR(d1));
 IF RunDialog('C_common::GetIntervalDates',d1,d2)<> cmOK ctrlbuh_103.fexit;
end.
.begin
 table3.delete tmpgrn WHERE ((1971==wlist));
end.
.{table 't1'
.begin
 w1:=t1.katsopr.vidsopr;
 c1:=t1.katsopr.nrec;
 doc1:=t1.katdoc.name;
 nom1:=t1.katsopr.nsopr;
 usr1:=t1.x$users.xu$fullname;
 usr2:='';
 dat1:=t1.katsopr.dsopr;
 dat2:=t1.x$journal.lastdate;
 dat3:=DATE(0,0,0);
 hoz1:=COMP(0);
 old1:=COMP(0);
 new1:=COMP(0);
end.
.{table 'Table2.Magoper'
.begin
 hoz1:=table2.magoper.chozoper;
end.
.{table 'Table2.x$journal'
.{?internal;dat3=DATE(0,0,0);
.begin
  GetOldFieldValueFromJournal(table2.magoper.chozoper,150,table2.x$journal.datarec,table2.x$journal.operation,old1);
  GetNewFieldValueFromJournal(table2.magoper.chozoper,150,table2.x$journal.datarec,table2.x$journal.operation,new1);
  IF old1<>new1
  {
   usr2:=table2.x$users.xu$fullname;
   dat3:=table2.x$journal.lastdate;
  }
end.
.}
.}
.}
.begin
 table3.tmpgrn.wlist:=1971;
 table3.tmpgrn.crec1:=COMP(w1);
 table3.tmpgrn.ss[1]:=doc1;
 table3.tmpgrn.s:=nom1;
 table3.tmpgrn.d:=dat1;
 table3.tmpgrn.ss[2]:=usr1;
 table3.tmpgrn.ds[1]:=dat2;
 table3.tmpgrn.ss[3]:=usr2;
 table3.tmpgrn.ds[2]:=dat3;
 table3.insert CURRENT tmpgrn;
end.
.}
.create view table4 AS
SELECT katdoc.*,plpor.*,x$users.*,x$journal.*
WHERE
((
 plpor.tidkgal==katdoc.tidkgal
 AND 9015==x$journal.tablecode
 AND plpor.nrec==x$journal.tablenrec
 AND x$journal.usercode==x$users.atl_nrec
))
AND x$journal.operation=0
AND plpor.tidkgal=10
AND plpor.datvip>=d1 AND plpor.datvip<=d2;
.{table 'Table4'
.begin
 w1:=table4.plpor.tidkgal;
 c1:=table4.plpor.nrec;
 doc1:=table4.katdoc.name;
 nom1:=table4.plpor.nodok;
 usr1:=table4.x$users.xu$fullname;
 usr2:='';
 dat1:=table4.plpor.datvip;
 dat2:=table4.x$journal.lastdate;
 dat3:=DATE(0,0,0);
 hoz1:=COMP(0);
 old1:=COMP(0);
 new1:=COMP(0);
end.
.{table 'Table2.Magoper'
.begin
 hoz1:=table2.magoper.chozoper;
end.
.{table 'Table2.x$journal'
.{?internal;dat3=DATE(0,0,0);
.begin
  GetOldFieldValueFromJournal(table2.magoper.chozoper,150,table2.x$journal.datarec,table2.x$journal.operation,old1);
  GetNewFieldValueFromJournal(table2.magoper.chozoper,150,table2.x$journal.datarec,table2.x$journal.operation,new1);
  IF old1<>new1
  {
   usr2:=table2.x$users.xu$fullname;
   dat3:=table2.x$journal.lastdate;
  }
end.
.}
.}
.}
.begin
 table3.tmpgrn.wlist:=1971;
 table3.tmpgrn.crec1:=COMP(w1);
 table3.tmpgrn.ss[1]:=doc1;
 table3.tmpgrn.s:=nom1;
 table3.tmpgrn.d:=dat1;
 table3.tmpgrn.ss[2]:=usr1;
 table3.tmpgrn.ds[1]:=dat2;
 table3.tmpgrn.ss[3]:=usr2;
 table3.tmpgrn.ds[2]:=dat3;
 table3.insert CURRENT tmpgrn;
end.
.}
.create view table5 AS
SELECT sklorder.*,x$users.*,x$journal.*
WHERE
((
 0==sklorder.sp
 AND 0==sklorder.vidorder
 AND 4==sklorder.tipord
 AND d1<<=sklorder.dord
 AND d2>>=sklorder.dord
 AND 1111==x$journal.tablecode
 AND sklorder.nrec==x$journal.tablenrec
 AND x$journal.usercode==x$users.atl_nrec
))
AND x$journal.operation=0;
.{table 'Table5'
.begin
 w1:=150;
 c1:=table5.sklorder.nrec;
 doc1:='à¨å®¤­ë© áª« ¤áª®© ®à¤¥à';
 nom1:=table5.sklorder.norder;
 usr1:=table5.x$users.xu$fullname;
 usr2:='';
 dat1:=table5.sklorder.dord;
 dat2:=table5.x$journal.lastdate;
 dat3:=DATE(0,0,0);
 hoz1:=COMP(0);
 old1:=COMP(0);
 new1:=COMP(0);
end.
.{table 'Table2.Magoper'
.begin
 hoz1:=table2.magoper.chozoper;
end.
.{table 'Table2.x$journal'
.{?internal;dat3=DATE(0,0,0);
.begin
  GetOldFieldValueFromJournal(table2.magoper.chozoper,150,table2.x$journal.datarec,table2.x$journal.operation,old1);
  GetNewFieldValueFromJournal(table2.magoper.chozoper,150,table2.x$journal.datarec,table2.x$journal.operation,new1);
  IF old1<>new1
  {
   usr2:=table2.x$users.xu$fullname;
   dat3:=table2.x$journal.lastdate;
  }
end.
.}
.}
.}
.begin
 table3.tmpgrn.wlist:=1971;
 table3.tmpgrn.crec1:=COMP(w1);
 table3.tmpgrn.ss[1]:=doc1;
 table3.tmpgrn.s:=nom1;
 table3.tmpgrn.d:=dat1;
 table3.tmpgrn.ss[2]:=usr1;
 table3.tmpgrn.ds[1]:=dat2;
 table3.tmpgrn.ss[3]:=usr2;
 table3.tmpgrn.ds[2]:=dat3;
 table3.insert CURRENT tmpgrn;
end.
.}
.fields
 commonformheader
 d1
 d2
 table3.tmpgrn.ss[1]
 table3.tmpgrn.s
 table3.tmpgrn.d
 table3.tmpgrn.ss[2]
 table3.tmpgrn.ds[1]
 table3.tmpgrn.ss[3]
 IF(table3.tmpgrn.ds[2]=DATE(0,0,0),'',table3.tmpgrn.ds[2])
 CalcDaysBetweenDates(table3.tmpgrn.ds[1],IF(table3.tmpgrn.ds[2]=DATE(0,0,0),CUR_DATE(),table3.tmpgrn.ds[2]),false)-1
.endfields
^
.{table 'Table3'
.[h
                                                                          Š®­âà®«ì ¯à¨¢ï§ª¨ ’• ª ¤®ªã¬¥­â ¬ á @@@@@@@@@@ £. ¯® @@@@@@@@@@ £.
                                                                                                                                                                                                             ‹¨áâ @np@
ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄ¿
³                                                           ³                           ³   „ â    ³                                        ³   „ â    ³                                         ³   „ â    ³  §­¨æ  ³
³                   ¨¬¥­®¢ ­¨¥ ¤®ªã¬¥­â                    ³      ®¬¥à ¤®ªã¬¥­â       ³ ¤®ªã¬¥­â ³ ”.ˆ.. ¯®«ì§®¢ â¥«ï ¢­¥áè¥£® ¤®ªã¬¥­â  ³   ¢¢®¤   ³   ”.ˆ.. ¯®«ì§®¢ â¥«ï ¯à¨¢ï§ ¢è¥£® ’•  ³ ¯à¨¢ï§ª¨ ³ ¢ ¤­ïå  ³
³                                                           ³                           ³          ³                                        ³ ¤®ªã¬¥­â ³                                         ³   ’•    ³         ³
ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÙ
.]h
 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ @@@@@@@@@@@@@@@@@@@@@@@@@@@ @@@@@@@@@@ @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ @@@@@@@@@@ @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ @@@@@@@@@@ &&&&&&&&&
.}
.begin
 table3.delete tmpgrn WHERE ((1971==wlist));
end.
.endformÿ˜