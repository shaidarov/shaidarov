��//������� 06.02.2004 ������ �.�.
.form 'control_120'
.nameinlist '������ �� � �㫥�� ������⢮� � ���㫥��� 業��'
.group '����஫� ᮮ⢥��⢨� ����⨢���� ������'
.ard
.var
 d1,d2:date;
 b1,b2,b3:byte;
 npp,npp1:integer;
 c:comp
.endvar
.p 80
.defo portrait
.o 10
.begin
 d1:=DGETTUNE('dat_m_ot');
 d2:=DATE(last_day(d1),MONTH(d1),YEAR(d1));
 IF RunInterface(control_104,d1,d2,b1,b2,b3)=cmCancel control_120.fexit;
 IF b2=1 d1:=DATE(1,10,2001);
end.
.create view t1 as
SELECT SUB_DAY(saldomc.dsaldo,1)(FIELDNAME=dataost),
katmc.name,saldomc.kol,saldomc.srprice,katmol.name,saldomc.cpodr
FROM katmc,saldomc, katmol
where
((
saldomc.cmc==katmc.nrec
AND saldomc.cmol==katmol.nrec
AND d1<<saldomc.dsaldo
AND add_day(d2,1)>>=saldomc.dsaldo
AND b1==saldomc.sp
))
and saldomc.kol=0
and srprice<>0
and saldomc.cpodr<>0
ORDER BY saldomc.dsaldo;
��.create view table3 as
select tmpgrn.*,katpodr.*
WHERE
((
1061==tmpgrn.wlist
AND tmpgrn.crec1/==katpodr.nrec
));
��.begin
�� table3.delete all  tmpgrn where (( 1061== tmpgrn.wlist ));
�� npp:=0;
 npp1:=0;
end.
��.{table 't1'
.begin
   table3.tmpgrn.wlist:=1061;
   table3.tmpgrn.crec1:=t1.saldomc.cpodr;
   if b3=0 then table3.tmpgrn.d:=t1.dataost
   ELSE table3.tmpgrn.ds[3]:=t1.dataost
   table3.tmpgrn.s:=t1.katmc.name;
   table3.tmpgrn.ss[2]:=t1.katmol.name;
   table3.tmpgrn.sums[1]:=t1.saldomc.kol;
   table3.tmpgrn.sums[2]:=t1.saldomc.srprice;
   table3.insert current tmpgrn;
end.��
.}
.fields
 commonformheader
 IF(b1=0,'(᪫��᪮� ���)','(�ந�����⢮)')
 d1
 d2
 table3.katpodr.name
 npp
 ��IF(b3=0,table3.tmpgrn.d,table3.tmpgrn.ds[3])��
 table3.tmpgrn.s
 table3.tmpgrn.sums[2]
!if (ROUND(-0.000006,5)=0,'0','-')
 table3.tmpgrn.ss[2]
.endfields
^
                                        ������ �� � �㫥�� ������⢮� � ���㫥��� 業�� @@@@@@@@@@@@@@@@@
                                                       � @@@@@@@@@@ �� @@@@@@@@@@
.{table 'Table3'
.[h
��������������������������������������������������������������������������������������������������������������������������������������������Ŀ
�  �   �  ���    �                 ������������ ��                         �     ����      �                       ���                      �
� �/�  � ���⪮� �                                                         �               �                                                �
����������������������������������������������������������������������������������������������������������������������������������������������
.]h
.{?internal; round(table3.tmpgrn.sums[2],5)<>0;��
.{?internal;table3.tmpgrn.crec1<>c
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@��
.begin
c:=table3.tmpgrn.crec1;
end.
.}
.begin
 npp:=npp+1;
end.
 &&&&&& @@@@@@@@@@ @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ &&&&&&&&&.&&&&&  @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
.}
.}
��.endform