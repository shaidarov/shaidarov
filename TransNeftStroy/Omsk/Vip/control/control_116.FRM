.form 'control_116'
.nameinlist '������ ��室��� ��������� � �㫥��� 業�� ��'
.group '����஫� ᮮ⢥��⢨� ����⨢���� ������'
.ard
.p 60
.defo portrait
.var
 d1,d2:date;
 b1:byte;
 npp:integer;
.endvar
.create view t1 as
select if(spsopr.prmc=word(1),katmc.name,katusl.name)(fieldname=mcusl),katsopr.dsopr, 
       katsopr.nsopr,katsopr.descr,katdoc.name
FROM spsopr, katmc, katusl, katsopr, katdoc
where((
katsopr.nrec==spsopr.csopr
AND 0==katdoc.sysnum
AND katsopr.vidsopr==katdoc.tidkgal
AND spsopr.cmcusl==katmc.nrec
AND spsopr.cmcusl==katusl.nrec))
and spsopr.price=0
AND (katsopr.vidsopr=101
OR  katsopr.vidsopr=502
OR  katsopr.vidsopr=503
OR  katsopr.vidsopr=106
)
AND katsopr.dsopr>=d1
AND katsopr.dsopr<=d2
ORDER ord1 BY katsopr.vidsopr,katsopr.dsopr
ORDER ord2 BY katsopr.vidsopr,katsopr.descr;
.begin
 d1:=DGETTUNE('dat_m_ot');
 d2:=DATE(LAST_DAY(d1),MONTH(d1),YEAR(d1));
 IF RunDialog(control_102,d1,d2,b1)=cmCancel control_116.fexit;
end.
.begin
 IF b1=0 SETORDER(tiOrd1);
 ELSE SETORDER(tiOrd2);
 npp:=0;
end.
.fields
 commonformheader
 d1
 d2
 t1.katdoc.name
 IF(t1.spsopr.prmc=word(1),'��:','��㣨:')
 npp
 t1.mcusl
 t1.katsopr.dsopr
 t1.katsopr.nsopr
 t1.katsopr.descr
 .endfields
^
                 ������ ��室��� ��������� � �㫥��� 業�� ��
                          c @@@@@@@@@@ �� @@@@@@@@@@
.{table 't1' BY katsopr.vidsopr
.[h
                                                                ���� @np@
���������������������������������������������������������������������������Ŀ
�   N   �         ������������ ��       �     ���    �  �����   ����ਯ��
�  �/�  �                               �   ���㬥�� � ���㬥�⠳          �
�����������������������������������������������������������������������������
.]h��
 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@��
.{table 't1' BY spsopr.prmc
   ��@@@@@@@@@@@@��
.{BY katsopr.nrec
.begin
 npp:=npp+1;
end.
  &&&&&  @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@  @@@@@@@@@@@@@ @@@@@@@@@@ @@@@@@@@@@
.}
.}
.}
.endform