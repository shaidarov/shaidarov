.Linkform 'reesBvip_OTP_Bank' Prototype is 'reesBvip'
.nameinlist '���᮪ ���㤭���� � ������ "��᪨�" ��� "��� ����" (�:\Omsk\ZkReestr.txt)'
.group '������� �� ����᫥��� � ᡥࡠ��'
.F 'c:\Omsk\ZkReestr.txt'
.var
     Sum_Per_Str: string;
.endvar
.{
.fields
.endfields
.fields
.endFields
.{
.[h OverWrite
.fields
.endFields
.]h
.{
.Begin
   Sum_Per     := Round(Sum_Per,2) 
   Sum_Per_Str := String(Sum_Per);
End.
.fields
! RTabN
! Npp
! NomCard
 FIO
 Sum_Per_Str
 Nom_lsh
! Sum_Sbor
.endFields
^,^,^,,
.}
.[f OverWrite
.fields
.endfields
.]f
.}
.fields
.endFields
.if BrPage
.end
.}
.endForm
!=================================================================================
