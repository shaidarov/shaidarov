��.form 'control_108'
.nameinlist '���� � ��ᮮ⢥��⢨� ��室��� ��������� ��壠���᪨� �஢�����'
.group '������஫� ᮮ⢥��⢨��� ����壠���᪮�� ��������'
.ard
.p 60
.o 5
.var
 v1,v2,v3:double;
 d1,d2:date;
�� b1:byte;
 c1:comp;
 s1:string;
��.endvar
.create view table3 as SELECT planssch.*
WHERE
((
 c1==planssch.nrec
));
��.create view t1 as
SELECT katsopr.descr,katsopr.nrec,katsopr.vidsopr,katsopr.nsopr,katsopr.dsopr,katsopr.summa,oborot.tidk,oborot.sumob
WHERE ((101==katsopr.vidsopr AND 101==oborot.tidk AND katsopr.nrec==oborot.csoprdoc AND c1==oborot.cplanssch))
AND (katsopr.dsopr>=d1 AND katsopr.dsopr<=d2)��
AND katsopr.ckatsopr=��0
ORDER ord1 BY katsopr.vidsopr,katsopr.dsopr
ORDER ord2 BY katsopr.vidsopr,katsopr.descr;
.fields
 commonformheader
 d1
 d2
 s1
 t1.katsopr.descr
 t1.katsopr.nsopr
 t1.katsopr.dsopr
 ROUND(t1.katsopr.summa,2)
 ROUND(v1,2)
 ROUND(t1.katsopr.summa,2)-ROUND(v1,2)
.endfields
^
.begin
 c1:=coGetTune('��FIN.USER.CPLANSSCH��');
 IF table3.getfirst planssch<> tsOK {};
 s1:=table3.planssch.name;
 d1:=DGetTune('dat_m_ot');
 d2:=DATE(LAST_DAY(d1),MONTH(d1),YEAR(d1));
 IF RunDialog(control_102,d1,d2,b1)=cmCancel control_108.fexit;
�� t1.getfirst;
�� IF b1=0 SETORDER(tiOrd1);
 ELSE SETORDER(tiOrd2);
�� v1:=0;
 v2:=0;
end.
.{Table 't1.katsopr'
.[h
                 ���� � ��ᮮ⢥��⢨� ��室��� ��������� ��壠���᪨� �஢�����
                                    c @@@@@@@@@@ �� @@@@@@@@@@

 ���� ��⮢:@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@                  ���� @np@
��������������������������������������������������������������������������������������������������������Ŀ
����ਯ�� �       �����       �    ���    �     �㬬� ��      �     �㬬� ��      �     �⪫������    �
�           �     ���������     �  ��������� �     ���������     �     �஢�����     �                   �
����������������������������������������������������������������������������������������������������������
.]h
.{Table 't1.oborot'
.begin
 v1:=v1+IF(t1.oborot.vhprop='+',t1.oborot.sumob,0);
end.
.}
.{?internal;ROUND(t1.katsopr.summa,2)<>ROUND(v1,2);
 @@@@@@@@@@@ @@@@@@@@@@@@@@@@@@@ @@@@@@@@@@@@ &&&&&&&&&&&&&&&&.&& &&&&&&&&&&&&&&&&.&& &&&&&&&&&&&&&&&&.&&
.begin
 v2:=v2+ROUND(t1.katsopr.summa,2);
 v3:=v3+ROUND(v1,2);
end.
.}
.begin
 v1:=0;
end.
.}
.fields
 v2-v3
.endfields

�� �⮣� �� ��������:                                                                  &&&&&&&&&&&&&&&&.&&��
��.endform��