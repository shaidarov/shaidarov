.form 'control_126'
.nameinlist 'ê••·‚‡ ≠†™´†§≠ÎÂ ® †™‚Æ¢ · Á®·´Æ¨ ß≠†™Æ¢ ØÆ·´• ß†ØÔ‚Æ© °Æ´•• 4 ¢ ™Æ´®Á•·‚¢•'
.group 'äÆ≠‚‡Æ´Ï ·ÆÆ‚¢•‚·‚¢®Ô ÆØ•‡†‚®¢≠Æ£Æ ™Æ≠‚„‡†'
.ard
.p 60
.defo portrait
.var
 d1,d2:date;
 b1:byte;
 npp:integer;
 uf:boolean;
 s1:string;
.endvar
.create view t1 as
SELECT katsopr.*,spsopr.*,katmc.name,katdoc.name,grdescr.name
FROM katmc, katdoc, grdescr
WHERE
((spsopr.csopr==katsopr.nrec
AND 101==spsopr.vidsopr
AND spsopr.cmcusl==katmc.nrec
AND d1<<=spsopr.dsopr
AND d2>>=spsopr.dsopr
AND 0==katdoc.sysnum
AND katsopr.vidsopr==katdoc.tidkgal
AND katsopr.desgr==grdescr.desgr
))
AND spsopr.prmc=1;
.create view table4 as
SELECT katsopr.*,spsopr.*,katmc.name,katdoc.name,grdescr.name
FROM katmc, katdoc, grdescr
WHERE
((spsopr.csopr==katsopr.nrec
AND 201==spsopr.vidsopr
AND spsopr.cmcusl==katmc.nrec
AND d1<<=spsopr.dsopr
AND d2>>=spsopr.dsopr
AND 0==katdoc.sysnum
AND katsopr.vidsopr==katdoc.tidkgal
AND katsopr.desgr==grdescr.desgr
))
AND spsopr.prmc=1;
.CREATE VIEW table5 AS
SELECT katsopr.*,spsopr.*,katmc.name,katdoc.name,grdescr.name
FROM katmc, katdoc, grdescr
WHERE
((spsopr.csopr==katsopr.nrec
AND 111==spsopr.vidsopr
AND spsopr.cmcusl==katmc.nrec
AND d1<<=spsopr.dsopr
AND d2>>=spsopr.dsopr
AND 0==katdoc.sysnum
AND katsopr.vidsopr==katdoc.tidkgal
AND katsopr.desgr==grdescr.desgr
))
AND spsopr.prmc=1;
.CREATE VIEW table6 AS
SELECT katsopr.*,spsopr.*,katmc.name,katdoc.name,grdescr.name
FROM katmc, katdoc, grdescr
WHERE
((spsopr.csopr==katsopr.nrec
AND 600==spsopr.vidsopr
AND spsopr.cmcusl==katmc.nrec
AND d1<<=spsopr.dsopr
AND d2>>=spsopr.dsopr
AND 0==katdoc.sysnum
AND katsopr.vidsopr==katdoc.tidkgal
AND katsopr.desgr==grdescr.desgr
))
AND spsopr.prmc=1;
.CREATE VIEW table7 AS
SELECT katsopr.*,spsopr.*,katmc.name,katdoc.name,grdescr.name
FROM katmc,katdoc, grdescr
WHERE
((spsopr.csopr==katsopr.nrec
AND 501==spsopr.vidsopr
AND spsopr.cmcusl==katmc.nrec
AND d1<<=spsopr.dsopr
AND d2>>=spsopr.dsopr
AND 0==katdoc.sysnum
AND katsopr.vidsopr==katdoc.tidkgal
AND katsopr.desgr==grdescr.desgr
))
AND spsopr.prmc=1;
.CREATE VIEW table8 AS
SELECT katsopr.*,spsopr.*,katmc.name,katdoc.name,grdescr.name
FROM katmc, katdoc, grdescr
WHERE
((spsopr.csopr==katsopr.nrec
AND 204==spsopr.vidsopr
AND spsopr.cmcusl==katmc.nrec
AND d1<<=spsopr.dsopr
AND d2>>=spsopr.dsopr
AND 0==katdoc.sysnum
AND katsopr.vidsopr==katdoc.tidkgal
AND katsopr.desgr==grdescr.desgr
))
AND spsopr.prmc=1;
.CREATE VIEW table9 AS
SELECT katsopr.*,spsopr.*,katmc.name,katdoc.name,grdescr.name
FROM katmc, katdoc, grdescr
WHERE
((spsopr.csopr==katsopr.nrec
AND 203==spsopr.vidsopr
AND spsopr.cmcusl==katmc.nrec
AND d1<<=spsopr.dsopr
AND d2>>=spsopr.dsopr
AND 0==katdoc.sysnum
AND katsopr.vidsopr==katdoc.tidkgal
AND katsopr.desgr==grdescr.desgr
))
AND spsopr.prmc=1;
.CREATE VIEW t10 AS
SELECT katsopr.*,spsopr.*,katmc.name,katdoc.name,grdescr.name
FROM katmc, katdoc, grdescr
WHERE
((spsopr.csopr==katsopr.nrec
AND 206==spsopr.vidsopr
AND spsopr.cmcusl==katmc.nrec
AND d1<<=spsopr.dsopr
AND d2>>=spsopr.dsopr
AND 0==katdoc.sysnum
AND katsopr.vidsopr==katdoc.tidkgal
AND katsopr.desgr==grdescr.desgr
))
AND spsopr.prmc=1;
.CREATE VIEW table3 AS
SELECT tmpgrn.* where (wlist=1062 OR wlist=1063 OR wlist=1064 OR wlist=1065 OR wlist=1066 OR wlist=1067 OR wlist=1068 OR wlist=1069)
ORDER BY wlist,crec1,crec2,crec3,crec4,crec5,l;
.begin
 d1:=DGETTUNE('dat_m_ot');
 d2:=DATE(LAST_DAY(d1),MONTH(d1),YEAR(d1));
 IF RunDialog('C_common::GetIntervalDates',d1,d2)=cmCancel control_126.fexit;
 npp:=0;
 s1:='';
 table3.delete all tmpgrn where ((1062==wlist));
 table3.delete all tmpgrn where ((1063==wlist));
 table3.delete all tmpgrn where ((1064==wlist));
 table3.delete all tmpgrn where ((1065==wlist));
 table3.delete all tmpgrn where ((1066==wlist));
 table3.delete all tmpgrn where ((1067==wlist));
 table3.delete all tmpgrn where ((1068==wlist));
 table3.delete all tmpgrn where ((1069==wlist));
end.
.{TABLE 't1'
.begin
        table3.tmpgrn.wlist:=1062;
        table3.tmpgrn.ds[1]:=t1.katsopr.dsopr;
        table3.tmpgrn.ss[2]:=t1.katsopr.nsopr;
        table3.tmpgrn.ss[1]:=t1.katmc.name;
        table3.tmpgrn.ss[3]:=t1.grdescr.name;
        table3.tmpgrn.sums[1]:=t1.spsopr.kolfact;
        table3.tmpgrn.s:=t1.katdoc.name;
        table3.insert current tmpgrn;
end.
.}
.{TABLE 'Table4'
.begin
        table3.tmpgrn.wlist:=1063;
        table3.tmpgrn.ds[1]:=table4.katsopr.dsopr;
        table3.tmpgrn.ss[2]:=table4.katsopr.nsopr;
        table3.tmpgrn.ss[1]:=table4.katmc.name;
        table3.tmpgrn.ss[3]:=table4.grdescr.name;
        table3.tmpgrn.sums[1]:=table4.spsopr.kolfact;
        table3.tmpgrn.s:=table4.katdoc.name;
        table3.insert current tmpgrn;
end.
.}
.{TABLE 'Table5'
.begin
        table3.tmpgrn.wlist:=1064;
        table3.tmpgrn.ds[1]:=table5.katsopr.dsopr;
        table3.tmpgrn.ss[2]:=table5.katsopr.nsopr;
        table3.tmpgrn.ss[1]:=table5.katmc.name;
        table3.tmpgrn.ss[3]:=table5.grdescr.name;
        table3.tmpgrn.sums[1]:=table5.spsopr.kolfact;
        table3.tmpgrn.s:=table5.katdoc.name;
        table3.insert current tmpgrn;
end.
.}
.{TABLE 'Table6'
.begin
        table3.tmpgrn.wlist:=1065;
        table3.tmpgrn.ds[1]:=table6.katsopr.dsopr;
        table3.tmpgrn.ss[2]:=table6.katsopr.nsopr;
        table3.tmpgrn.ss[1]:=table6.katmc.name;
        table3.tmpgrn.ss[3]:=table6.grdescr.name;
        table3.tmpgrn.sums[1]:=table6.spsopr.kolfact;
        table3.tmpgrn.s:=table6.katdoc.name;
        table3.insert current tmpgrn;
end.
.}
.{TABLE 'Table7'
.begin
        table3.tmpgrn.wlist:=1066;
        table3.tmpgrn.ds[1]:=table7.katsopr.dsopr;
        table3.tmpgrn.ss[2]:=table7.katsopr.nsopr;
        table3.tmpgrn.ss[1]:=table7.katmc.name;
        table3.tmpgrn.ss[3]:=table7.grdescr.name;
        table3.tmpgrn.sums[1]:=table7.spsopr.kolfact;
        table3.tmpgrn.s:=table7.katdoc.name;
        table3.insert current tmpgrn;
end.
.}
.{TABLE 'Table8'
.begin
        table3.tmpgrn.wlist:=1067;
        table3.tmpgrn.ds[1]:=table8.katsopr.dsopr;
        table3.tmpgrn.ss[2]:=table8.katsopr.nsopr;
        table3.tmpgrn.ss[1]:=table8.katmc.name;
        table3.tmpgrn.ss[3]:=table8.grdescr.name;
        table3.tmpgrn.sums[1]:=table8.spsopr.kolfact;
        table3.tmpgrn.s:=table8.katdoc.name;
        table3.insert current tmpgrn;
end.
.}
.{TABLE 'Table9'
.begin
        table3.tmpgrn.wlist:=1068;
        table3.tmpgrn.ds[1]:=table9.katsopr.dsopr;
        table3.tmpgrn.ss[2]:=table9.katsopr.nsopr;
        table3.tmpgrn.ss[1]:=table9.katmc.name;
        table3.tmpgrn.ss[3]:=table9.grdescr.name;
        table3.tmpgrn.sums[1]:=table9.spsopr.kolfact;
        table3.tmpgrn.s:=table9.katdoc.name;
        table3.insert current tmpgrn;
end.
.}
.{TABLE 't10'
.begin
        table3.tmpgrn.wlist:=1069;
        table3.tmpgrn.ds[1]:=t10.katsopr.dsopr;
        table3.tmpgrn.ss[2]:=t10.katsopr.nsopr;
        table3.tmpgrn.ss[1]:=t10.katmc.name;
        table3.tmpgrn.ss[3]:=t10.grdescr.name;
        table3.tmpgrn.sums[1]:=t10.spsopr.kolfact;
        table3.tmpgrn.s:=t10.katdoc.name;
        table3.insert current tmpgrn;
end.
.}
.fields
 commonformheader
 d1
 d2
 Table3.tmpgrn.s
 npp
 Table3.tmpgrn.ds[1]
 Table3.tmpgrn.ss[2]
 Table3.tmpgrn.ss[3]
 Table3.tmpgrn.ss[1]
 Table3.tmpgrn.sums[1]
.endfields
^
ˇò                                                                  ê••·‚‡ ≠†™´†§≠ÎÂ ® †™‚Æ¢ · Á®·´Æ¨ ß≠†™Æ¢
                                                                    ØÆ·´• ß†ØÔ‚Æ© ¢ ™Æ´®Á•·‚¢• °Æ´•• 4
                                                                         c @@@@@@@@@@ ØÆ @@@@@@@@@@
.{table 'Table3'
.[h
                                                                                                                                  ã®·‚ @np@
                      ⁄ƒƒƒƒƒƒƒ¬ƒƒƒƒƒƒƒƒƒƒƒ¬ƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒ¬ƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒ¬ƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒ¬ƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒø
                      ≥   N   ≥   Ñ†‚†    ≥     çÆ¨•‡     ≥    É‡„ØØ† §•·™‡®Ø‚Æ‡Æ¢   ≥        ç†®¨•≠Æ¢†≠®• åñ               ≥    äÆ´®Á•·‚¢Æ   ≥
                      ≥  Ø/Ø  ≥ §Æ™„¨•≠‚† ≥   §Æ™„¨•≠‚†   ≥                          ≥                                      ≥   ØÆ §Æ™„¨•≠‚„  ≥
                      ¿ƒƒƒƒƒƒƒ¡ƒƒƒƒƒƒƒƒƒƒƒ¡ƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒ¡ƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒ¡ƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒ¡ƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒŸˇò
.]h
.{?internal;round(table3.tmpgrn.sums[1],5)>trunc(table3.tmpgrn.sums[1],4)
.begin
 npp:=npp+1;
end.
.{?internal;s1<>Table3.tmpgrn.s;
    ˇô                    @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ˇô
.begin
        s1:=Table3.tmpgrn.s;
end.
.}
ˇò                        &&&&&   @@@@@@@@@@ @@@@@@@@@@@@@@@ @@@@@@@@@@@@@@@@@@@@@@@@@@ @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ &&&&&&&&&.&&&&ˇò&
.}
.}
.endform