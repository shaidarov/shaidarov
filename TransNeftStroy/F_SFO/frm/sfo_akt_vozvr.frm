.LinkForm 'SFORETURNQWEQWEWE' Prototype is 'SFO_ACT'
.Group '��室��� ���������'
.NameInList '���. ��� �� ������ ᯥ殤����'
.var
  Npp:Double
  totSum:Double
.endvar
.fields
  CommonFormHeader
  ActNo
  DateToStr( dDate, 'DD')
  DateToStr( dDate, 'Mon')
  DateToStr( dDate, 'YYYY')
  FIO+' (⠡���� �����: '+TABN+')'
  toPodr
  toMol
  Npp
  sfKod
  sfName
  Ed
  KolVo
  Price
  Price * KolVo * if ( wGetTune( 'Fin.MBP.OstStoim') = 0, 1, 1 - PercNach/100)
  percNach
  totSum
  FIO
  toMol
.endfields
.{CheckEnter SFONXTACT
.begin
  Npp := 0; totSum := 0;
end.
  ^

           ��             ��� �� ������ ᯥ殤���� �� �ᯮ�짮����� � ^��
                             "^" ^ ^ �.

  ����㤭��     : @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
  ���ࠧ������� : @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
  ���           : @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
��
�������������������������������������������������������������������������������������������������������������������������������������Ŀ
� � � ���������. �                 ������������ ᯥ殤����             �  ������  � ������⢮ �     ����      �    �㬬�    � ����� �
��/��   �����    �                                                     � ����७�� �            �               �             �   %   �
�������������������������������������������������������������������������������������������������������������������������������������Ĵ
.{CheckEnter SPCSFOACT
.begin
  Npp := Npp + 1;
  totSum := totSum + Price * KolVo * if ( wGetTune( 'Fin.MBP.OstStoim') = 0, 1, 1 - PercNach/100);
end.
�&&&�@@@@@@@@@@@@�@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@�@@@@@@@@@@@�&#&&&&&&&.&&�&#'&&&&&&&&&.&&�&#'&&&&&&&.&&�&&&&.&&�
.}
�����������������������������������������������������������������������������������������������������������������������������������������
��  �⮣� :                                                                                         &#'&&&&&&&&.&&��


  ����   _________________ ^


  �ਭ� _________________ ^
.}
.endform
