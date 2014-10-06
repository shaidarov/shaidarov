.form 'control_121'
.nameinlist '¥¥áâà ¯à®¢®¤®ª á ­ã«¥¢ë¬ ª®«¨ç¥áâ¢®¬'
.group 'Š®­âà®«ì á®®â¢¥âáâ¢¨ï ¡ãå£ «â¥àáª®£® ª®­âãà '
.ard
.p 60
.defo portrait
.var
 d1,d2:date;
 b1:byte;
 npp,npp1:integer;
.endvar
.create view t1 as
Select if(scheto='010' or scheto='041' or scheto='0012' or scheto='0002',mcd.name,mck.name)(FieldName=name),subossch,
oborot.descr,oborot.datob,IF(oborot.tidk=9 or oborot.tidk=10,plpor.nodok,IF(oborot.tidk=150 or oborot.tidk=250,sklorder.norder,katsopr.nsopr))(FieldName=nsopr),
IF(oborot.tidk=9 or oborot.tidk=10,plpor.datvip,IF(oborot.tidk=150 or oborot.tidk=250,sklorder.dord,katsopr.dsopr))(FieldName=dsopr),
IF(ruchauto=0,'ãç­ ï',(IF (ruchauto=1,'€¢â®¬ â¨ç¥áª ï',(IF (ruchauto=3,'‘¢¥à­ãâ.','€¢â®¬ â. ª®àà¥ªâ¨à.')))))(Fieldname=ruchauto),
IF(scheto='010' or scheto='041' or scheto='0012' or scheto='0002',oborot.scheto,oborot.schetk)(FieldName=schet)
from oborot,katsopr,katmc mcd, katmc mck
where ((
oborot.csoprdoc==katsopr.nrec
AND oborot.kauos[1]==mcd.nrec
AND oborot.kauks[1]==mck.nrec
AND oborot.csoprdoc==plpor.nrec
AND oborot.csoprdoc==sklorder.nrec
))
and kol=0
and (scheto='010'
or schetk='010'
or scheto='0002'
or schetk='0002'
or scheto='0012'
or schetk='0012'
or scheto='041'
or schetk='041')
and datob>=d1
and datob<=d2
ORDER ord1 BY oborot.tidk;
.create view table3 as
select tmpgrn.*,katdoc.name,x$users.xu$loginname from tmpgrn
WHERE
((
1061==tmpgrn.wlist
AND 0==katdoc.sysnum
AND tmpgrn.crecs[1]==x$users.atl_nrec
AND integer(tmpgrn.s)==katdoc.tidkgal))
order by wlist,crec1,crec2,crec3,crec4,crec5,l,d,sum,s;
.begin
 table3.delete all  tmpgrn where (( 1061== tmpgrn.wlist ));
 d1:=DGetTune('dat_m_ot');
 d2:=DATE(LAST_DAY(d1),MONTH(d1),YEAR(d1));
 npp:=0;
 npp1:=0;
 IF RunDialog('C_common::GetIntervalDates',d1,d2)=cmCancel control_121.fexit;
 end.
.{table 't1'
.begin
   table3.tmpgrn.wlist:=1061;
   table3.tmpgrn.s:=string(t1.oborot.tidk);
   table3.tmpgrn.ds[3]:=t1.oborot.datob;
   table3.tmpgrn.sum:=integer(t1.oborot.subossch);
   table3.tmpgrn.ss[1]:=t1.name;
   table3.tmpgrn.ss[4]:=t1.oborot.descr;
   table3.tmpgrn.ss[3]:=t1.nsopr;
   table3.tmpgrn.ds[2]:=t1.dsopr;   table3.tmpgrn.crecs[1]:=t1.oborot.atl_lastuser;
   table3.tmpgrn.ss[2]:=t1.ruchauto;
   //table3.tmpgrn.ss[5]:=t1.oborot.subossch;
   table3.tmpgrn.l:=integer(t1.schet);
   table3.insert current tmpgrn;
end.
.}
.fields
 commonformheader
 d1
 d2
 table3.tmpgrn.l
 table3.tmpgrn.sum
 table3.katdoc.name
 npp
 tmpgrn.ds[3]
 table3.x$users.xu$loginname
 table3.tmpgrn.ss[4]
 table3.tmpgrn.ds[2]
 table3.tmpgrn.ss[3]
 table3.tmpgrn.ss[1]
 table3.tmpgrn.ss[2]
.endfields
.begin
 table3.getfirst tmpgrn WHERE((1061==tmpgrn.wlist));
end.
^
ÿ˜                 ÿˆ                        ÿˆ             ¥¥áâà ¯à®¢®¤®ª á ­ã«¥¢ë¬ ª®«¨ç¥áâ¢®¬
                                                            c @@@@@@@@@@ ¯® @@@@@@@@@@
.{table 'Table3' BY tmpgrn.l
.[h
                                                                                                                                  ‹¨áâ @np@
ÚÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
³   N   ³   „ â    ³®«ì§®¢ â¥«ì³„¥áªà¨¯â®à³  „ â     ³   ®¬¥à    ³                           ¨¬¥­®¢ ­¨¥ Œ–                        ³    ’¨¯ ¯à®¢®¤ª¨    ³
³  ¯/¯  ³ ¯à®¢®¤ª¨ ³ ¨§¬¥­¨¢è¨© ³ª ­®¬¥àã  ³¤®ªã¬¥­â  ³ ¤®ªã¬¥­â   ³                                                                 ³                    ³
³       ³          ³ ¯à®¢®¤ªã   ³¤®ªã¬¥­â  ³          ³            ³                                                                 ³                    ³
ÀÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
ÿ.]h
‘ç¥â @@@@@
.{BY tmpgrn.sum
     ‘ã¡áç¥â @@@
.{BY tmpgrn.s
               @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ÿ
.{BY tmpgrn.crec
.begin
 npp:=npp+1;
end.
  &&&&&  @@@@@@@@@@   @@@@@@@@@  @@@@@@@@@  @@@@@@@@@@  @@@@@@@@@@  @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ @@@@@@@@@@@@@@@@@@@@ÿˆ
.}
.}
.}
.}
.endformÿ