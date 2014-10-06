.form ctrlbuh_101
.group 'Š®­âà®«ì á®®â¢¥âáâ¢¨ï ¡ãå£ «â¥àáª®£® ª®­âãà '
.nameinlist '¥¥áâà ¯« â¥¦­ëå ¤®ªã¬¥­â®¢ á ­ «¨ç¨¥¬ áã¬¬ ª®à­¥¢ëå £àã¯¯ å áç¥â®¢'
.ard
.var
np:integer
d1,d2:date
.endvar
.begin
        IF RunDialog('C_common::GetIntervalDates',d1,d2)=cmCancel ctrlbuh_101.fexit;
end.
.create view v as select
plpor.nodok,plpor.datob,katorg.name,katbank.name,groupsch.name
where(( plpor.cbankplat==katbank.nrec AND
        plpor.cpol==katorg.nrec AND
        plpor.cgroupsch==groupsch.nrec
        ))
        AND groupsch.cnode=0h
        AND plpor.datob>=d1
        AND plpor.datob<=d2;
.begin
np:=0;
end.
.fields
 d1 d2 plpor.nodok plpor.datob katorg.name katbank.name groupsch.name
.endfields
ÿ˜                  ÿ     ÿ¥¥áâà ¯« â¥¦­ëå ¤®ªã¬¥­â®¢ á ­ «¨ç¨¥¬ áã¬¬ ª®à­¥¢ëå £àã¯¯ å áç¥â®¢ÿ‘
                                            ÿ‘     c @@@@@@@@@@ ¯® @@@@@@@@@ÿ‘@
ÚÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
³   ®¬¥à   ³    „ â      ³             §¢ ­¨¥ Žà£ ­¨§ æ¨¨           ³          ­ª ¯« â¥«ìé¨ª          ³                   ƒàã¯¯  áç¥â®¢                ³
³  ¤®ª-â    ³   ®¯« âë    ³                                           ³                                  ³                                                ³
ÃÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´
.{Table 'v'
.begin
np:=np+1
end.
³@@@@@~@@@@@³@@@@@@~@@@@@@³@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@³@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@³@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@³
.}
ÀÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙÿ˜
.endform
