.Form 'Proverka_Lschet'
.ard
.group 'Зарплата'
.NameInList 'Проверка данных в лицевых счетах'
.F 'Proverka_Lschet.Out'
.p 80
.var
    FIO_                :String;       // Фамилия
    Nrec_Lschet         :Comp;         //
    Tabn_Lschet         :String;       // Таб. № в лицевом счете (Lschet.dat)
    Param_Lschet        :String;       // Параметр
    tPerson_Lschet      :comp;         // Ссылка на Persons
    Cex_Lschet          :comp;         // Подразделение
    Kau_Lschet          :comp;         // КАУ
    cAppoint_Lschet     :comp;         // Должность
    Tarif_Lschet        :double;       // Сумма Оклада/ЧТС
    Kolmokl_Lschet      :double;       // Количество льгот на работника
    Sisopl_Lschet       :word;         // Система оплаты
    Rejim_Lschet        :word;         // Режим работы
    Kateg_Lschet        :word;         // Категория
    Datpos_Lschet       :date;         // Дата поступления
    BornDate_Persons    :date;         // Дата рождения
    StraxNom_Persons    :String;       // Страховой номер
    Sex_Persons         :char;         // Пол
    cSchetd_Lschet      :String;       // Дебет счета в лицевом счете (Lschet.dat)
    cSubschd_Lschet     :String;       // Субсчет Дебета счета в лицевом счете (Lschet.dat)
    N                   :integer;      //
    K                   :integer;      //
    cur_m               :word;         // месяц
    cur_y               :integer;      // год
    xMes                :word;         // месяц
    xGod                :integer;      // текущий год
    Mes                 :string;       // текущий месяц
    Mes_Lschet          :word;         // месяц за который
    God_Lschet          :integer;      // год за который начислено
    Data_otch           :date;         // Дата отчетного периода
    Lschet_Priem        :date;
    Persons_Priem       :date;
    Lschet_Uvol        :date;
    Persons_Uvol       :date;
.endvar
.Create view v1_Param        // Проверка параметра
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
.Create view v1_Cex          // Проверка подразделения
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
.Create view v1_Sisopl          // Проверка системы оплаты (Оклад/Повременно/Сдельно)
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
.Create view v1_cSchetd        // Проверка Дебета счета
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
.Create view v1_Kau            // Проверка KAУ счета
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
.Create view v1_Tarif            // Проверка суммы Оклада/ЧТС
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
.Create view v1_KolMokl            // Проверка кол-ва льгот на себя
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
.Create view v1_Rejim            // Проверка режима работы
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
.Create view v1_DatPos            // Проверка даты приема
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
.Create view v1_cAppoint            // Проверка должности
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
.Create view v1_Kateg            // Проверка категории
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
.Create view v1_Profs            // Проверка профсоюза
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
!.Create view v1_Pens            // Проверка пенсии
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
.Create view v1_Shtraf            // Удержание в банк
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
.Create view v1_Lschet            // Лицевые счета
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
.Create view v1_Priem            // Сравнение даты приема в Лицевом счете и Картотеке
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
.Create view v1_Uvol            // Сравнение даты увольнения в Лицевом счете и Картотеке
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
.Create view v1_Borndate            // Проверка даты рождения
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
.Create view v1_Sex            // Проверка пола
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
     and  (Persons.Sex <> 'М' or  Persons.Sex <> 'Ж')
    order external Lschet.tabn
               ;
.Create view v1_StraxNom            // Проверка страхового номера
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
.procedure _datem(var _m : word; // Определение даты
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
         1:Mes :='январь'   ;
         2:Mes :='февраль'  ;
         3:Mes :='март'     ;
         4:Mes :='апрель'   ;
         5:Mes :='май'      ;
         6:Mes :='июнь'     ;
         7:Mes :='июль'     ;
         8:Mes :='август'   ;
         9:Mes :='сентябрь' ;
        10:Mes :='октябрь'  ;
        11:Mes :='ноябрь'   ;
        12:Mes :='декабрь'  ;
   end;
end.
.fields
  Mes
  xGod
.endfields

          Отчет по  проверке данных в лицевых счетах
                за   Б@@@@@@@@ Б  месяц   Б@@@@ Б г.

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
                            ЕНет "ПАРАМЕТРА" Е

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

 Б                            ДНет "Подразделения" Е

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

 Б                            ДНет "Системы оплаты" Е

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

 Б                            ДНет "Счета" Е

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

 Б                            ДНет "КАУ" Е

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

 Б                            ДНет "Размера оклада/ЧТС" Е

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

 Б                            ДНет "Одной минималки на работника" Е

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

 Б                            ДНет "Режима работы" Е

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

 Б                            ДНет "Даты ПРИЕМА" Е

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

 Б                            ДНет "Должности" Е

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

 Б                            ДНет "Категории" Е

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

 Б                            ДНет "Профсоюза" Е

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
! Б                            ДНет "Пенсии" Е
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

                     ЕДата Приема в Л/Счете не равна дате в Картотеке Е
                    
                 Л/Счет             Картотека 
 
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

                     ЕДата Увольнения в л/с не равна дате в картотеке Е

                 Л/Счет             Картотека  

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

 Б                            ДНет "Удержания в банк" Е

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
   Б!!! Б   Е"Нет Даты рождения" Е Таб. ном. &&&&&&&&
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
   Б!!! Б  ЕНет "Пола Ж или М" Е Таб. ном. &&&&&&&&
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
   Б!!! Б  ЕНет "Страхового номера" Е Таб. ном. &&&&&&&&
------------------------------------------------------------------------------------
.}
.}
!*****************************************************************************
.Endform
