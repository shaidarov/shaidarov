��.form ctrlbuh_104
.group '����஫� ᮮ⢥��⢨� ��壠���᪮�� ������'
.nameinlist '���� � ��ᮮ⢥��⢨� �������⥩ ���᫥����� ����� ��壠���᪨� �஢�����'
.defo landscape
.p 50
.ard
.var
 d1,d2:date;
 dmove1:date;
 nom1,namepodr1,namemol1,namesfo1:string;
 sumsfo1,sumob1:double;
 npp:integer;
 cplan1:comp;
.endvar
.create view t1 AS
SELECT mbpmove.*,mbpout.*,oborot.*,katpodr.*,katmol.*,katmbp.*
WHERE
((
 6==mbpmove.status
 AND d1<<=mbpmove.dmove
 AND d2>>=mbpmove.dmove
 AND mbpmove.cpodrf==katpodr.nrec
 AND mbpmove.cmolf==katmol.nrec
 AND mbpmove.nrec==mbpout.cmove
 AND mbpout.cmbpin==mbpin.nrec
 AND mbpin.cmbp==katmbp.nrec
 AND 13==oborot.tidk
 AND mbpout.nrec==oborot.csoprdoc
 AND cplan1==oborot.cplanssch
));
.begin
 ��cplan1:=CoGetTune('FIN.USER.CPLANSSCH��');
 d1:=��DGetTune('��DAT_M_OT');
 d2:=DATE(LAST_DAY(d1),MONTH(d1),YEAR(d1));
 npp:=0;
 IF RunDialog('C_common::GetIntervalDates',d1,d2)=cmCancel ctrlbuh_104.fexit;
end.
.fields
 d1
 d2
 npp
 dmove1
 nom1
 namepodr1
 namemol1
 namesfo1
 sumsfo1
 sumob1
.endfields
.{table 't1' BY mbpmove.nrec
.[h
                                                               ���� � ��ᮮ⢥��⢨� �������⥩ ���᫥����� ����� ��壠���᪨� �஢�����
                                                                                     � @@@@@@@@@@ �� @@@@@@@@@@
                                                                                                                                                                                                   ���� @np@
������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������Ŀ
�  �  �  ���    �      �����       �                    ���ࠧ�������                    �      ���ਠ�쭮-�⢥��⢥���� ���     �                 ������������ ���                 � �㬬� �� � �㬬� �� �
� �/� ��������� �    ��������     �                                                     �                                         �                                                  ��������� ��஢����� �
��������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������
.]h
.begin
 dmove1:=t1.mbpmove.dmove;
 nom1:=t1.mbpmove.nom;
 namepodr1:=t1.katpodr.name;
 namemol1:=t1.katmol.name;
end.
.{BY mbpout.nrec
.begin
 namesfo1:=t1.katmbp.name;
 sumsfo1:=t1.mbpout.summaisn;
 sumob1:=0;
end.
.{BY oborot.nrec
.begin
 sumob1:=sumob1+t1.oborot.sumob;
end.
.}
.{?internal;ROUND(sumsfo1,2)<>ROUND(sumob1,2);
.begin
 npp:=npp+1;
end.
 &&&&& @@@@@@@@@@ @@@@@@@@@@@@@@@@@@ @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ &&&&&&&.&& &&&&&&&.&&
.}
.}
.}
.endform��
