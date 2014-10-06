!#include REESBVIP.FRM
.Linkform 'reesBvip_reestr' Prototype is 'reesBvip'
.nameinlist 'Реестр в "Омское отделение №8634 Сбербанка России" (с:\Omsk\86345123.k15)'
.group 'Реестры по перечислению в сбербанк'
.F 'c:\Omsk\86345123.k15'
.var
     Summa_Reestr : double;
     Dogovor      : string;
.endvar
.Begin
  Summa_Reestr := 0;
End.
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
  Summa_Reestr := Summa_Reestr + Double(Sum_Per);
End.
.fields
.endFields
.}
.[f OverWrite
.begin
 Dogovor := '5123'
end.
.fields
  XarName Dogovor NPP Summa_Reestr
.endfields
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ @@@@ &&&&&& &&&&&&&&&&&.&&
.]f
.}
.fields
.endFields
.if BrPage
.end
.}
.EndForm

!*************************************************************************
.Linkform 'reesBvip_bank' Prototype is 'reesBvip'
.nameinlist 'Список сотрудников в "Омское отделение №8634 Сбербанка России" (с:\Omsk\86345123.s15)'
.group 'Реестры по перечислению в сбербанк'
.F 'c:\Omsk\86345123.s15'
.var
     Len_FIO : integer;
     Len_Name_Ot : integer;
     Kol_F   : integer;
     Kol_N   : integer;
     Kol_O   : integer;
     F       : string;
     N       : string;
     Name_Ot : string;
     Ot      : string;
     OCB     : string;
     FOCB    : string;
     Kod_Val : string;
     Kod_Vklad : string;
     Slugeb1 : string;
     Slugeb2 : string;
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
  FIO := Trim(FIO);                                     // Удаление пробелов слева и справа от ФИО
  Len_FIO := Length(FIO);                               // Длина ФИО
  Kol_F := Instr(' ',FIO)                               // Длина ФАМИЛИИ
  F := Substr(FIO,1,Kol_F-1);                           // Фамилия
  Name_Ot := Ltrim(Substr(FIO,Kol_F,Len_FIO),' ');      // ИМЯ и ОТЧЕСТВО
  Kol_N := Instr(' ',Name_Ot)                           // Длина ИМЕНИ
  N := Ltrim(Substr(Name_Ot,1,Kol_N-1),' ')             // ИМЯ
  Len_Name_Ot := Length(Name_Ot)                        // Длина ИМЯ и ОТЧЕСТВА
  Ot := Ltrim(Substr(Name_Ot,Kol_N,Len_Name_Ot),' ')    // ОТЧЕСТВО
  NPP := String(NPP)
  OCB :='8634'
  FOCB:='8634'
!  Kod_Vklad := '0'
  Kod_Val   := '810'
  Slugeb1  := '                            '
End.
.fields
NPP
!OCB FOCB
 F N Ot Nom_lsh
!Kod_Vklad
 Sum_Per
 Kod_Val
 SLUGEB1
.endFields
@@@@@@@@@ 86348634                    @@@@@@@@@@@@@@@@@@@@@@@@@@@@@ @@@@@@@@@@@@@@@@@@@@@@@@@@@@@ @@@@@@@@@@@@@@@@@@@@@@@@@@@@@ @@@@@@@@@@@@@@@@@@@@     62      &&&&&&&&&&&&.&&@@@ @@@@@@@@@@@@@@@@@@@@@@@@@@@@@
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
!***********************************************************************************