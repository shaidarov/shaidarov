.form 'ctrloper_101'
.nameinlist '������ ��ᮮ⢥��⢨� ��� � ��������� � �थ��'
.group '����஫� ᮮ⢥��⢨� ����⨢���� ������'
.ard
.p 80
.var
 count:integer;
 d1,d2:date;
.endvar
.create view t2 as
SELECT tmpgrn.*;
.create view t1 as
SELECT tmpgrn.*,katsopr.*,sklorder.*,katdoc.*
WHERE
((
1990==tmpgrn.wlist
AND tmpgrn.l==katsopr.vidsopr
AND d1<<=katsopr.dsopr
AND d2>>=katsopr.dsopr
AND katsopr.nrec/==sklorder.csopr
AND 0==katdoc.sysnum
AND tmpgrn.l==katdoc.tidkgal
))
AND (katsopr.dsopr>katsopr.dopr OR katsopr.dsopr>sklorder.dord OR katsopr.dopr<>sklorder.dord);
.begin
 count:=0;
 t2.delete tmpgrn WHERE ((1990==wlist));
 t2.tmpgrn.wlist:=1990;
 t2.tmpgrn.l:=101;
 t2.insert CURRENT tmpgrn;
 t2.tmpgrn.l:=201;
 t2.insert CURRENT tmpgrn;
 t2.tmpgrn.l:=600;
 t2.insert CURRENT tmpgrn;
 t2.tmpgrn.l:=601;
 t2.insert CURRENT tmpgrn;
 d1:=DGETTUNE('DAT_M_OT');
 d2:=DATE(LAST_DAY(d1),MONTH(d1),YEAR(d1));
 IF RunDialog('C_common::GetIntervalDates',d1,d2)=cmCancel ctrloper_101.fexit;
end.
.fields
 commonformheader
 d1
 d2
 t1.katdoc.name
 count
 t1.katsopr.descr
 t1.katsopr.nsopr
 t1.katsopr.dsopr
 t1.katsopr.dopr
 t1.sklorder.dord
 t1.sklorder.norder
 IF(t1.sklorder.vidorder=0,'��室','��室')
 t1.katsopr.summa
.endfields
��^
                          ������ ��ᮮ⢥��⢨� ��� � ��������� � �थ��
                                 c @@@@@@@@@@ �. �� @@@@@@@@@@ �.
.{table 't1.Tmpgrn'
.[h
                                                                                              ���� @np@
������������������������������������������������������������������������������������������������������Ŀ
�  �  �   ���ਯ��   �    �����    �   ���   �   ���   �   ���   �   �����   � ���  �  �㬬� ��   �
� �/� �                �  ���������  ���������� ����室��.�  �थ�  �  �थ�   ��थ࠳  ���������  �
��������������������������������������������������������������������������������������������������������
.]h
�� @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@��@@@@@@@@
.{table 't1.Katsopr'
.{table 't1.Sklorder'
.begin
 count:=count+1;
end.
 &&&&& @@@@@@@@@@@@@@@@ @@@@@@@@@@@@@ @@@@@@@@@@ @@@@@@@@@@ @@@@@@@@@@ @@@@@@@@@@@ @@@@@@ &&&&&&&&&&.&&
.}
.}
.}��
.begin
 t2.delete tmpgrn WHERE ((1990==wlist));
end.
.endform