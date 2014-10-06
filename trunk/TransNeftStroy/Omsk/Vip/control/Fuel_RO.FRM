.form fuel_ro
.ARD
.group 'Š®­âà®«ì á®®â¢¥âáâ¢¨ï ®¯¥à â¨¢­®£® ª®­âãà '
.defo landscape
.nameinlist 'Žâç¥â ¯® ª®­âà®«î § ­¥á¥­¨ï ¯«®â­®áâ¥© â®¯«¨¢  ¢ Š ƒ « ªâ¨ª '
.var
d1,d2 : date;
.endvar
.begin
IF RunDialog('C_common::GetIntervalDates',d1,d2)=cmCancel Fuel_ro.fexit;
end.
.create view t_main as
select katpodr.*, katmc.*, spsklad.*,  x$users.*
//katpodr.name, katmc.name, spsklad.density, spsklad.dcheck, spsklad.tcheck, x$users.xu$fullname á¬®âà¥âì áî¤ !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!1
FROM spsklad, katpodr, katmc, x$users
WHERE ((spsklad.cpodr == katpodr.nrec
AND   spsklad.atl_lastuser== x$users.atl_nrec
AND   spsklad.cmc== katmc.nrec
))
AND        spsklad.dcheck>=d1
AND        spsklad.dcheck<=d2
ORDER external BY katpodr.name, katmc.name, spsklad.dcheck, spsklad.tcheck
;
!.{t_main.spsklad
!.begin
!t.tmpgrn.wlist := 1980
!t.tmpgrn.crec1     := comp(t_main.katpodr.name)
!t.tmpgrn.
!end.
!.}
.fields
d1
d2
katpodr.name
katmc.name
spsklad.dcheck
spsklad.density
spsklad.tcheck
x$users.xu$fullname
spsklad.atl_lastdate
spsklad.atl_lasttime
.endfields
.begin
t_main.getfirst;
end.
                             Žâç¥â ¯® ª®­âà®«î § ­¥á¥­¨ï ¯«®â­®áâ¥© â®¯«¨¢  ¢ Š ƒ « ªâ¨ª 
                                                 c @@@@@@@@@@ ¯® @@@@@@@@@@
ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
³      „ â  § ¬¥à           ³«®â­®áâì³ ‚à¥¬ï ³        ”ˆŽ á®âàã¤­¨ª ,            ³    „ â  ¨ ¢à¥¬ï      ³
³                           ³         ³ § ¬¥à ³  á®§¤ ¢è¥£®/¨§¬¥­¨¢è¥£® § ¯¨áì    ³ ¯®á«¥¤­¥£® ¨§¬¥­¥­¨ï ³
ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
.{table 't_main' BY spsklad.cpodr
ÿ^ÿ
!{table 't_main' BY spsklad.cmc
.{BY spsklad.cmc
  ^
.{BY spsklad.nrec
     @@@@@@@@@@@@@@@@@@@@@@@  &&.&&&&   @@@@@@  @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@   @@@@@@@@@@ ¢ ^
.}
.}
.}
.endform