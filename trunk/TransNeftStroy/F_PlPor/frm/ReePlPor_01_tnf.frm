.LinkForm 'REEPLPOR_01_tnf' Prototype is 'REEPLPOR'
.Group '��������� ���⥦��� ����祭��'
.Group '���⥦��� ����祭��'
.Group '��壠���᪠� �ࠢ��'  
.NameInList '���宦����� �㬬� �� ���㬥��� � �஢���� � ����'
.p 60
.DEFO LANDSCAPE
.create view obor
from plpor, oborot
where
((
PlPorNRec    == plpor.nrec      and
plpor.tidk   == oborot.tidk     and
plpor.nrec   == oborot.csoprdoc and
cogettune('FIN.USER.CPLANSSCH') == oborot.cplanssch
));
.var
 sumobor: double
.endvar
.fields
  CommonFormHeader
  c0p9
  c0p1
  c0p4
  cFil0
  cFil1
  c1p1
  c1p2
  c1p3
  OrgName
  c1p5
  BankName
  BankKod
  BankSchet
  c1p9
.endfields
��^
          ������ ���㬥�⮢ : ^
                               ^
��������� ��ନ஢��� � ^
.if REEPLPORFIL
�ਬ���� 䨫���...
.{
  ^ ^
.}
.else
.end
.{
.[H
                                                                                                                                                                         ���� @np@
������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������
   ���   �   ���   ������ �          ���⥫�騪 /          �    �㬬�       �       ����          �    ���      �   ������   �                ������������ ���⥦�
 �믨᪨  �  ������  ����-⠳          �����⥫�            �                �   ����./ ������.   �   �����     �     ���      �
������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������
.]H
.if REEPLPOR00
.else
.end
.{
.begin
sumobor:=0;
obor._loop plpor
{
 obor._loop oborot
 {
  if (obor.oborot.VHPROP='+') and (obor.oborot.datob=obor.plpor.datob)
   sumobor:=sumobor+obor.oborot.sumob;
 };
};
end.
.{?internal;round(sumobor,6)<>double(c1p5);
@@@@@@@@@@ @@@@@@@@@@ @@@@@@ @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ &'&&&&&&&&&&&&&& @@@@@@@@@@@@@@@@@@@@@ @@@@@@@@@@@@@ @@@@@@@@@@@@@@@ @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
.}
.if REEPLPOR01
.{
.}
.else
.end
.}
.if REEPLPOR02
.else
.end
.}��
.endform