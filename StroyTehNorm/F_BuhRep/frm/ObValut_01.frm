.LinkForm 'OBVALUT_01_valut' Prototype is 'OBVALUT'
.Group 'obvalut_f1'
.NameInList '������ �� ����� � �⮣��� � ����� � ���'
.p 80
.DEFO PORTRAIT
.var
  Sum_valKor_d:Double
  Sum_valSch_d:Double
  Sum_valItg_d:Double
  Sum_valKor_k:Double
  Sum_valSch_k:Double
  Sum_valItg_k:Double
.endvar
.fields
  CommonFormHeader
  c0p1
  c0p1n
  c0p2
  c0p3
  c1f1
  c2f1
  c2f2
  c0p5
  c0p5
  c3p1
  c3p2
  c3p3
  c3p4
  c3p9
  c3p9r
  c3p10
  c3p10r
  c3p7
  c3p8
  Sum_valKor_d
  c3_p9r
  Sum_valKor_k
  c3_p10r
  Sum_valSch_d
  c2_p9r
  Sum_valSch_k
  c2_p10r
  Sum_valItg_d
  c1_p9r
  Sum_valItg_k
  c1_p10r
.endfields
��^
                       ��������� ����⮢ � ����� �� ����
                ��@@@ : ^��
                               � ��^�� �. �� ��^�� �.
.if OKFILOVALUT
���ਬ���� 䨫���...��
.{
   ^
.{
      ^ ^
.}
.}
.else
.end
.{
.begin
  Sum_valSch_d :=0;
  Sum_valSch_k :=0;
end.

                                                                                                       ���� @np@
����������������������������������������������������������������������������������������������������������������������������������
          �      �����ᯮ�-  �                              ������                                �               �
          ������ ������騩    ���������������������������������������������������������������������Ĵ ������������  �  � � � �
   ���   �����- ������������Ĵ              �����               �             �।��               �               �
          ����� ���� ���-  ���������������������������������������������������������������������Ĵ    ������     �  ������
          �      �     ����  �    � �����    �    � @@@@@@@    �   � �����     �   � @@@@@@      �               �
����������������������������������������������������������������������������������������������������������������������������������

.{
.begin
Sum_valKor_d := 0;
Sum_valKor_k := 0;
end.
.{
@@@@@@@@@@ @@@@@@ @@@@@ @@@@@@ &#'&&&&&&&&&&&&& &#'&&&&&&&&&&&&&& &#'&&&&&&&&&&&&& &#'&&&&&&&&&&&&&& @@@@@@@@@@@@@@@ &#'&&&&&&&&&&
.begin
  Sum_valKor_d := Sum_valKor_d + double(c3p9);
  Sum_valKor_k := Sum_valKor_k + double(c3p10);
end.
.}
���㬬� �� ����. ������        &'&&&&&&&&&&&.&& &'&&&&&&&&&&&&&&& &'&&&&&&&&&&&.&& &'&&&&&&&&&&&&&&&��
����������������������������������������������������������������������������������������������������������������������������������
.begin
  Sum_valSch_d := Sum_valSch_d + Sum_valKor_d;
  Sum_valSch_k := Sum_valSch_k + Sum_valKor_k;
end.
.}
���㬬� �� ����. ����           &'&&&&&&&&&&&.&& &'&&&&&&&&&&&&&&& &'&&&&&&&&&&&.&& &'&&&&&&&&&&&&&&&��
����������������������������������������������������������������������������������������������������������������������������������
.begin
  Sum_valItg_d := Sum_valItg_d + Sum_valSch_d;
  Sum_valItg_k := Sum_valItg_k + Sum_valSch_k;
end.
.}
���⮣� �� ����                 &'&&&&&&&&&&&.&& &'&&&&&&&&&&&&&&& &'&&&&&&&&&&&.&& &'&&&&&&&&&&&&&&&��
����������������������������������������������������������������������������������������������������������������������������������
��壠���
�⢥��⢥��� �� ������
.endform