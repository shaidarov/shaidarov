��.Linkform 'pechPlVn_02_Tomsk' Prototype is 'pechPlVn'
.nameinlist '������ �ଠ ���⥦��� �������� ��� ���᪠'
.group '13'
.p 60
.var KolList: integer
     SumList: double
     CurPosition: integer
     CP: integer;
     firstHeader: boolean; //����� �� 2- �� 蠯�� ���⠥���
     RItogSum:    double;
     Rsumrub:     string;
     Rsumkop:     string;
     Rsumrubdep:  string;
     Rsumkopdep:  string;
.endvar
.{ PlVedM CheckEnter
.fields
 'true':'s'
  Pred
! poOKPO
 Podr
! KorSchet
 mes1 syear mes1 syear
 strsum
 sumrub   sumkop
 DolgBoss
 nBoss
 nMainBuh
 ���삥�  ��Ⴅ�
 syear
 NomVed
 data
 ��焥��_��⠂�� ���焥��_��⠂��
 'true':'s'
.endfields
.begin  KolList :=1
        SumList :=0
        CurPosition := 0
        end.
.if newP
^
.end

��                                                                                             �����஢����� �ଠ � �-53
                                                                                             �⢥ত��� ���⠭�������� ��᪮����
                                                                                             ���ᨨ �� 05.01.2004 �. �1

                                                                                                                 �����������Ŀ
                                                                                                                 �    ���    �
                                                                                                                 �����������Ĵ
                                                                                                   ��ଠ �� ���� �  0301011  �
                                                                                                                 �����������Ĵ
 ��@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@��  �� ���� �           �
                                          ������������ �࣠����樨                                               �����������Ĵ
 ��@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@��          �           �
                                          ������୮� ���ࠧ�������                                              �����������Ĵ
                                                                                          ����ᯮ������騩 ��� �           �
                                                                                                                 �������������
 ��� ����� ��� ������ � �ப��

 � "   " ��^�� @@@@ ���� �� "   " ��^�� @@@@ ����

 �㬬� ��@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@��
                  �ய����
  (��^�� ��  ��^�� ���)
   ��ࠬ�
  ���㪮����⥫� �࣠����樨�� @~@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@                       @~@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
                            �������������������������������������  �������������������   ����������������������������������������
                                           ���������                   ��筠� �������               ����஢�� ������


  �������� ��壠�����                          @~@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
                     �������������������     ��������������������������������������������������������������
                     ��筠� �������                             ����஢�� ������


                        "@@"  ��^��  @@@@ ����



                                           ����������������������������������������������������Ŀ         ���������������������Ŀ
                                           �    �����  ���㬥��   �      ���   ��⠢�����    �         �  ������ ��ਮ�   �
                                           �                       �                            �         ���������������������Ĵ
                                           �                       �                            �         �     �    �    ��    �
                �� ��������� ��                ����������������������������������������������������Ĵ         ���������������������Ĵ
                �� �����������                 � &~&&&&&&&&&&&&&&&&&&& �         @@@@@@@@@@         �         �@@@@@@@@@@�@@@@@@@@@@�
                                           ������������������������������������������������������         �����������������������



^��
.begin firstheader:= true; end.
.{ PlVedP CheckEnter
.fields
 substr(level, 1, 60)
 KolList
 KolList
 GetStrSummaExt(true, true, SumList)
 DoubleToString(0, SumList)
 Npp TabN FIO
 GetStrSummaExt(true, true, Summa)
 PrizDep
 Fio2
.endfields
.[h OverWrite
.begin KolList := KolList + 1 SumList := 0; end.

�� @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@     ^-� ��࠭�� ��� � �-53
 ������������������������������������������������������������������������������������������������������������������������������������Ŀ
 ������  �  ������� �����   �        �������, ���樠��     �        �㬬�, ��        �      ������� �         �    �ਬ�砭��      �
 �  ��   �                    �                              �                          �      ����祭��         �                    �
 ����浪�                    �                              �                          �    ����� (������       �                    �
 �       �                    �                              �                          �         �              �                    �
 �       �                    �                              �                          �    ������஢����       �                    �
 �       �                    �                              �                          �       �㬬�)           �                    �
 ������������������������������������������������������������������������������������������������������������������������������������Ĵ
 �   1   �         2          �               3              �             4            �          5             �          6         �
 ������������������������������������������������������������������������������������������������������������������������������������Ĵ
.]h
.begin CurPosition:= CurPosition end.
.{?internal; (((isLastInved) and (CurPosition>= 21)) or (CurPosition>= 42))
.begin CP:= CurPosition+ 1; end.
 ��������������������������������������������������������������������������������������������������������������������������������������
  �⮣� �� ����� &&&:                                         &'&&&&&&&&&&&&&&&&&&&&&.&&
  ^��
��.begin
 SumList:=0; end.
.{while  (CP<= 44+ if(firstheader, 0, 1))
.begin inc(cp) end.

.}
.begin firstheader:= false; end.
.}
�� �       �                    �                              �                          �                        �                    ���
.begin
  SumList := SumList + Summa
  CurPosition := CurPosition + 2
end.
�� �&&&&&& �&&&&&&&&&&&&&&&&&&&&�@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@�&'&&&&&&&&&&&&&&&&&&&&&.&&�@~@@@@@@@@@@@@@@@@@@@@@@�  . . . . . . . .   ���
.if secondstrv
.begin inc(CurPosition); end.
�� �       �                    �@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@�                          �                        �                    ���
.end
.[f OverWrite
.begin
 CurPosition:= 0
end.
.]f
.}
.fields
 KolList
 GetStrSummaExt(true, true, SumList)
 DoubleToString(0, SumList)
 GetStrSummaExt(true, true, ItogSum)
 KolList
 PechItogStr
 Rsumrub
 Rsumkop��
�� PechItogDep
 Rsumrubdep
 Rsumkopdep��
 ��nDgn_Ras nFio_Ras
 NomOrder DayOrder MonthOrder YearOrder
 nFio_Chk
 //���삥�2  ��Ⴅ�2 syear2
.endfields
�� ��������������������������������������������������������������������������������������������������������������������������������������
  �⮣� �� ����� &&&:                                         &'&&&&&&&&&&&&&&&&&&&&&.&&
  ^
                                         ����� �� ���������  &'&&&&&&&&&&&&&&&&&&&&&&.&&
                                                                                                               ������⢮ ���⮢ ��&&&��
.begin
  if (PechItog > 0)     // ��������� ���� � �⮣��� �� �㬬�� (�믫�祭�/������஢���)
  begin
    // �믫�祭�
    RItogSum := ItogSum - ItogSumdep // �믫�祭� �� ��������
    var tmpSumItog: string;
    Tmpsumitog := getstrsummaext2(false, false, false, ritogsum)
    var tmpCharItog: string;
    if (trim(sGetTune('NDE.NameKOP')) = '')
      tmpCharItog := '='
    else
      case wGetTune('Fin.Simvol') of
        1: tmpCharItog := '=';
        2: tmpCharItog := '-';
       3: if pos(substr(tmpSumItog, length(tmpSumItog), 1), '0123456789')= 0
            tmpCharItog := '='
          else
            tmpCharItog := '-';
          else
            tmpCharItog := '.';
      end;
   var Position: byte;
   Position := pos(tmpCharItog, tmpsumItog);
   RSumRub := Trim(substr(tmpsumItog, 1, position - 1))  //sumrub
   RSumRub := if(RSumRub = '', '0', RSumRub)             //sumrub
   tmpcharItog := trim(substr(tmpsumItog, position + 1, length(tmpsumItog)));
   RSumkop :=  if(tmpcharItog = '' , '00', tmpcharItog)  //sumkop
   PechItogStr := DoubleToString(0, RItogSum);
   // ��������஢���
   tmpSumItog := GetStrSummaExt2(false, false, false, ItogSumdep);
   if (trim(sGetTune('NDE.NameKOP')) = '')
     tmpCharItog := '='
   else
     case wGetTune('Fin.Simvol') of
       1: tmpCharItog := '=';
       2: tmpCharItog := '-';
       3: if pos(substr(tmpSumItog, length(tmpSumItog), 1), '0123456789')= 0
            tmpCharItog := '='
          else
            tmpCharItog := '-';
          else
            tmpCharItog := '.';
      end;
   Position := pos(tmpCharItog, tmpsumItog);
   RSumRubDep := Trim(substr(tmpsumItog, 1, position - 1))
   RSumRubDep := if(RSumRubDep = '', 0, RSumRubDep)
   tmpcharItog := trim(substr(tmpsumItog, position + 1, length(tmpsumItog)));
   RSumkopDep :=  if(tmpcharItog = '' , '00', tmpcharItog)  //sumkop
   PechItogDep := DoubleToString(0, ItogSumdep);
   end;
   if (PechItog = 0)     // �� ��������� ���� � �⮣��� �� �㬬�� (�믫�祭�/������஢���)
    begin
      RSumRub :=    '                  ';
      RSumkop := '';
      RSumRubDep := '                  ';
      RSumkopDep := '';
      PechItogStr := '';
      PechItogDep := '';
    end;
   end.
 �� �����饩 ���⥦��� ��������
 �믫�祭� �㬬�  ��@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@��
                                   �ய����
 __________________________________________________________________________________________________    (�� ^ �� �� �� ^ �� ���)
                                                                                                             ��ࠬ�
 � ������஢��� �㬬�  ��@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@��
                                   �ய����
 __________________________________________________________________________________________________    (�� ^ �� �� �� ^ �� ���)
                                                                                                             ��ࠬ�

��  �믫��� �ந������   @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@                                @~@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
                    ������������������������������������������         ����������������        �������������������������������������
                                    ���������                           ��筠� �������                  ����஢�� ������

  ���室�� ���ᮢ� �थ� � ��^�� ��  "&&" ��^��  @@@@�.

  ���஢�ਫ ��壠�����                         @~@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
                        ������������������  ��������������������������������������������������������������
                          ��筠� �������                          ����஢�� ������

     "    " ___________________________20      �.��
.} //PlVedM CheckEnter
.endform

�