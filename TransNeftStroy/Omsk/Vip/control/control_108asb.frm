��.form 'control_108aktsb'
.nameinlist '*���᮪ ��⮢ �� �������� ��� ��� ��壠���᪨� �஢����'
.group '������஫� ᮮ⢥��⢨��� ����壠���᪮�� ��������'
.ard
.p 60                                                 //���-�� ��ப �� ��࠭��
.o 5                                                  //����� �ࠢ�
.var                                                  //������� ��६�����
 v1,v2,v3:double;
 d1,d2:date;                                          //��ਮ� �ନ஢���� ����
�� b1:byte;                                             //��६����� ��� ���-� �뢮�� �� ���� ��� �� ���
 c1:comp;
 s1:string;
��.endvar
.create view table3 as SELECT planssch.*
WHERE
((
 c1==planssch.nrec                                   //��।������ ����� ��⮢
));
��.create view t1 as
SELECT katsopr.desgr,katsopr.descr,katsopr.nrec,katsopr.vidsopr,katsopr.nsopr,katsopr.dsopr,katsopr.summa,
       oborot.tidk,oborot.sumob,grdescr.name
WHERE ((211==katsopr.vidsopr AND
        211==oborot.tidk AND
        katsopr.nrec==oborot.csoprdoc AND
        katsopr.desgr==grdescr.desgr AND
        c1==oborot.cplanssch))
AND (katsopr.dsopr>=d1 AND katsopr.dsopr<=d2)��
��ORDER ord1 BY katsopr.vidsopr,katsopr.desgr,katsopr.dsopr  //ord1 - ��६����� ��� ���஢�� �� ��㯯�,���
ORDER ord2 BY katsopr.vidsopr,katsopr.descr;               //ord2 - ��६����� ��� ���஢�� �� ���ਯ���
.fields
 commonformheader  //�뢮� 1-� ��ப�:���ਯ��, �६�
 d1
 d2
 s1
 t1.katsopr.desgr
! t1.grdescr.name
 t1.katsopr.descr
 t1.katsopr.nsopr
 t1.katsopr.dsopr
 ROUND(t1.katsopr.summa,2)
 t1.grdescr.name
! ROUND(t1.katsopr.summa,2) : 'SUM'
 ROUND(t1.katsopr.summa,2) : 'SUM'
.endfields
^
.begin
 c1:=coGetTune('��FIN.USER.CPLANSSCH��');
 IF table3.getfirst planssch<> tsOK {};
 s1:=table3.planssch.name;
 d1:=DGetTune('dat_m_ot');
 d2:=DATE(LAST_DAY(d1),MONTH(d1),YEAR(d1));
 IF RunDialog('C_common::GetIntervalDates',d1,d2,b1)=cmCancel then
   {
   Message ('�⪠� �� �롮�');
  control_108aktsb.fexit;                                  //�� �⪠��, ��室 �� ��-��
��   }
  t1.getfirst;
�� IF b1=0 SETORDER(tiOrd1);                               //���஢�� �� ��࠭���� ⨯�
 ELSE SETORDER(tiOrd2);
�� v1:=0;
 v2:=0;
end.
.{Table 't1.katsopr'
.[h                                                      //����� 蠯�� �� ������ ����
                       �����᮪ ��⮢ �� �������� ��� ��� ��壠���᪨� �஢������
                                   �� c ��@@@@@@@@@@�� �� ��@@@@@@@@@@��

 ���� ��⮢:@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@                  ���� @np@
 ����������������������������������������������������������������������������������������������������������������������������
 � ��㯯� ����ਯ�� �       �����       �    ���    �     �㬬� ��      �             ������������ ��㯯�
 �        �           �       ���        �    ���    �       ����        �
 ����������������������������������������������������������������������������������������������������������������������������
.]h
.{Table 't1.oborot'
.begin
 v1:=v1+t1.oborot.sumob;
end.
.}
.{?internal;ROUND(v1,2)=0;
!.{table 't1.desgr'
! @@@@@@@@@ - ��@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@��
!.{Table 't1.katsopr'
  @@@@@@@@@ @@@@@@@@@@@ @@@@@@@@@@@@@@@@@@@ @@@@@@@@@@@@ &'&&&&&&&&&&&&&&&.&&  @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
!.}             //katsopr
��!�ᥣ� �� ��㯯�                                         &'&&&&&&&&&&&&&&&.&&��
!.}            //desgr
.}            //internal
.begin
 v1:=0;
end.
.}
�� �⮣� �� ��������:                                    &'&&&&&&&&&&&&&&&.&&��
��.endform��