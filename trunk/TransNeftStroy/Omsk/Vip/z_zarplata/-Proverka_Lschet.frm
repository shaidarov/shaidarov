.Form 'Proverka_Lschet'
.ard
.group '��௫��'
.NameInList '�஢�ઠ ������ � ��楢�� ����'
.F 'Proverka_Lschet.Out'
.p 80
.var
    FIO_                :String;       // �������
    Nrec_Lschet         :Comp;         //
    Tabn_Lschet         :String;       // ���. � � ��楢�� ��� (Lschet.dat)
    Param_Lschet        :String;       // ��ࠬ���
    tPerson_Lschet      :comp;         // ��뫪� �� Persons
    Cex_Lschet          :comp;         // ���ࠧ�������
    Kau_Lschet          :comp;         // ���
    cAppoint_Lschet     :comp;         // ���������
    Tarif_Lschet        :double;       // �㬬� ������/���
    Kolmokl_Lschet      :double;       // ������⢮ �죮� �� ࠡ�⭨��
    Sisopl_Lschet       :word;         // ���⥬� ������
    Rejim_Lschet        :word;         // ����� ࠡ���
    Kateg_Lschet        :word;         // ��⥣���
    Datpos_Lschet       :date;         // ��� ����㯫����
    BornDate_Persons    :date;         // ��� ஦�����
    StraxNom_Persons    :String;       // ���客�� �����
    Sex_Persons         :char;         // ���
    cSchetd_Lschet      :String;       // ����� ��� � ��楢�� ��� (Lschet.dat)
    cSubschd_Lschet     :String;       // ����� ����� ��� � ��楢�� ��� (Lschet.dat)
    N                   :integer;      //
    K                   :integer;      //
    cur_m               :word;         // �����
    cur_y               :integer;      // ���
    xMes                :word;         // �����
    xGod                :integer;      // ⥪�騩 ���
    Mes                 :string;       // ⥪�騩 �����
    Mes_Lschet          :word;         // ����� �� �����
    God_Lschet          :integer;      // ��� �� ����� ���᫥��
    Data_otch           :date;         // ��� ���⭮�� ��ਮ��
    Lschet_Priem        :date;
    Persons_Priem       :date;
    Lschet_Uvol        :date;
    Persons_Uvol       :date;
.endvar
.Create view v1_Param        // �஢�ઠ ��ࠬ���
      as select
           Lschet.*,
           Persons.*
        from
       LSchet,Persons
            where
              ((
     Lschet.tPerson    ==   Persons.Nrec
              ))
     and    (Lschet.Datuv = Date(0,0,0) or Lschet.Datuv >= Data_otch)  
     and    Lschet.Param = ''
    order external Lschet.tabn
               ;
.Create view v1_Cex          // �஢�ઠ ���ࠧ�������
       as select
        Lschet.*,
        Persons.*
          from
        LSchet,Persons
             where
              ((
     Lschet.tPerson    ==   Persons.Nrec
              ))
     and    (Lschet.Datuv = Date(0,0,0) or Lschet.Datuv >= Data_otch)  
     and   Lschet.Cex   = 0
    order external Lschet.tabn
               ;
.Create view v1_Sisopl          // �஢�ઠ ��⥬� ������ (�����/���६����/����쭮)
       as select
        Lschet.*,
        Persons.*
          from
        LSchet,Persons
             where
              ((
     Lschet.tPerson    ==   Persons.Nrec
              ))
     and    (Lschet.Datuv = Date(0,0,0) or Lschet.Datuv >= Data_otch)  
     and   Lschet.Sisopl = 0
    order external Lschet.tabn
               ;
.Create view v1_cSchetd        // �஢�ઠ ����� ���
       as select
        Lschet.*,
        Persons.*
          from
        LSchet,Persons
             where
              ((
     Lschet.tPerson    ==   Persons.Nrec
              ))
     and    (Lschet.Datuv = Date(0,0,0) or Lschet.Datuv >= Data_otch)  
     and   Lschet.cSchetd  = ''
    order external Lschet.tabn
               ;
.Create view v1_Kau            // �஢�ઠ KA� ���
       as select
        Lschet.*,
        Persons.*
          from
        LSchet,Persons
             where
              ((
     Lschet.tPerson    ==   Persons.Nrec
              ))
     and    (Lschet.Datuv = Date(0,0,0) or Lschet.Datuv >= Data_otch)  
     and   (Lschet.TBLD[1] = 0 and Lschet.Tbld[2] = 0)
    order external Lschet.tabn
               ;
.Create view v1_Tarif            // �஢�ઠ �㬬� ������/���
       as select
        Lschet.*,
        Persons.*
          from
        LSchet,Persons
             where
              ((
     Lschet.tPerson    ==   Persons.Nrec
              ))
     and    (Lschet.Datuv = Date(0,0,0) or Lschet.Datuv >= Data_otch)  
     and   Lschet.Tarif    = 0
    order external Lschet.tabn
               ;
.Create view v1_KolMokl            // �஢�ઠ ���-�� �죮� �� ᥡ�
       as select
        Lschet.*,
        Persons.*
          from
        LSchet,Persons
             where
              ((
     Lschet.tPerson    ==   Persons.Nrec
              ))
     and    (Lschet.Datuv = Date(0,0,0) or Lschet.Datuv >= Data_otch)  
     and   Lschet.KolMokl  = 0
    order external Lschet.tabn
               ;
.Create view v1_Rejim            // �஢�ઠ ०��� ࠡ���
       as select
        Lschet.*,
        Persons.*
          from
        LSchet,Persons
             where
              ((
     Lschet.tPerson    ==   Persons.Nrec
              ))
     and    (Lschet.Datuv = Date(0,0,0) or Lschet.Datuv >= Data_otch)  
     and   Lschet.Rejim  = 0
    order external Lschet.tabn
               ;
.Create view v1_DatPos            // �஢�ઠ ���� �ਥ��
       as select
        Lschet.*,
        Persons.*
          from
        LSchet,Persons
             where
              ((
     Lschet.tPerson    ==   Persons.Nrec
              ))
     and    (Lschet.Datuv = Date(0,0,0) or Lschet.Datuv >= Data_otch)  
     and   Lschet.Datpos = Date(0,0,0)
    order external Lschet.tabn
               ;
.Create view v1_cAppoint            // �஢�ઠ ��������
       as select
        Lschet.*,
        Persons.*
          from
        LSchet,Persons
             where
              ((
     Lschet.tPerson    ==   Persons.Nrec
              ))
     and    (Lschet.Datuv = Date(0,0,0) or Lschet.Datuv >= Data_otch)  
     and   Lschet.cAppoint = 0
    order external Lschet.tabn
               ;
.Create view v1_Kateg            // �஢�ઠ ��⥣�ਨ
       as select
        Lschet.*,
        Persons.*
          from
        LSchet,Persons
             where
              ((
     Lschet.tPerson    ==   Persons.Nrec
              ))
     and    (Lschet.Datuv = Date(0,0,0) or Lschet.Datuv >= Data_otch)  
     and   Lschet.Kateg  = 0
    order external Lschet.tabn
               ;
.Create view v1_Profs            // �஢�ઠ ����
       as select
        Lschet.*,
        Persons.*
          from
        LSchet,Persons
             where
              ((
     Lschet.tPerson    ==   Persons.Nrec
              ))
     and    (Lschet.Datuv = Date(0,0,0) or Lschet.Datuv >= Data_otch)  
     and   Lschet.Profs  = '-'
    order external Lschet.tabn
               ;
!.Create view v1_Pens            // �஢�ઠ ���ᨨ
!       as select
!        Lschet.*,
!        Persons.*
!          from
!        LSchet,Persons
!             where
!              ((
!     Lschet.tPerson    ==   Persons.Nrec
!              ))
!     and    (Lschet.Datuv = Date(0,0,0) or Lschet.Datuv >= Data_otch)  
!     and   Lschet.Pens   = '-'
!    order external Lschet.tabn
!               ;
.Create view v1_Shtraf            // ���ঠ��� � ����
       as select
        Lschet.*,
        Shtraf.*
          from
        Lschet,
        Shtraf
             where
              ((
     Shtraf.cLsch    ==   Lschet.Nrec
              ))
    and    (Lschet.Datuv = Date(0,0,0) or Lschet.Datuv >= Data_otch)  
    and   Shtraf.Vidud  = 221
    and   Shtraf.cLsch  = Nrec_Lschet
               ;
.Create view v1_Lschet            // ��楢� ���
       as select
        Lschet.*,
        Persons.*
          from
        LSchet,Persons
             where
              ((
     Lschet.tPerson    ==   Persons.Nrec
              ))
     and    (Lschet.Datuv = Date(0,0,0) or Lschet.Datuv >= Data_otch)  
    order external Lschet.tabn
               ;
.Create view v1_Priem            // �ࠢ����� ���� �ਥ�� � ��楢�� ��� � ����⥪�
       as select
        Lschet.*,
        Persons.*
          from
        LSchet,Persons
             where
              ((
     Lschet.tPerson    ==   Persons.Nrec
              ))
    and Lschet.DatPos <> Persons.AppDate
    order external Lschet.tabn
               ;
.Create view v1_Uvol            // �ࠢ����� ���� 㢮�쭥��� � ��楢�� ��� � ����⥪�
       as select
        Lschet.*,
        Persons.*
          from
        LSchet,Persons
             where
              ((
     Lschet.tPerson    ==   Persons.Nrec
              ))
    and Lschet.DatUv <> Persons.DisDate
    order external Lschet.tabn
               ;
.Create view v1_Borndate            // �஢�ઠ ���� ஦�����
       as select
        Lschet.*,
        Persons.*
          from
        LSchet,Persons
             where
              ((
     Lschet.tPerson    ==   Persons.Nrec
              ))
!     and   Lschet.Datuv     = Date(0,0,0)
     and   Persons.Disdate   = Date(0,0,0)
     and   Persons.Borndate = Date(0,0,0)
    order external Lschet.tabn
               ;
.Create view v1_Sex            // �஢�ઠ ����
       as select
        Lschet.*,
        Persons.*
          from
        LSchet,Persons
             where
              ((
     Lschet.tPerson    ==   Persons.Nrec
              ))
     and   Persons.Disdate   = Date(0,0,0)
!     and   Lschet.Datuv     = Date(0,0,0)
     and  (Persons.Sex <> '�' or  Persons.Sex <> '�')
    order external Lschet.tabn
               ;
.Create view v1_StraxNom            // �஢�ઠ ���客��� �����
 as select
    Passports.*,
    Persons.*
   from
 Passports,Persons
   where
              ((
     Passports.Person    ==   Persons.Nrec
               ))
     and  Passports.NMB = ''  and Passports.Syscode=501
              ;
!-------------------------------------------------------------
.procedure _datem(var _m : word; // ��।������ ����
  var _y : integer);
begin
 Data_otch:=dGetTune('up.datotch');
     _m:=month(Data_otch);
     _y:=year(Data_otch);
end.
.begin
    _datem (cur_m,cur_y);
   xMes  := cur_m;
   xGod  := cur_y;
    Case xMes of
         1:Mes :='ﭢ���'   ;
         2:Mes :='䥢ࠫ�'  ;
         3:Mes :='����'     ;
         4:Mes :='��५�'   ;
         5:Mes :='���'      ;
         6:Mes :='���'     ;
         7:Mes :='���'     ;
         8:Mes :='������'   ;
         9:Mes :='ᥭ����' ;
        10:Mes :='������'  ;
        11:Mes :='�����'   ;
        12:Mes :='�������'  ;
   end;
end.
.fields
  Mes
  xGod
.endfields

          ���� ��  �஢�થ ������ � ��楢�� ����
                ��  ��@@@@@@@@��  �����  ��@@@@�� �.

!*****************************************************************************
.begin
          N:=1;
end.
.{table 'v1_Param';
.begin
            Tabn_Lschet   := String(v1_Param.Lschet.Tabn);
            FIO_          := v1_Param.Persons.FIO;
end.
.{?internal;N=1
.begin
          N:=0;
end.
                           ����� "���������"��

.}
.fields
  Tabn_Lschet
  FIO_
.endfields
       @@@@@   ^
.}
!*****************************************************************************
.begin
          N:=1;
end.
.{table 'v1_Cex';
.begin
            Tabn_Lschet   := String(v1_Cex.Lschet.Tabn);
            FIO_          := v1_Cex.Persons.FIO;
end.
.{?internal;N=1
.begin
          N:=0;
end.

��                           ����� "���ࠧ�������"��

.}
.fields
  Tabn_Lschet
  FIO_
.endfields
       @@@@@   ^
.}
!*****************************************************************************
.begin
          N:=1;
end.
.{table 'v1_Sisopl';
.begin
            Tabn_Lschet   := String(v1_Sisopl.Lschet.Tabn);
            FIO_          := v1_Sisopl.Persons.FIO;
end.
.{?internal;N=1
.begin
          N:=0;
end.

��                           ����� "���⥬� ������"��

.}
.fields
  Tabn_Lschet
  FIO_
.endfields
       @@@@@   ^
.}
!*****************************************************************************
.begin
          N:=1;
end.
.{table 'v1_cSchetd';
.begin
            Tabn_Lschet   := String(v1_cSchetd.Lschet.Tabn);
            FIO_          := v1_cSchetd.Persons.FIO;
end.
.{?internal;N=1
.begin
          N:=0;
end.

��                           ����� "���"��

.}
.fields
  Tabn_Lschet
  FIO_
.endfields
       @@@@@   ^
.}
!*****************************************************************************
.begin
          N:=1;
end.
.{table 'v1_Kau';
.begin
            Tabn_Lschet   := String(v1_Kau.Lschet.Tabn);
            FIO_          := v1_Kau.Persons.FIO;
end.
.{?internal;N=1
.begin
          N:=0;
end.

��                           ����� "���"��

.}
.fields
  Tabn_Lschet
  FIO_
.endfields
       @@@@@   ^
.}
!*****************************************************************************
.begin
          N:=1;
end.
.{table 'v1_Tarif';
.begin
            Tabn_Lschet   := String(v1_Tarif.Lschet.Tabn);
            FIO_          := v1_Tarif.Persons.FIO;
            Lschet_Priem  := v1_Tarif.Lschet.DatPos;
end.
.{?internal;N=1
.begin
          N:=0;
end.

��                           ����� "������ ������/���"��

.}
.fields
  Tabn_Lschet
  Lschet_Priem
  FIO_
.endfields
       @@@@@   ^ ^
.}
!*****************************************************************************
.begin
          N:=1;
end.
.{table 'v1_KolMokl';
.begin
            Tabn_Lschet   := String(v1_KolMokl.Lschet.Tabn);
            FIO_          := v1_KolMokl.Persons.FIO;
end.
.{?internal;N=1
.begin
          N:=0;
end.

��                           ����� "����� ��������� �� ࠡ�⭨��"��

.}
.fields
  Tabn_Lschet
  FIO_
.endfields
       @@@@@   ^
.}
!*****************************************************************************
.begin
          N:=1;
end.
.{table 'v1_Rejim';
.begin
            Tabn_Lschet   := String(v1_Rejim.Lschet.Tabn);
            FIO_          := v1_Rejim.Persons.FIO;
end.
.{?internal;N=1
.begin
          N:=0;
end.

��                           ����� "������ ࠡ���"��

.}
.fields
  Tabn_Lschet
  FIO_
.endfields
       @@@@@   ^
.}
!*****************************************************************************
.begin
          N:=1;
end.
.{table 'v1_DatPos';
.begin
            Tabn_Lschet   := String(v1_DatPos.Lschet.Tabn);
            FIO_          := v1_DatPos.Persons.FIO;
end.
.{?internal;N=1
.begin
          N:=0;
end.

��                           ����� "���� ������"��

.}
.fields
  Tabn_Lschet
  FIO_
.endfields
       @@@@@   ^
.}
!*****************************************************************************
.begin
          N:=1;
end.
.{table 'v1_cAppoint';
.begin
            Tabn_Lschet   := String(v1_cAppoint.Lschet.Tabn);
            FIO_          := v1_cAppoint.Persons.FIO;
end.
.{?internal;N=1
.begin
          N:=0;
end.

��                           ����� "��������"��

.}
.fields
  Tabn_Lschet
  FIO_
.endfields
       @@@@@   ^
.}
!*****************************************************************************
.begin
          N:=1;
end.
.{table 'v1_Kateg';
.begin
            Tabn_Lschet   := String(v1_Kateg.Lschet.Tabn);
            FIO_          := v1_Kateg.Persons.FIO;
end.
.{?internal;N=1
.begin
          N:=0;
end.

��                           ����� "��⥣�ਨ"��

.}
.fields
  Tabn_Lschet
  FIO_
.endfields
       @@@@@   ^
.}
!*****************************************************************************
.begin
          N:=1;
end.
.{table 'v1_Profs';
.begin
            Tabn_Lschet   := String(v1_Profs.Lschet.Tabn);
            FIO_          := v1_Profs.Persons.FIO;
end.
.{?internal;N=1
.begin
          N:=0;
end.

��                           ����� "����"��

.}
.fields
  Tabn_Lschet
  FIO_
.endfields
       @@@@@   ^
.}
!*****************************************************************************
.begin
          N:=1;
end.
!.{table 'v1_Pens';
!.begin
!            Tabn_Lschet   := String(v1_Pens.Lschet.Tabn);
!            FIO_          := v1_Pens.Persons.FIO;
!end.
!.{?internal;N=1
!.begin
!          N:=0;
!
!end.
!
!��                           ����� "���ᨨ"��
!
!.}
!.fields
!  Tabn_Lschet
!  FIO_
!.endfields
!       @@@@@   ^
!.}
!*****************************************************************************
.begin
          N:=1;
end.
.{table 'v1_Priem';
.begin
            Tabn_Lschet   := String(v1_Priem.Lschet.Tabn);
            FIO_          := v1_Priem.Persons.FIO;
            Lschet_Priem  := v1_Priem.Lschet.DatPos;
            Persons_Priem := v1_Priem.Persons.AppDate;
end.
.{?internal;N=1
.begin
          N:=0;

end.

                    ����� �ਥ�� � �/��� �� ࠢ�� ��� � ����⥪���
                    
                 �/���             ����⥪� 
 
.}
.fields
  Tabn_Lschet
  Lschet_Priem
  Persons_Priem
  FIO_
.endfields
       ^        ^         ^         ^
.}
!*****************************************************************************
.begin
          N:=1;
end.
.{table 'v1_Uvol';
.begin
            Tabn_Lschet   := String(v1_Uvol.Lschet.Tabn);
            FIO_          := v1_Uvol.Persons.FIO;
            Lschet_Uvol   := v1_Uvol.Lschet.DatUv;
            Persons_Uvol  := v1_Uvol.Persons.DisDate;
end.
.{?internal;N=1
.begin
          N:=0;

end.

                    ����� ����쭥��� � �/� �� ࠢ�� ��� � ����⥪���

                 �/���             ����⥪�  

.}
.fields
  Tabn_Lschet
  Lschet_Uvol
  Persons_Uvol
  FIO_
.endfields
       ^        ^         ^         ^
.}
!*****************************************************************************

��                           ����� "���ঠ��� � ����"��

.{table 'v1_Lschet';
.begin
!         IF (v1_Lschet.GetFirst Lschet = 0)
!                       {
            Nrec_Lschet   := v1_Lschet.Lschet.Nrec;
            Tabn_Lschet   := String(v1_Lschet.Lschet.Tabn);
            FIO_          := v1_Lschet.Persons.FIO;
!                      }
                  N := 1;
         IF (v1_Shtraf.GetFirst Shtraf = 0)
                  {
              N := 0;
                  }

end.
.{?internal;N=1
.fields
  Tabn_Lschet
  FIO_
.endfields
       @@@@@   ^
.}
.}
!*****************************************************************************
!*****************************************************************************
!*****************************************************************************
.{table 'v1_BornDate';
.begin
            BornDate_Persons  := v1_BornDate.Persons.BornDate;
            Tabn_Lschet       := String(v1_BornDate.Lschet.Tabn);
end.
.{?internal;(BornDate_Persons = Date(0,0,0) and Tabn_Lschet <> '')
.fields
  Tabn_Lschet
.endfields
  ��!!!��  ��"��� ���� ஦�����"�� ���. ���. &&&&&&&&
------------------------------------------------------------------------------------
.}
.}
!!*****************************************************************************
.{table 'v1_Sex';
.begin
            Sex_Persons  := v1_Sex.Persons.Sex;

                 N := Integer(Length(Sex_Persons));
                 Tabn_Lschet   := String(v1_Sex.Lschet.Tabn);
end.
.{?internal;(N=0 and Tabn_Lschet <> '')
.fields
  Tabn_Lschet             
.endfields
  ��!!!�� ����� "���� � ��� �"�� ���. ���. &&&&&&&&
-----------------------------------------------------------------------------------
.}
.}
!*****************************************************************************
.{table 'v1_StraxNom';
.begin
            StraxNom_Persons  := v1_StraxNom.Passports.NMB;

                 N := Integer(Length(StraxNom_Persons));
                 Tabn_Lschet   := String(v1_StraxNom.Persons.Tabnmb);
end.
.{?internal;(N=0 and Tabn_Lschet <> '')
.fields
  Tabn_Lschet
.endfields
  ��!!!�� ����� "���客��� �����"�� ���. ���. &&&&&&&&
------------------------------------------------------------------------------------
.}
.}
!*****************************************************************************
.Endform
