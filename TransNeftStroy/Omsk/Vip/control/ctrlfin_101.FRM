.form ctrlfin_101
.group '����஫� ᮮ⢥��⢨� 䨭��ᮢ��� ������'
.nameinlist '������ ���⥦��� ���㬥�⮢ � ����稥� �㬬 � ��୥��� ��㯯�� ��⮢'
.ard
.var
np:integer
d1,d2:date
.endvar
.begin
        IF RunDialog('C_common::GetIntervalDates',d1,d2)=cmCancel ctrlfin_101.fexit;
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
��                  ��     �������� ���⥦��� ���㬥�⮢ � ����稥� �㬬 � ��୥��� ��㯯�� ��⮢��
                                            ��     c @@@@@@@@@@ �� @@@@@@@@@��@
���������������������������������������������������������������������������������������������������������������������������������������������������������Ŀ
�   �����   �    ���     �            �������� �࣠����樨           �         ���� ���⥫�騪�         �                   ��㯯� ��⮢                �
�  ���-�   �   ������    �                                           �                                  �                                                �
���������������������������������������������������������������������������������������������������������������������������������������������������������Ĵ
.{Table 'v'
.begin
np:=np+1
end.
�@@@@@~@@@@@�@@@@@@~@@@@@@�@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@�@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@�@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@�
.}
�������������������������������������������������������������������������������������������������������������������������������������������������������������
.endform
