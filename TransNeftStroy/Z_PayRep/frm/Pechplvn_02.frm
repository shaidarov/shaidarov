 И.Linkform 'pechPlVn_02_Tomsk' Prototype is 'pechPlVn'
.nameinlist 'Полная форма платежной ведомости для Томска'
.group '13'
.p 60
.var KolList: integer
     SumList: double
     CurPosition: integer
     CP: integer;
     firstHeader: boolean; //какая из 2- ух шапок печатается
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
 ДеньВед  МесВед
 syear
 NomVed
 data
 НачДень_ДатаВед КончДень_ДатаВед
 'true':'s'
.endfields
.begin  KolList :=1
        SumList :=0
        CurPosition := 0
        end.
.if newP
^
.end

 Р                                                                                             Унифицированная форма № Т-53
                                                                                             Утверждена Постановлением Госкомстата
                                                                                             России от 05.01.2004 г. №1

                                                                                                                 ┌───────────┐
                                                                                                                 │    Код    │
                                                                                                                 ├───────────┤
                                                                                                   Форма по ОКУД │  0301011  │
                                                                                                                 ├───────────┤
  Д@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ Д  по ОКПО │           │
                                          наименование организации                                               ├───────────┤
  Д@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ Д          │           │
                                          структурное подразделение                                              ├───────────┤
                                                                                          Корреспондирующий счет │           │
                                                                                                                 └───────────┘
  БВ кассу для оплаты в срок Б

 с "   "  Д^ Д @@@@ года по "   "  Д^ Д @@@@ года

 Сумма  Д@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ Д
                  прописью
  ( Д^ Д руб   Д^ Д коп)
   цифрами
   БРуководитель организации Б @~@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@                       @~@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
                            ─────────────────────────────────────  ───────────────────   ────────────────────────────────────────
                                           должность                   личная подпись               расшифровка подписи


   БГлавный бухгалтер Б                          @~@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
                     ───────────────────     ──────────────────────────────────────────────────────────────
                     личная подпись                             расшифровка подписи


                        "@@"   Д^ Д  @@@@ года



                                           ┌───────────────────────┬────────────────────────────┐         ┌─────────────────────┐
                                           │    Номер  документа   │      Дата   составления    │         │  Расчетный период   │
                                           │                       │                            │         ├──────────┬──────────┤
                                           │                       │                            │         │     с    │    по    │
                 Б ПЛАТЕЖНАЯ  Б                ├───────────────────────┼────────────────────────────┤         ├──────────┼──────────┤
                 Б ВЕДОМОСТЬ Б                 │ &~&&&&&&&&&&&&&&&&&&& │         @@@@@@@@@@         │         │@@@@@@@@@@│@@@@@@@@@@│
                                           └───────────────────────┴────────────────────────────┘         └──────────┴──────────┘



^ Р
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

 Р @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@     ^-я страница формы № Т-53
 ┌───────┬────────────────────┬──────────────────────────────┬──────────────────────────┬────────────────────────┬────────────────────┐
 │Номер  │  Табельный номер   │        Фамилия, инициалы     │        Сумма, руб        │      Подпись в         │    Примечание      │
 │  по   │                    │                              │                          │      получении         │                    │
 │порядку│                    │                              │                          │    денег (запись       │                    │
 │       │                    │                              │                          │         о              │                    │
 │       │                    │                              │                          │    депонировании       │                    │
 │       │                    │                              │                          │       суммы)           │                    │
 ├───────┼────────────────────┼──────────────────────────────┼──────────────────────────┼────────────────────────┼────────────────────┤
 │   1   │         2          │               3              │             4            │          5             │          6         │
 ├───────┼────────────────────┼──────────────────────────────┼──────────────────────────┼────────────────────────┼────────────────────┤
.]h
.begin CurPosition:= CurPosition end.
.{?internal; (((isLastInved) and (CurPosition>= 21)) or (CurPosition>= 42))
.begin CP:= CurPosition+ 1; end.
 └───────┴────────────────────┴──────────────────────────────┴──────────────────────────┴────────────────────────┴────────────────────┘
  Итого по листу &&&:                                         &'&&&&&&&&&&&&&&&&&&&&&.&&
  ^ Ш
 И.begin
 SumList:=0; end.
.{while  (CP<= 44+ if(firstheader, 0, 1))
.begin inc(cp) end.

.}
.begin firstheader:= false; end.
.}
 Р │       │                    │                              │                          │                        │                    │ Р
.begin
  SumList := SumList + Summa
  CurPosition := CurPosition + 2
end.
 Р │&&&&&& │&&&&&&&&&&&&&&&&&&&&│@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@│&'&&&&&&&&&&&&&&&&&&&&&.&&│@~@@@@@@@@@@@@@@@@@@@@@@│  . . . . . . . .   │ Р
.if secondstrv
.begin inc(CurPosition); end.
 Р │       │                    │@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@│                          │                        │                    │ Р
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
 Rsumkop И
 И PechItogDep
 Rsumrubdep
 Rsumkopdep И
  ИnDgn_Ras nFio_Ras
 NomOrder DayOrder MonthOrder YearOrder
 nFio_Chk
 //ДеньВед2  МесВед2 syear2
.endfields
 Р └───────┴────────────────────┴──────────────────────────────┴──────────────────────────┴────────────────────────┴────────────────────┘
  Итого по листу &&&:                                         &'&&&&&&&&&&&&&&&&&&&&&.&&
  ^
                                         ИТОГО ПО ВЕДОМОСТИ  &'&&&&&&&&&&&&&&&&&&&&&&.&&
                                                                                                               Количество листов  Д&&& Д
.begin
  if (PechItog > 0)     // заполнять поля с итогами по суммам (выплачена/депонирована)
  begin
    // выплачено
    RItogSum := ItogSum - ItogSumdep // выплачено по ведомости
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
   // задепонировано
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
   if (PechItog = 0)     // не заполнять поля с итогами по суммам (выплачена/депонирована)
    begin
      RSumRub :=    '                  ';
      RSumkop := '';
      RSumRubDep := '                  ';
      RSumkopDep := '';
      PechItogStr := '';
      PechItogDep := '';
    end;
   end.
 По настоящей платежной ведомости
 выплачена сумма   Д@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ Д
                                   прописью
 __________________________________________________________________________________________________    ( Д ^  Д руб  Д ^  Д коп)
                                                                                                             цифрами
 и депонирована сумма   Д@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ Д
                                   прописью
 __________________________________________________________________________________________________    ( Д ^  Д руб  Д ^  Д коп)
                                                                                                             цифрами

 Б  Выплаты произвел Б   @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@                                @~@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
                    ──────────────────────────────────────────         ────────────────        ─────────────────────────────────────
                                    должность                           личная подпись                  расшифровка подписи

  Расходный кассовый ордер №  Д^ Д от  "&&"  Д^ Д  @@@@г.

   БПроверил бухгалтер Б                         @~@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
                        ──────────────────  ──────────────────────────────────────────────────────────────
                          личная подпись                          расшифровка подписи

     "    " ___________________________20      г. Р
.} //PlVedM CheckEnter
.endform

 