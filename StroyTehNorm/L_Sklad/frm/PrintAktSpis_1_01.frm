.LinkForm 'PRINTAKTSPIS_1_01' Prototype is 'PRINTAKTSPIS'
.NameInList '���. ��� � ᯨᠭ�� ���ਠ���'
.DEFP PA4
.DEFO LANDSCAPE
.LL 51
.var
  mfo_:String
  unn_:String
  okpo_:String
  �����_童��_�����ᨨ:Word
  ���ᨢ_����_�����ᨨ_nRec: ARRAY [1..2] of Comp
  ���ᨢ_����_�����ᨨ_���: ARRAY [1..2] of String
  ���ᨢ_����_�����ᨨ_�������_�����: ARRAY [1..2] of String
  ���ᨢ_����_�����ᨨ_���������: ARRAY [1..2] of String
  schet_TXO : string
.endvar
.create view t
  as select * from
  KatSopr
, SoprHoz
, HozOper
;
.fields
  �࣠������
  + ' ����:'    + ���_����
  + ' ����:'     + ���_����_���
  + ' �/� '      + ���_����_���
  + mfo_         + ���_����_��
  ����:'P:C'
  �����
  ���_OKONH:'P:C'
  NOM:'P:C'
  DateToStr(���, 'DD/MM/YYYY')
  ��稭�_����
  ������������
  ���:'P:C'
  if(dDatePoluch=date(0,0,0),'',DateToStr(dDatePoluch,'DD/MM/YYYY')):'P:C'
  if(���᪭��_������_����७��<>'',���᪭��_������_����७��,������_����७��)
  ������⢮
  ����_������*�����樥��_���᪭��_�������_����७��
  ����*�����樥��_���᪭��_�������_����७��
  ����
  �⮨�����
  �����
  �����_��������
  �।ᥤ�⥫�_�����ᨨ_���������
  �।ᥤ�⥫�_�����ᨨ_���
  if (�����_童��_�����ᨨ = word(1), '����� �����ᨨ:', '')
  ���ᨢ_����_�����ᨨ_��������� [�����_童��_�����ᨨ]
  ���ᨢ_����_�����ᨨ_���       [�����_童��_�����ᨨ]
  if(���_���������<>'',���_���������,'')
  if(���_��㤠<>'',���_��㤠,'')
  schet_TXO
.endfields
.begin
  mfo_  := ' ' + sGetTune('KatOrg.FldView.MFO')  + ': ';
  unn_  := ' ' + sGetTune('KatOrg.FldView.UNN')  + ': ';
  okpo_ := ' ' + sGetTune('KatOrg.FldView.OKPO') + ': ';
end.

.{
.begin
  �����_童��_�����ᨨ := 0;


  for (�����_童��_�����ᨨ := 1; �����_童��_�����ᨨ <= Count(���ᨢ_����_�����ᨨ_nRec); �����_童��_�����ᨨ := �����_童��_�����ᨨ + 1)
  {
    ���ᨢ_����_�����ᨨ_nRec            [�����_童��_�����ᨨ] := comp(0);
    ���ᨢ_����_�����ᨨ_���             [�����_童��_�����ᨨ] := '';
    ���ᨢ_����_�����ᨨ_�������_����� [�����_童��_�����ᨨ] := '';
    ���ᨢ_����_�����ᨨ_���������       [�����_童��_�����ᨨ] := '';
  }

  �����_童��_�����ᨨ := 0;
end.
.{CheckEnter COMMISSIONMEMBER_PRINTAKTSPIS
.begin
  �����_童��_�����ᨨ := �����_童��_�����ᨨ + 1;
  ���ᨢ_����_�����ᨨ_nRec            [�����_童��_�����ᨨ] := ����_�����ᨨ_nRec;
  ���ᨢ_����_�����ᨨ_���             [�����_童��_�����ᨨ] := ����_�����ᨨ_���;
  ���ᨢ_����_�����ᨨ_�������_����� [�����_童��_�����ᨨ] := string(����_�����ᨨ_�������_�����);
  ���ᨢ_����_�����ᨨ_���������       [�����_童��_�����ᨨ] := ����_�����ᨨ_���������;
end.
.}
.begin
  �����_童��_�����ᨨ := 0;
  if (t.GetFirst KatSopr where ((������������� == KatSopr.nRec)) = tsOK) {
   if (t.GetFirst SoprHoz where (( KatSopr.VidSopr  == SoprHoz.TipDoc
                               and KatSopr.nRec     == SoprHoz.cSoprDoc
                                )) = tsOK) {
      if (t.GetFirst HozOper where ((SoprHoz.cHozOper == HozOper.nRec))= tsOK) {
       schet_TXO := t.HozOper.Code;
       }
     }
   }
end.
 ��                                                                                                                                                       ���������������������Ŀ��
 ��                                                                                                                                                       �         ���         ���
 ��                                                                                                                                                       ���������������������Ĵ��
 ��                                                                                                                                         ��ଠ �� ���� �                     ���
 ��                                                                                                                                                       ���������������������Ĵ��
 ���࣠������:    ��@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@��    �� ���� �@@@@@@@@@@@@@@@@@@@@@���
 ������������������������������������������������������������������������������������������������������������������������������������������������������������������������������Ĵ��
 �����ࠧ�������:  ��@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@��    �                     ���
 ������������������������������������������������������������������������������������������������������������������������������������������������������������������������������Ĵ��
 ��                                                                                                                              ��� ���⥫쭮�� �� ���� �@@@@@@@@@@@@@@@@@@@@@���
 ��                                                                                                                                               �����������������������������Ĵ��
 ��        �᭮����� ��� ��⠢����� ���:                              �ਪ��,     ���⠭�������,     �ᯮ�殮���                               � ����� �                     ���
 ��                                        ������������������������������������������������������������������������������������������������������������������������������������Ĵ��
 ��                                                                                ���㦭�� ���ભ���                                            � ���  �                     ���
 ��                                                                                                                                               �����������������������������Ĵ��
 ��                                                                                                                                          ��� ����樨 �                     ���
 ��                                                                                                                                                       �������������������������
                                      ����������������������Ŀ
                                      �   �����  �   ���    �              ���������
                                      � ���㬥�⠳��⠢�����             �㪮����⥫�
                                      ����������������������Ĵ
                                  ��� �@@@@@@@@@@� @@@@@@@@@@�      ____________________________
                                      ������������������������                �������������
                            � �������� ����������                ____________   _____________________
                                                                    ��  �������                          ����஢�� ��������

                                                                    "  "________________     �

 ��  �ਧ���� ��������� ����⢠(��稭� ᯨᠭ��): @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ ��
.{
.}
 ������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������Ŀ��
 ���                    �����                                      �  ����.����७��  �            �            ����           �                �                      �                   ���
 ������������������������������������������������������������������������������������Ĵ ������⢮ ����������������������������Ĵ      ����,     �      �⮨�����,      �    �ਬ�砭��     ���
 ���         ������������              �      ���       �   ���   � �����-  � ��� �� � ����(���) � ������ ���� �   ����     �    ��. ���.   �       ��. ���.      �                   ���
 ���                                   �                �����祭�� � ������� �  ����  �            �   (��㪨)    �             �                �                      �                   ���
 ������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������Ĵ��
.{
 ���@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@� @@@@@@@@@@@@@@@�@@@@@@@@@@�&&&&&&&&&�        �&'&&&&&&.&&&�&'&&&&&&&&.&&&�&'&&&&&&&.&&&�&'&&&&&&&&&&&.&&�&'&&&&&&&&&&&&&&&&&.&&�                   ���
.}
 ����������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������
 ��                                                                                                                                         �⮣��&'&&&&&&&&&&&&&&&&&.&&���
 ��                                                                                                                                              ��������������������������
 ���㬬� ᯨᠭ����  ��@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@��

 ���� 童�� �����ᨨ �।�०���� �� �⢥��⢥����� �� �����ᠭ�� ���, ᮤ�ঠ饣� �����, �� ᮮ⢥�����騥 ����⢨⥫쭮��.��

 ���।ᥤ�⥫� �����ᨨ           ��@@@@@@@@@@@@@@@@@@@@@@@@@@@@@��  _____________________  ��@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@��
��                                                                         ���������                                      �������                                  ����஢�� ��������
.{while (�����_童��_�����ᨨ < ������⢮_童���_�����ᨨ)
.begin
  �����_童��_�����ᨨ := �����_童��_�����ᨨ + 1;
end.
 ��@@@@@@@@@@@@@@@                 ��@@@@@@@@@@@@@@@@@@@@@@@@@@@@@��  _____________________  ��@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@��
��                                                                         ���������                                      �������                                  ����஢�� ��������
.}
.{?internal;(������⢮_童���_�����ᨨ = 0)
 ������� �����ᨨ:                 _____________________________  _____________________  __________________________________��
��                                                                         ���������                                      �������                                  ����஢�� ��������
 ��                                _____________________________  _____________________  __________________________________��
��                                                                         ���������                                      �������                                  ����஢�� ��������
.}

 �����ਠ�쭮 �⢥��⢥���� ���  ��@@@@@@@@@@@@@@@@@@@@@@@@��  _____________________  ��@@@@@@@@@@@@@@@@@@@@@@@@@@@@@��
��                                                                         ���������                                      �������                                  ����஢�� ��������

 ��襭�� �㪮����⥫�:
 ���⮨����� ᯨᠭ���� ⮢�� �⭥�� �� ����� ^

.}
.endform
