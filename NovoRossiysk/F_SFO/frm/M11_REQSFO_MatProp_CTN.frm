.LinkForm 'REQSFO_M11_01_CHTN_4' Prototype is 'REQSFO_M11'
.Group '�����'
.NameInList '���. ���ਠ��� �ய��'
.p 38
.lm 5
.f 'MBPM_11.OUT'
.DEFP PA4
.DEFO PORTRAIT
.LL 80
.var
  TotalKol:Double
  ParentPodr:String
.endvar
.Create    view t
as select * from
KatPodr
, synonym KatPodr KatPodrParent
;
.fields
  ParentPodr
  dNumber
  dDate
  PersName
  lKod
  lName
  otpKol
  Ed
  otpKol
  TotalKol
  PodrTo
  MOLFrom
  sGetTune('MAINBUH')
  PersName
.endfields
.{
.begin
  if (t.GetFirst KatPodr where ((PodrFrom== KatPodr.Name)) = tsOK) {
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
.{
.{?internal; otpKol > 0
.begin
 TotalKol := TotalKol + otpKol;
end.
�@@@@@@@@@@@@@@@@@@@@�@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@�@@@@@@@@@@@@�@@@@@@@@@@@@�@@@@@@@@@@@@@�           �           �
.}
.}
��������������������������������������������������������������������������������������������������������������������������������������������������������
                                                            �⮣� ������⢮ ������: @@@@@@@@@@@@@@@@@@@@@
                                                            �⮣� ������⢮ ����: ______________

�㤠 �뢮����� ��@~@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@��

��稭� �뢮�� _________________________________________________________________________________________________________________________________________

����⨫       ��@~@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@��
                                                        (䠬����, ���, ����⢮ ���ਠ�쭮-�⢥��⢥����� ���)

���� ࠧ�訫 ______________________________   _______________________________________________________________________________________________________
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
.}
.endform
