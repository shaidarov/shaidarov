.LinkForm 'MOVE_MBP_014_MATPROP' Prototype is 'MOVE_MBP'
.Group '���� � ��ᯫ����. �����.'
.Group '����७��� ��६�饭��. �����.'
.NameInList '���. ���ਠ��� �ய��'
.p 38
.lm 5
.f 'MBPM_11.OUT'
.DEFP PA4
.DEFO PORTRAIT
.LL 80
.var
  Tire:String
  CurP:Word
  Counter:Word
  PrintPic:Boolean
  hCnt:LongInt
  KolDoc:Boolean
  TotalKol:Double
  ParentPodr:String
.endvar
.Create      view t
as select * from
KatPodr
, synonym KatPodr KatPodrParent
;
.fields
  ParentPodr
  Nom
  Dat
  WOKERFIO
  MBPnum
  MBPname
  otpKol
  MBPed
  otpKol
  TotalKol
  ToPodr
  FromMol
  sGetTune('MAINBUH')
  WOKERFIO
.endfields
.begin
CurP := -1;
Tire := ' ';
Counter:= 1;
end.
.{?internal;(Counter mod 2) > 0
.begin
  CurP := CurP + 1;
  if (CurP>0) Tire:='-';
  if (t.GetFirst KatPodr where ((FromPodr== KatPodr.Name)) = tsOK) {
    if (t.GetFirst KatPodrParent where ((SubStr(KatPodr.Kod,1,2) == KatPodrParent.Kod)) = tsOK) {
       ParentPodr := KatPodrParent.Name;
     }
  }
end.
��                                                                                                                �ਫ������ �2 � �ਪ��� �
                                                                                                                �� " "            20   �.

                        ��@~@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@��
                                                     (������������ 䨫���� ��� ������୮�� ���ࠧ�������)


                                                       ���ਠ��� �ய�� � _____________ ������ ___________

                                                             � ��������� � @@@@@@@@@@@ �� @@@@@@@@@@@

����: ��@~@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@��
                                                                (䠬����, ���, ����⢮)

�������������������������������������������������������������������������������������������������������������������������������������������������������
                                                     (��⮬�設� ��ઠ, ���㤠��⢥��� �����)

����蠥��� �뢮� �� ������, � ����ਨ (���㦭�� ���ભ���)
᫥����� ⮢�୮-���ਠ���� 業���⥩:
������������������������������������������������������������������������������������������������������������������������������������������������������Ŀ
�   ������������   �           ������������ ⮢�୮-���ਠ���� 業���⥩           � ������⢮ �   ������  � ������⢮  �������⢮ �  ������  �
�        �����       �                                                                 �   ������   �  ����७�� � 䠪��᪮� �   ����    � ����७�� �
������������������������������������������������������������������������������������������������������������������������������������������������������Ĵ
.}
.{
.begin
 TotalKol := TotalKol + otpKol;
end.
�@@@@@@@@@@@@@@@@@@@@�@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@�@@@@@@@@@@@@�@@@@@@@@@@@@�@@@@@@@@@@@@@�           �           �
.}
��������������������������������������������������������������������������������������������������������������������������������������������������������
                                                            �⮣� ������⢮ ������: @@@@@@@@@@@@@@@@@@@@@
                                                            �⮣� ������⢮ ����: ______________

�㤠 �뢮����� ��@~@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@��

��稭� �뢮�� __________________________________________________________________________________________________________________________________________

����⨫       ��@~@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@��
                                                        (䠬����, ���, ����⢮ ���ਠ�쭮-�⢥��⢥����� ���)

���� ࠧ�訫 ______________________________   ________________________________________________________________________________________________________
                   (������� �㪮����⥫�)                                                (䠬����, ���, ����⢮)

��. ��壠���  _______________________________   ��@~@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@��
                    (������� ����. ���.)                                                 (䠬����, ���, ����⢮)

��ᯨ᪠ ���, �뭥�襣�
⮢�୮-���ਠ��� 業���� _______________________________   ��@~@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@��
                                        (�������)                                        (䠬����, ���, ����⢮)

________________________________________________________________________________________________________________________________________________________
                                                                      (�⬥⪠ �㦡� ������᭮��)

� ����஫쭮�� �㭪� ______________________________________

��� �뢮��  "   "                  20   �.
 ������ ��� �ய�᪮�    ________________________________    ________________________________________________________________________________________
(����஫���, ��࠭��� ���)             (�������)                                         (䠬����, ���, ����⢮)
.endform
