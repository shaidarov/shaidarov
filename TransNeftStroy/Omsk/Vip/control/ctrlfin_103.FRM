.form 'ctrlfin_103'
.nameinlist 'ê••·‚‡ ≠•·ÆÆ‚¢•‚·‚¢®© ™Æ≠‚‡†£•≠‚Æ¢ ¢ §Æ£Æ¢Æ‡†Â ® ·Á•‚†Â'
.group 'äÆ≠‚‡Æ´Ï ·ÆÆ‚¢•‚·‚¢®Ô ‰®≠†≠·Æ¢Æ£Æ ™Æ≠‚„‡†'
.ard
.p 60
.defo portrait
.var
 d1,d2:date;
 b2,b3:byte;
 npp:integer;
 str:string;
.endvar
.create view table1 as
select basedoc.nodoc,basedoc.ddoc,basedoc.descr,basedoc.total,schet.name,
if(dogov.nrec=2,plat.name,dogov.name)(Fieldname=dorg)
from basedoc,dogovor,
katorg schet,katorg dogov,katorg plat where
((
basedoc.cdogovor/==dogovor.nrec
and basedoc.corg==schet.nrec
and dogovor.cpol==dogov.nrec
and dogovor.cplat==plat.nrec
))
and basedoc.corg<>dogovor.cplat
and basedoc.corg<>dogovor.cpol
and basedoc.ddoc>=d1
and basedoc.ddoc<=d2
and (basedoc.viddoc=101
or basedoc.viddoc=111
or basedoc.viddoc=201
or basedoc.viddoc=211)
order ord1 by basedoc.viddoc,basedoc.ddoc
order ord2 by basedoc.viddoc,basedoc.descr;
.begin
 d1:=DGETTUNE('dat_m_ot');
 d2:=DATE(LAST_DAY(d1),MONTH(d1),YEAR(d1));
 IF RunInterface(control_105,d1,d2,b2,b3)=cmCancel ctrlfin_103.fexit;
 IF b3=0 SETORDER(tiOrd1);
 ELSE SETORDER(tiOrd2);
 IF b2=1 d1:=date(1,6,2001);
 npp:=0;
end.
.fields
 commonformheader
 d1
 d2
 if(basedoc.viddoc=101,'ëÁ•‚† ≠† ß†™„Ø™„',if(basedoc.viddoc=111,
 'ëÁ•‚† ≠† Ø‡•§ÆØ´†‚„ ß†™„ØÆ™',if(basedoc.viddoc=201,'ëÁ•‚† ≠† Ø‡Æ§†¶„','·Á•‚† ≠† Ø‡•§ÆØ´†‚„')))
 npp
 table1.basedoc.ddoc
 table1.basedoc.descr
 table1.basedoc.nodoc
 table1.schet.name
 table1.dorg
 table1.basedoc.total
.endfields
^
             ˇÅ        ˇÅê••·‚‡ ≠•·ÆÆ‚¢•‚·‚¢®© ™Æ≠‚‡†£•≠‚Æ¢
                           ¢ §Æ£Æ¢Æ‡†Â ® ·Á•‚†Â
                        c @@@@@@@@@@ ØÆ @@@@@@@@@@
.{table 'Table1' BY basedoc.viddoc
.ˇò[h
                                                                                                                                               ã®·‚ @np@
   ⁄ƒƒƒƒƒƒƒ¬ƒƒƒƒƒƒƒƒƒƒƒ¬ƒƒƒƒƒƒƒƒƒƒ¬ƒƒƒƒƒƒƒƒƒƒƒƒƒƒ¬ƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒ¬ƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒ¬ƒƒƒƒƒƒƒƒƒƒƒƒƒƒø
   ≥   N   ≥   Ñ†‚†    ≥Ñ•·™‡®Ø‚Æ‡≥     çÆ¨•‡    ≥            äÆ≠‚‡†£•≠‚ ØÆ ·Á•‚„               ≥           äÆ≠‚‡†£•≠‚ ØÆ §Æ£Æ¢Æ‡„          ≥    C„¨¨†     ≥
   ≥  Ø/Ø  ≥ §Æ™„¨•≠‚† ≥          ≥   §Æ™„¨•≠‚†  ≥                                              ≥                                           ≥ ØÆ §Æ™„¨•≠‚„ ≥
   ¿ƒƒƒƒƒƒƒ¡ƒƒƒƒƒƒƒƒƒƒƒ¡ƒƒƒƒƒƒƒƒƒƒ¡ƒƒƒƒƒƒƒƒƒƒƒƒƒƒ¡ƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒ¡ƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒ¡ƒƒƒƒƒƒƒƒƒƒƒƒƒƒŸ
.]h
    ˇÅ@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ˇÅ
.{BY basedoc.nrec
.begin
 npp:=npp+1;
end.
      &&&&& @@@@@@@@@@@ @@@@@@@@@@ @@@@@@@@@@@@@@ @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@  @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@   &&&&&&&&&.&&ˇò
.}
.}
.endform