.LinkForm 'PRINTINMOVNAK_01_AKT' Prototype is 'PRINTINMOVNAK'
.Group 'Vnut'
.NameInList '���. ��� ��।�� � �ᯫ����'
.LM 13
.tm 10
.var
  ProcIzn:Double
  SumIzn:Double
  SchetZ:String
  SumIznItog:Double
.endvar
.Create                                view tAkt
 as select * from
  KatSopr
, MBPin
, SpSopr
, KatPodr
, KatMOL
Where ((   �������������      == KatSopr.nRec
       and KatSopr.nRec       == MBPin.cSopr
       and �����������        == SpSopr.nRec
       and SpSopr.cMCUsl      == KatMBP.cMC
       and KatMBP.nRec        == MBPin.cMBP             (noindex)
       and SpSopr.cParty      == MBPin.cPartyF          (noindex)

       and KatSopr.cMolTo     == KatMOL.nRec
       and KatSopr.cPodrTo    == KatPodr.nRec
       )) ;
.fields
  CommonFormHeader
  NOM
  DAT
  NOMMC
  NAMEMC
  ED
  KOL
  PRICE
  SumPr
  ProcIzn
  SumIzn
  Sum
  SumIznItog
  DoubleToString(0, Sum)
  DoubleToString(0, SumIznItog)
  SchetZ
  ���_����
  ���_������
.endfields
.{
�� ^

                                                    ��� ^ �� ^
                                                  ��।�� � �ᯫ����
                                     �⤥���� �।��⮢ � ��⠢� ������� �।��

  ���� ࠧ�訫: ������� �.�. (���. ��४��)

������������������������������������������������������������������������������������������������������������������������������Ŀ
�    ���    �   ������������ �।��⮢    ���. ���.����-�� �  ����, ��.  � �㬬�, ��.  ��ப �㦡�     � �㬬�, ���������  �
�           �                             �        �       �              �              �� ���. ��� %    � �⭥ᥭ�� �� ��� �
�           �                             �        �       �              �              ����� �⮨���⨳ �����, ��.       �
�           �                             �        �       �              �              ��� ��।��    �                    �
�           �                             �        �       �              �              �� �ᯫ����  �                    �
.{
.begin
if (tAkt.GetFirst KatSopr = tsOK) {}
if (tAkt.GetFirst MBPin  = tsOK)  {}
if (tAkt.GetFirst SpSopr = tsOK)  {}
  ProcIzn       := tAkt.MBPin.PERCNACH;
  SumIzn        := tAkt.MBPIN.SUMMAISNN;
  SumIznItog    := SumIznItog + SumIzn;
end.
������������������������������������������������������������������������������������������������������������������������������ĳ
�@@@@@@@@@@@�@@@@@@@@@@@@@@@@@@@@@@@@@@@@@�@@@@@@@@�&#'&&&&�&#'&&&&&&&&&&&�&#'&&&&&&&&&&&�&&&&&&&&&&&&&&&&�&#'&&&&&&&&&&&&&&.&&�
.}
��������������������������������������������������������������������������������������������������������������������������������
                                 �⮣�:                                    &#'&&&&&&&&&&&                  &#'&&&&&&&&&&&&&&.&&

�⮣� ��।��� � �ᯫ���� �।��⮢ �� �㬬�: @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
.begin
if (tAkt.GetFirst KatPodr = tsOK) {}
if (tAkt.GetFirst KatMOL = tsOK)  {}
   SchetZ := tAkt.KatPodr.Kod;

        Case tAkt.KatMOl.Kod of
              4611793393317973037:
              {SchetZ := '20_10';}
              4611736145954476537:
              {SchetZ := '20_10_2';}
        end; // case
end.
����� � �㬬� @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
�⭥�� �� ���� ��^��

�ਭ�:   ^

����⨫: ^
.}
.endform
