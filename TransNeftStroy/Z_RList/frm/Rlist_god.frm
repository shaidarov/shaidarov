.LinkForm 'RASLISTR_11_TNS' Prototype is 'RASLISTR'
.Group 'fullone2'
.NameInList '������ �ଠ ���⭮�� ���⪠ ��� �⮣���� �㬬 �� ��� �࠭᭥����ன'
.var
  PeriodStr:String
.endvar
.fields
  CommonFormHeader
  NPred
  PeriodStr
  Podr
  Tabn
  FIO
  ���ࠧ�����⭨��
  N1
  Okl
  Msro
  Koldn
  Kolch
  Kod
  Nopl
  Summaop
  Nachisl
  Neobl
  FondDn
  FondCh
  FaktDn
  FaktCh
  PlanDn
  PlanCh
  PaidDn
  PaidCh
  Msru
  Kodud
  Nudr
  Summaud
  Uder
  str_Dolg1
  Dolg1
  str_Dolg2
  Dolg2
  Msrn
  Kodn
  Nudn
  Summan
  Nenach
  FOT_NALCODE
  FOT_NALNAME
  FOT_NALSUM
.endfields
��^

 �।���⨥ : @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
.{CheckEnter RLISTMAINLOOP
.if CC0R
��������������������������������������������������������������������������������Ŀ
.begin
  if(PDO_PeriodEnding = Date(Last_Day(PDO_PeriodEnding), month(PDO_PeriodEnding), year(PDO_PeriodEnding)))
    PeriodStr :='�� '+Mes+' ����� '+String(God)+' �.'
  else
    PeriodStr :='�� ��ਮ� � '+String(PDO_PeriodBeginning)+' �� '+String(PDO_PeriodEnding)
end.
����ࠧ�. ����.����� �    ������� �.�.      @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ �
�&&&&&&&&&�&&&&&&&&&&� @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@�
��������������������������������������������������������������������������������Ĵ
����ࠧ������� ���㤭��� : @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@�
��������������������������������������������������������������������������������Ĵ
�@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ � ���䭠� �⠢��/����� &#'&&&&&&&&&&�
��������������������������������������������������������������������������������Ĵ
��-泊��.�� � ��ᮢ � ����  ������������ ���� �����(㤥ঠ���)  �  �����         �
��������������������������������������������������������������������������������Ĵ
.{CheckEnter RLISTNACHLOOP
� &&�&#&&&.&�&#&&&&&�&&&&�@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@�&'&&&&&&&&&&&&&&�
.}
�   �       �       �    �                         ���������....�&'&&&&&&&&&&&&&&�
�   �       �       �    �      �����, �� ���������� �������....�&'&&&&&&&&&&&&&&�
�                                               ���� �������....&&.& ��.&&&.&& �.�
�                              ���������� ���������� �������....&&.& ��.&&&.&& �.�
.if CRPLANDAYS
�                                             �������� �����....&&.& ��.&&&.&& �.�
.else
.end
.if CRPAIDDAYS
�                                         ������������ �����....&&.& ��.&&&.&& �.�
.else
.end
.{CheckEnter RLISTUDERLOOP
� &&�       �       �&&&&�@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@�&'&&&&&&&&&&&&&&�
.}
�   �       �       �    �                          ��������....�&'&&&&&&&&&&&&&&�
�   �       �       �    � @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@�&'&&&&&&&&&&&&&&�
�   �       �       �    �                       @@@@@@@@@@@@@@@�&'&&&&&&&&&&&&&&�
����������������������������������������������������������������������������������
.{CheckEnter RLISTNENACHLOOP
� &&�       �       �&&&&�@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@�&'&&&&&&&&&&&&&&�
.}
.if NENER
�   �       �       �    �                ������������� �����...�&'&&&&&&&&&&&&&&�
����������������������������������������������������������������������������������
.else
.end
.if CNALOGFOT
��������������������������������������������������������������������������������Ŀ
� ����� ������  ������������ ������                               �㬬� ������   �
.{CheckEnter FOTLOOP
�   @@@@@@@     @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@  &'&&&&&&&&&&&&&&�
.}
����������������������������������������������������������������������������������
.else
.end
.{CheckEnter BELARUS
.if VYCHMES
.else
.end
.if VYCHYEAR
.else
.end
.}
.{CheckEnter YEARTOTALS
.if FIELDSPENS
.else
.end
.if PRINTMATPODAR
.if PRINTMAT
.else
.end
.if PRINTPODAR
.else
.end
.{CheckEnter TABHELPLOOP
.}
.else
.end
.if PRINTSUMNEOBLAG
.else
.end
.}
.if PRINTESN
.{CheckEnter ESNLOOP
.}
.else
.end
.if CC4R
.{CheckEnter NEJAV
.}
.else
.end
----------------------------------------------------------------------------------
.else
.end
.}��

.endform
