.form fuel_ro
.ARD
.group '����஫� ᮮ⢥��⢨� ����⨢���� ������'
.defo landscape
.nameinlist '���� �� ����஫� ����ᥭ�� ���⭮�⥩ ⮯���� � �� �����⨪�'
.var
d1,d2 : date;
.endvar
.begin
IF RunDialog('C_common::GetIntervalDates',d1,d2)=cmCancel Fuel_ro.fexit;
end.
.create view t_main as
select katpodr.*, katmc.*, spsklad.*,  x$users.*
//katpodr.name, katmc.name, spsklad.density, spsklad.dcheck, spsklad.tcheck, x$users.xu$fullname ᬮ���� �!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!1
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
                             ���� �� ����஫� ����ᥭ�� ���⭮�⥩ ⮯���� � �� �����⨪�
                                                 c @@@@@@@@@@ �� @@@@@@@@@@
��������������������������������������������������������������������������������������������������������Ŀ
�      ��� �����          ����⭮��� �६� �        ��� ���㤭���,            �    ��� � �६�      �
�                           �         � ����࠳  ᮧ���襣�/�������襣� ������    � ��᫥����� ��������� �
����������������������������������������������������������������������������������������������������������
.{table 't_main' BY spsklad.cpodr
��^��
!{table 't_main' BY spsklad.cmc
.{BY spsklad.cmc
  ^
.{BY spsklad.nrec
     @@@@@@@@@@@@@@@@@@@@@@@  &&.&&&&   @@@@@@  @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@   @@@@@@@@@@ � ^
.}
.}
.}
.endform