.LinkForm 'PRIKR01_OM_RAM' Prototype is 'PRIKR'
.NameInList '(�����)������ �ਪ���� �� �������஢���'
.var
DatDoc,NomDok,RCity,RSrok: String;
.endvar
.fields
  CommonFormHeader
  FPodr
  FOrg
  FState
  FCity

  FD1
  FD2
  FStatus

!  D_doc
!  N_Doc
!  State
!  City
!  ADR
!  Srok
  NomKU
! Podr
  FIO
DatDoc
NomDok
RCity
RSrok 
  StateEtap
  CityEtap
  ADREtap
  SrokEtap
.endfields
^
                    ��           ������ �ਪ���� �� �������஢����
.if MYFILTRR3
�ਬ���� 䨫���...
 ���ࠧ������� : @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
 �࣠������   : @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
 ��࠭�        : @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
 ��த         : @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
 ��ਮ�        : c @@@@@@@@@@  �� @@@@@@@@@@     ����� : @@@@@@@@@@@@@@@@@@@@@@@
.else
.end
���������������������������������������������������������������������������������������������������������������
 � ��   �                      ���                    � ��� �ਪ��������� �ਪ���� �㤠 �������஢����ப(��.)
���������������������������������������������������������������������������������������������������������������
.{
.begin
DatDoc:=D_doc;
NomDok:=N_doc;
RCity:=State+City+ADR;
RSrok:=Srok;
end.
!@@@@@@@@@@ @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ � @@@@@@@@@@@ � @@@@@@@@@@@ � @@@@@@@@@@@@@@@@� @@@@@
.{
@@@@@@@@� @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ � @@@@@@@@@@  �  @@@@@@@@@@@� @@@@@@@@@@@@@@@@@� @@@@@��
.{CheckEnter PRIKRETAP
 ��                        @@@@@@@@@@@@@@ @@@@@@@@@@@@@@@@@ @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ @@@@@@@@@@��
.}
.}
!  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .
.}
.endform