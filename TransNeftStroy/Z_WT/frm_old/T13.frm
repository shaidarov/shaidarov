.LinkForm 'TABT13_03_PER' Prototype is 'TABT13'
.Group 'Т-13'
.NameInList 'Унифицированная форма Т-13 (ТНС Excel)'
.var
  fname:String
  FBasName:String
  soz:String
  GetCode:String
  pos_x:Integer
  pos_y:Integer
  x:Integer
  i:Integer
  b:Byte
  kat:Byte
  prk:byte
  kkd:Byte
  nst:Byte
  lShow_Analitik:Boolean
  cKau:Comp
  wKau:Word
  nchas:Double
  dd:Date
  PersFIORuk,PersFIOotl,PersFIOrukp,PersFIOks,PersFIOotiz:string;
  DolRuk,Dolotl,Dolrukp,Dolks,Dolotiz:string;
.endvar
.Create  view tls
  as Select
  Lschet.KATEG, Lschet.Pensnal, Lschet.REJIM from Lschet
  Where((lschnum==Lschet.nrec))
;
.Create  view tpr
  as Select
  PEREXOD.KATEG, PEREXOD.PROCRK, PEREXOD.REJIM from PEREXOD
  Where((PEREXODNREC==PEREXOD.nrec))
;
.Create  view ttab
  as Select
  * from LSTABMSK
  Where((LSTABNREC==LSTABMSK.CLSTAB))
;
.Create  view tattr
  as Select
  ATTRVAL.VDOUBLE from ATTRVAL
  Where((2101==ATTRVAL.WTABLE and 013E000000000263h==ATTRVAL.CATTRNAM and cKau==ATTRVAL.CREC))
;
.fields
.endfields

.if SHOW_ANALITIK
.begin
  lShow_Analitik := true;
end.
.else
.begin
  lShow_Analitik := false;
end.
.end

.begin
    runinterface('GetPar_T13');
    ReadMyDsk(PersFIORuk,'T13_PersFIORuk',false)
    ReadMyDsk(dolRuk,'T13_dolRuk',false)
    ReadMyDsk(PersFIOotl,'T13_PersFIOotl',false)
    ReadMyDsk(Dolotl,'T13_Dolotl',false)
    ReadMyDsk(PersFIOrukp,'T13_PersFIOrukp',false)
    ReadMyDsk(Dolrukp,'T13_Dolrukp',false)
    ReadMyDsk(PersFIOks,'T13_PersFIOks',false)
    ReadMyDsk(Dolks,'T13_Dolks',false)
    ReadMyDsk(PersFIOotiz,'T13_PersFIOotiz',false)
    ReadMyDsk(Dolotiz,'T13_Dolotiz',false)
    pos_x:=0;
    FBasName:=GetStringParameter('Files','OutputFilesDirectory',ifFirstParameter);
    FBasName:=FBasName+'TabT13.xls';
    DeleteFile(FBasName);
    xlCreateExcel(FBasName,true);  // создание Excel
    xlSetActiveWorkBookByName(fname);  // книга активна
      xlGetSheetsCount(x);
      while x > 1
       do
        {
          xlSetActiveSheet(x);
          xlDeleteSheet(x);
          xlGetSheetsCount(x);
        }
      xlSetSheetName(1,'табель');        // имя первого листа
      xlSetActiveSheet(1);              // активен первый лист
      xlSetCellStringValue('УТВЕРЖДАЮ', pos_x+1, 61, pos_x+1, 61);
      xlSetCellStringValue(DolRuk, pos_x+2, 61, pos_x+2, 61);
      xlSetCellStringValue(Pred, pos_x+3, 61, pos_x+3, 61);
      xlSetCellStringValue('________________'+PersFIORuk, pos_x+4, 61, pos_x+4, 61);
      pos_x:=pos_x+5;
end.
.{CheckEnter
.{
.{?internal; lShow_Analitik
.begin
// Создание шапки отчета
      pos_x:=pos_x+1;
      xlSetCellStringValue(Pred, pos_x, 2, pos_x, 2);
      xlSetCellStringValue('Коды', pos_x, 68, pos_x, 68);
      pos_x:=pos_x+1;
      xlSetCellStringValue(Podr, pos_x, 2, pos_x, 2);
      xlSetCellStringValue('Номер документа', pos_x, 54, pos_x, 54);
      xlSetCellStringValue('Дата составления', pos_x, 58, pos_x, 58);
      xlSetCellStringValue('Отчетный' + Chr(10) + 'с', pos_x, 60, pos_x, 60);
      xlSetCellStringValue('Период' + Chr(10) + 'по', pos_x, 62, pos_x, 62);
      xlSetCellStringValue('Форма по ОКУД', pos_x, 65, pos_x, 65);
      xlSetCellStringValue('301008', pos_x, 68, pos_x, 68);
      pos_x:=pos_x+1;
      xlSetCellStringValue('подразделение, бригада', pos_x, 2, pos_x, 2);
      xlSetCellDateValue(Cur_Date, pos_x, 58, pos_x, 58);
      xlSetCellDateValue(strtodate(PeriodBeginning,'DD/MM/YYYY'), pos_x, 60, pos_x, 60);
      xlSetCellDateValue(strtodate(PeriodEnding,'DD/MM/YYYY'), pos_x, 62, pos_x, 62);
      xlSetCellStringValue('по ОКПО', pos_x, 66, pos_x, 66);
      pos_x:=pos_x+1;
      xlSetCellStringValue(AnalitikName, pos_x, 2, pos_x, 2);
      xlSetCellStringValue('Табель учета использования рабочего времени за ', pos_x, 23, pos_x, 23);
      xlSetCellStringValue(DateToStr(StrToDate(PeriodBeginning,'DD/MM/YYYY'),'MONTH'), pos_x, 36, pos_x, 36);
      xlSetCellStringValue(Year(StrToDate(PeriodBeginning,'DD/MM/YYYY'))+' года', pos_x, 43, pos_x, 43);
      pos_x:=pos_x+1;
      xlSetCellStringValue('вид работ', pos_x, 2, pos_x, 2);
// Создание шапки отчета - END
end.
.}
.begin
// Создание шапки таблицы
      pos_x:=pos_x+1;
      xlSetCellStringValue('№ п/п', pos_x, 1, pos_x, 1);
      xlSetCellStringValue('Ф.И.О.', pos_x, 2, pos_x, 2);
      xlSetCellStringValue('Должность,   профессия', pos_x, 3, pos_x, 3);
      xlSetCellStringValue('Таб. №', pos_x, 4, pos_x, 4);
      xlSetCellStringValue('Разряд', pos_x, 5, pos_x, 5);
      xlSetCellStringValue('Категория', pos_x, 6, pos_x, 6);
      xlSetCellStringValue('Отметка о явках и неявках на работу по числам месяца', pos_x, 7, pos_x, 7);
      xlSetCellStringValue('отработано за', pos_x, 23, pos_x, 23);
      xlSetCellStringValue('В том числе', pos_x, 25, pos_x, 25);
      xlSetCellStringValue('В пути', pos_x, 31, pos_x, 31);
      xlSetCellStringValue('Льготные часы', pos_x, 33, pos_x, 33);
      xlSetCellStringValue('Итого часов к оплате', pos_x, 34, pos_x, 34);
      xlSetCellStringValue('Кол-во неявок', pos_x, 35, pos_x, 35);
      xlSetCellStringValue('Из них по причинам', pos_x, 37, pos_x, 37);
      xlSetCellStringValue('Кол-во выходных и празд. дней', pos_x, 67, pos_x, 67);
      xlSetCellStringValue('Кол-во календарных дней', pos_x, 68, pos_x, 68);
      xlSetCellStringValue('Структурное подразделение для отнесения затрат', pos_x, 69, pos_x, 69);
      pos_x:=pos_x+1;
      for (i := 7; i<=21; i := i+1) xlSetCellStringValue(i-6, pos_x, i, pos_x, i);
      xlSetCellStringValue('половину месяца', pos_x, 23, pos_x, 23);
      xlSetCellStringValue('месяц', pos_x, 24, pos_x, 24);
      pos_x:=pos_x+2;
      for (i := 7; i<=22; i := i+1) xlSetCellStringValue(i+9, pos_x, i, pos_x, i);
      xlSetCellStringValue('дни', pos_x, 23, pos_x, 23);
      xlSetCellStringValue('Кол-во часов', pos_x, 25, pos_x, 25);
      xlSetCellStringValue('Дни', pos_x, 31, pos_x, 31);
      xlSetCellStringValue('Часы', pos_x, 32, pos_x, 32);
      xlSetCellStringValue('Дни', pos_x, 35, pos_x, 35);
      xlSetCellStringValue('Часы НП', pos_x, 36, pos_x, 36);
      xlSetCellStringValue('Количество дней', pos_x, 37, pos_x, 37);
      xlSetCellStringValue('РК', pos_x, 69, pos_x, 69);
      xlSetCellStringValue('объект', pos_x, 70, pos_x, 70);
      xlSetCellStringValue('Б/с', pos_x, 71, pos_x, 71);
      pos_x:=pos_x+1;
      xlSetCellStringValue('часы', pos_x, 23, pos_x, 23);
      pos_x:=pos_x+1;
      xlSetCellStringValue('Я', pos_x, 23, pos_x, 23);
      xlSetCellStringValue('К', pos_x, 24, pos_x, 24);
      xlSetCellStringValue('Н', pos_x, 25, pos_x, 25);
      xlSetCellStringValue('РВ', pos_x, 26, pos_x, 26);
      xlSetCellStringValue('РП', pos_x, 27, pos_x, 27);
      xlSetCellStringValue('ЯР', pos_x, 28, pos_x, 28);
      xlSetCellStringValue('С', pos_x, 29, pos_x, 29);
      xlSetCellStringValue('Ст', pos_x, 30, pos_x, 30);
      xlSetCellStringValue('Дп', pos_x, 31, pos_x, 31);
      xlSetCellStringValue('Лв', pos_x, 33, pos_x, 33);
      xlSetCellStringValue('Кс', pos_x, 37, pos_x, 37);
      xlSetCellStringValue('ОТ', pos_x, 38, pos_x, 38);
      xlSetCellStringValue('ОД', pos_x, 39, pos_x, 39);
      xlSetCellStringValue('Ок', pos_x, 40, pos_x, 40);
      xlSetCellStringValue('У', pos_x, 41, pos_x, 41);
      xlSetCellStringValue('ПК', pos_x, 42, pos_x, 42);
      xlSetCellStringValue('ПМ', pos_x, 43, pos_x, 43);
      xlSetCellStringValue('УВ', pos_x, 44, pos_x, 44);
      xlSetCellStringValue('УД', pos_x, 45, pos_x, 45);
      xlSetCellStringValue('Р', pos_x, 46, pos_x, 46);
      xlSetCellStringValue('ОЧ', pos_x, 47, pos_x, 47);
      xlSetCellStringValue('ОЖ', pos_x, 48, pos_x, 48);
      xlSetCellStringValue('ДО', pos_x, 49, pos_x, 49);
      xlSetCellStringValue('ОЗ', pos_x, 50, pos_x, 50);
      xlSetCellStringValue('Б', pos_x, 51, pos_x, 51);
      xlSetCellStringValue('Т', pos_x, 52, pos_x, 52);
      xlSetCellStringValue('Тп', pos_x, 53, pos_x, 53);
      xlSetCellStringValue('РП', pos_x, 54, pos_x, 54);
      xlSetCellStringValue('НП часы', pos_x, 55, pos_x, 55);
      xlSetCellStringValue('ВП', pos_x, 56, pos_x, 56);
      xlSetCellStringValue('Г', pos_x, 57, pos_x, 57);
      xlSetCellStringValue('Гд', pos_x, 58, pos_x, 58);
      xlSetCellStringValue('Гт', pos_x, 59, pos_x, 59);
      xlSetCellStringValue('ПР', pos_x, 60, pos_x, 60);
      xlSetCellStringValue('П', pos_x, 61, pos_x, 61);
      xlSetCellStringValue('НС', pos_x, 62, pos_x, 62);
      xlSetCellStringValue('НН', pos_x, 63, pos_x, 63);
      xlSetCellStringValue('НВ', pos_x, 64, pos_x, 64);
      xlSetCellStringValue('ОВ', pos_x, 65, pos_x, 65);
      xlSetCellStringValue('ПВ', pos_x, 66, pos_x, 66);
      xlSetCellStringValue('В', pos_x, 67, pos_x, 67);
      pos_x:=pos_x+1;
      for (i := 1; i<=7; i := i+1) xlSetCellStringValue(i, pos_x, i, pos_x, i);
      xlSetCellStringValue('8', pos_x, 23, pos_x, 23);
      for (i := 25; i<=31; i := i+1) xlSetCellStringValue(i-16, pos_x, i, pos_x, i);
      for (i := 33; i<=35; i := i+1) xlSetCellStringValue(i-17, pos_x, i, pos_x, i);
      for (i := 37; i<=71; i := i+1) xlSetCellStringValue(i-18, pos_x, i, pos_x, i);
      pos_x:=pos_x+1;
      nst:=0;
// Создание шапки таблицы - END
end.

.{
.begin
// Создание  таблицы
  if (nst=12)
  {
      xlSetCellStringValue('Итого по листу:', pos_x, 2, pos_x, 2);
      pos_x:=pos_x+2;
      xlSetCellStringValue('№ п/п', pos_x, 1, pos_x, 1);
      xlSetCellStringValue('Ф.И.О.', pos_x, 2, pos_x, 2);
      xlSetCellStringValue('Должность,   профессия', pos_x, 3, pos_x, 3);
      xlSetCellStringValue('Таб. №', pos_x, 4, pos_x, 4);
      xlSetCellStringValue('Разряд', pos_x, 5, pos_x, 5);
      xlSetCellStringValue('Категория', pos_x, 6, pos_x, 6);
      xlSetCellStringValue('Отметка о явках и неявках на работу по числам месяца', pos_x, 7, pos_x, 7);
      xlSetCellStringValue('отработано за', pos_x, 23, pos_x, 23);
      xlSetCellStringValue('В том числе', pos_x, 25, pos_x, 25);
      xlSetCellStringValue('В пути', pos_x, 31, pos_x, 31);
      xlSetCellStringValue('Льготные часы', pos_x, 33, pos_x, 33);
      xlSetCellStringValue('Итого часов к оплате', pos_x, 34, pos_x, 34);
      xlSetCellStringValue('Кол-во неявок', pos_x, 35, pos_x, 35);
      xlSetCellStringValue('Из них по причинам', pos_x, 37, pos_x, 37);
      xlSetCellStringValue('Кол-во выходных и празд. дней', pos_x, 67, pos_x, 67);
      xlSetCellStringValue('Кол-во календарных дней', pos_x, 68, pos_x, 68);
      xlSetCellStringValue('Структурное подразделение для отнесения затрат', pos_x, 69, pos_x, 69);
      pos_x:=pos_x+1;
      for (i := 7; i<=21; i := i+1) xlSetCellStringValue(i-6, pos_x, i, pos_x, i);
      xlSetCellStringValue('полвину месяца', pos_x, 23, pos_x, 23);
      xlSetCellStringValue('месяц', pos_x, 24, pos_x, 24);
      pos_x:=pos_x+2;
      for (i := 7; i<=22; i := i+1) xlSetCellStringValue(i+9, pos_x, i, pos_x, i);
      xlSetCellStringValue('дни', pos_x, 23, pos_x, 23);
      xlSetCellStringValue('Кол-во часов', pos_x, 25, pos_x, 25);
      xlSetCellStringValue('Дни', pos_x, 31, pos_x, 31);
      xlSetCellStringValue('Часы', pos_x, 32, pos_x, 32);
      xlSetCellStringValue('Дни', pos_x, 35, pos_x, 35);
      xlSetCellStringValue('Часы НП', pos_x, 36, pos_x, 36);
      xlSetCellStringValue('Количество дней', pos_x, 37, pos_x, 37);
      xlSetCellStringValue('РК', pos_x, 69, pos_x, 69);
      xlSetCellStringValue('объект', pos_x, 70, pos_x, 70);
      xlSetCellStringValue('Б/с', pos_x, 71, pos_x, 71);
      pos_x:=pos_x+1;
      xlSetCellStringValue('часы', pos_x, 23, pos_x, 23);
      pos_x:=pos_x+1;
      xlSetCellStringValue('Я', pos_x, 23, pos_x, 23);
      xlSetCellStringValue('К', pos_x, 24, pos_x, 24);
      xlSetCellStringValue('Н', pos_x, 25, pos_x, 25);
      xlSetCellStringValue('РВ', pos_x, 26, pos_x, 26);
      xlSetCellStringValue('РП', pos_x, 27, pos_x, 27);
      xlSetCellStringValue('ЯР', pos_x, 28, pos_x, 28);
      xlSetCellStringValue('С', pos_x, 29, pos_x, 29);
      xlSetCellStringValue('Ст', pos_x, 30, pos_x, 30);
      xlSetCellStringValue('Дп', pos_x, 31, pos_x, 31);
      xlSetCellStringValue('Лв', pos_x, 33, pos_x, 33);
      xlSetCellStringValue('Кс', pos_x, 37, pos_x, 37);
      xlSetCellStringValue('ОТ', pos_x, 38, pos_x, 38);
      xlSetCellStringValue('ОД', pos_x, 39, pos_x, 39);
      xlSetCellStringValue('Ок', pos_x, 40, pos_x, 40);
      xlSetCellStringValue('У', pos_x, 41, pos_x, 41);
      xlSetCellStringValue('ПК', pos_x, 42, pos_x, 42);
      xlSetCellStringValue('ПМ', pos_x, 43, pos_x, 43);
      xlSetCellStringValue('УВ', pos_x, 44, pos_x, 44);
      xlSetCellStringValue('УД', pos_x, 45, pos_x, 45);
      xlSetCellStringValue('Р', pos_x, 46, pos_x, 46);
      xlSetCellStringValue('ОЧ', pos_x, 47, pos_x, 47);
      xlSetCellStringValue('ОЖ', pos_x, 48, pos_x, 48);
      xlSetCellStringValue('ДО', pos_x, 49, pos_x, 49);
      xlSetCellStringValue('ОЗ', pos_x, 50, pos_x, 50);
      xlSetCellStringValue('Б', pos_x, 51, pos_x, 51);
      xlSetCellStringValue('Т', pos_x, 52, pos_x, 52);
      xlSetCellStringValue('Тп', pos_x, 53, pos_x, 53);
      xlSetCellStringValue('РП', pos_x, 54, pos_x, 54);
      xlSetCellStringValue('НП часы', pos_x, 55, pos_x, 55);
      xlSetCellStringValue('ВП', pos_x, 56, pos_x, 56);
      xlSetCellStringValue('Г', pos_x, 57, pos_x, 57);
      xlSetCellStringValue('Гд', pos_x, 58, pos_x, 58);
      xlSetCellStringValue('Гт', pos_x, 59, pos_x, 59);
      xlSetCellStringValue('ПР', pos_x, 60, pos_x, 60);
      xlSetCellStringValue('П', pos_x, 61, pos_x, 61);
      xlSetCellStringValue('НС', pos_x, 62, pos_x, 62);
      xlSetCellStringValue('НН', pos_x, 63, pos_x, 63);
      xlSetCellStringValue('НВ', pos_x, 64, pos_x, 64);
      xlSetCellStringValue('ОВ', pos_x, 65, pos_x, 65);
      xlSetCellStringValue('ПВ', pos_x, 66, pos_x, 66);
      xlSetCellStringValue('В', pos_x, 67, pos_x, 67);
      pos_x:=pos_x+1;
      for (i := 1; i<=7; i := i+1) xlSetCellStringValue(i, pos_x, i, pos_x, i);
      xlSetCellStringValue('8', pos_x, 23, pos_x, 23);
      for (i := 25; i<=31; i := i+1) xlSetCellStringValue(i-16, pos_x, i, pos_x, i);
      for (i := 33; i<=35; i := i+1) xlSetCellStringValue(i-17, pos_x, i, pos_x, i);
      for (i := 37; i<=71; i := i+1) xlSetCellStringValue(i-18, pos_x, i, pos_x, i);
      pos_x:=pos_x+1;
      nst:=0;
  }
  b:=0;
  kkd:=0;
  nchas:=0;
  if PEREXODNREC<>0 {b:=1;}
  if(b=0)
  {
    if(tls.getfirst Lschet = tsok){};
  }
  else
  {
    if(tpr.getfirst PEREXOD = tsok){};
  }
      xlSetCellStringValue(Npp, pos_x, 1, pos_x, 1);
      xlSetCellStringValue(FIO, pos_x, 2, pos_x, 2);
      xlSetCellStringValue(Dolg, pos_x, 3, pos_x, 3);
      xlSetCellStringValue(TabN, pos_x, 4, pos_x, 4);
      xlSetCellStringValue(WageCategory, pos_x, 5, pos_x, 5);
  if(b=0)
  {
    kat:=tls.Lschet.Kateg;
  }
  else
  {
    kat:=tpr.PEREXOD.KATEG;
  }
      xlSetCellStringValue('0'+kat, pos_x, 6, pos_x, 6);
      xlSetCellStringValue(D1, pos_x, 7, pos_x, 7);
      xlSetCellStringValue(D2, pos_x, 8, pos_x, 8);
      xlSetCellStringValue(D3, pos_x, 9, pos_x, 9);
      xlSetCellStringValue(D4, pos_x, 10, pos_x, 10);
      xlSetCellStringValue(D5, pos_x, 11, pos_x, 11);
      xlSetCellStringValue(D6, pos_x, 12, pos_x, 12);
      xlSetCellStringValue(D7, pos_x, 13, pos_x, 13);
      xlSetCellStringValue(D8, pos_x, 14, pos_x, 14);
      xlSetCellStringValue(D9, pos_x, 15, pos_x, 15);
      xlSetCellStringValue(D10, pos_x, 16, pos_x, 16);
      xlSetCellStringValue(D11, pos_x, 17, pos_x, 17);
      xlSetCellStringValue(D12, pos_x, 18, pos_x, 18);
      xlSetCellStringValue(D13, pos_x, 19, pos_x, 19);
      xlSetCellStringValue(D14, pos_x, 20, pos_x, 20);
      xlSetCellStringValue(D15, pos_x, 21, pos_x, 21);
      xlSetCellStringValue(перв_пол_дни, pos_x, 23, pos_x, 23);
      xlSetCellStringValue(месяц_дни, pos_x, 24, pos_x, 24);
// Ночные
  if(ttab.getfirst LSTABMSK = tsok){}; // для ночных
  if(trim(ch1)<>'' and D1<>'Дп')
  {
    nchas:=nchas+ttab.LSTABMSK.NIGHTHOURS[1];
  }
  if(trim(ch2)<>'' and D2<>'Дп')
  {
    nchas:=nchas+ttab.LSTABMSK.NIGHTHOURS[2];
  }
  if(trim(ch3)<>'' and D3<>'Дп')
  {
    nchas:=nchas+ttab.LSTABMSK.NIGHTHOURS[3];
  }
  if(trim(ch4)<>'' and D4<>'Дп')
  {
    nchas:=nchas+ttab.LSTABMSK.NIGHTHOURS[4];
  }
  if(trim(ch5)<>'' and D5<>'Дп')
  {
    nchas:=nchas+ttab.LSTABMSK.NIGHTHOURS[5];
  }
  if(trim(ch6)<>'' and D6<>'Дп')
  {
    nchas:=nchas+ttab.LSTABMSK.NIGHTHOURS[6];
  }
  if(trim(ch7)<>'' and D7<>'Дп')
  {
    nchas:=nchas+ttab.LSTABMSK.NIGHTHOURS[7];
  }
  if(trim(ch8)<>'' and D8<>'Дп')
  {
    nchas:=nchas+ttab.LSTABMSK.NIGHTHOURS[8];
  }
  if(trim(ch9)<>'' and D9<>'Дп')
  {
    nchas:=nchas+ttab.LSTABMSK.NIGHTHOURS[9];
  }
  if(trim(ch10)<>'' and D10<>'Дп')
  {
    nchas:=nchas+ttab.LSTABMSK.NIGHTHOURS[10];
  }
  if(trim(ch11)<>'' and D11<>'Дп')
  {
    nchas:=nchas+ttab.LSTABMSK.NIGHTHOURS[11];
  }
  if(trim(ch12)<>'' and D12<>'Дп')
  {
    nchas:=nchas+ttab.LSTABMSK.NIGHTHOURS[12];
  }
  if(trim(ch13)<>'' and D13<>'Дп')
  {
    nchas:=nchas+ttab.LSTABMSK.NIGHTHOURS[13];
  }
  if(trim(ch14)<>'' and D14<>'Дп')
  {
    nchas:=nchas+ttab.LSTABMSK.NIGHTHOURS[14];
  }
  if(trim(ch15)<>'' and D15<>'Дп')
  {
    nchas:=nchas+ttab.LSTABMSK.NIGHTHOURS[15];
  }
  if(trim(ch16)<>'' and D16<>'Дп')
  {
    nchas:=nchas+ttab.LSTABMSK.NIGHTHOURS[16];
  }
  if(trim(ch17)<>'' and D17<>'Дп')
  {
    nchas:=nchas+ttab.LSTABMSK.NIGHTHOURS[17];
  }
  if(trim(ch18)<>'' and D18<>'Дп')
  {
    nchas:=nchas+ttab.LSTABMSK.NIGHTHOURS[18];
  }
  if(trim(ch19)<>'' and D19<>'Дп')
  {
    nchas:=nchas+ttab.LSTABMSK.NIGHTHOURS[19];
  }
  if(trim(ch20)<>'' and D20<>'Дп')
  {
    nchas:=nchas+ttab.LSTABMSK.NIGHTHOURS[20];
  }
  if(trim(ch21)<>'' and D21<>'Дп')
  {
    nchas:=nchas+ttab.LSTABMSK.NIGHTHOURS[21];
  }
  if(trim(ch22)<>'' and D22<>'Дп')
  {
    nchas:=nchas+ttab.LSTABMSK.NIGHTHOURS[22];
  }
  if(trim(ch23)<>'' and D23<>'Дп')
  {
    nchas:=nchas+ttab.LSTABMSK.NIGHTHOURS[23];
  }
  if(trim(ch24)<>'' and D24<>'Дп')
  {
    nchas:=nchas+ttab.LSTABMSK.NIGHTHOURS[24];
  }
  if(trim(ch25)<>'' and D25<>'Дп')
  {
    nchas:=nchas+ttab.LSTABMSK.NIGHTHOURS[25];
  }
  if(trim(ch26)<>'' and D26<>'Дп')
  {
    nchas:=nchas+ttab.LSTABMSK.NIGHTHOURS[26];
  }
  if(trim(ch27)<>'' and D27<>'Дп')
  {
    nchas:=nchas+ttab.LSTABMSK.NIGHTHOURS[27];
  }
  if(trim(ch28)<>'' and D28<>'Дп')
  {
    nchas:=nchas+ttab.LSTABMSK.NIGHTHOURS[28];
  }
  if(trim(ch29)<>'' and D29<>'Дп')
  {
    nchas:=nchas+ttab.LSTABMSK.NIGHTHOURS[29];
  }
  if(trim(ch30)<>'' and D30<>'Дп')
  {
    nchas:=nchas+ttab.LSTABMSK.NIGHTHOURS[30];
  }
  if(trim(ch31)<>'' and D31<>'Дп')
  {
    nchas:=nchas+ttab.LSTABMSK.NIGHTHOURS[31];
  }
      xlSetCellStringValue(nchas, pos_x, 25, pos_x, 25);
// Кол-во календарных дней
  if(trim(D1)<>'X' and trim(D1)<>'Х' and trim(D1)<>'' and trim(D1)<>'-') {kkd:=kkd+1;}
  if(trim(D2)<>'X' and trim(D2)<>'Х' and trim(D2)<>'' and trim(D2)<>'-') {kkd:=kkd+1;}
  if(trim(D3)<>'X' and trim(D3)<>'Х' and trim(D3)<>'' and trim(D3)<>'-') {kkd:=kkd+1;}
  if(trim(D4)<>'X' and trim(D4)<>'Х' and trim(D4)<>'' and trim(D4)<>'-') {kkd:=kkd+1;}
  if(trim(D5)<>'X' and trim(D5)<>'Х' and trim(D5)<>'' and trim(D5)<>'-') {kkd:=kkd+1;}
  if(trim(D6)<>'X' and trim(D6)<>'Х' and trim(D6)<>'' and trim(D6)<>'-') {kkd:=kkd+1;}
  if(trim(D7)<>'X' and trim(D7)<>'Х' and trim(D7)<>'' and trim(D7)<>'-') {kkd:=kkd+1;}
  if(trim(D8)<>'X' and trim(D8)<>'Х' and trim(D8)<>'' and trim(D8)<>'-') {kkd:=kkd+1;}
  if(trim(D9)<>'X' and trim(D9)<>'Х' and trim(D9)<>'' and trim(D9)<>'-') {kkd:=kkd+1;}
  if(trim(D10)<>'X' and trim(D10)<>'Х' and trim(D10)<>'' and trim(D10)<>'-') {kkd:=kkd+1;}
  if(trim(D11)<>'X' and trim(D11)<>'Х' and trim(D11)<>'' and trim(D11)<>'-') {kkd:=kkd+1;}
  if(trim(D12)<>'X' and trim(D12)<>'Х' and trim(D12)<>'' and trim(D12)<>'-') {kkd:=kkd+1;}
  if(trim(D13)<>'X' and trim(D13)<>'Х' and trim(D13)<>'' and trim(D13)<>'-') {kkd:=kkd+1;}
  if(trim(D14)<>'X' and trim(D14)<>'Х' and trim(D14)<>'' and trim(D14)<>'-') {kkd:=kkd+1;}
  if(trim(D15)<>'X' and trim(D15)<>'Х' and trim(D15)<>'' and trim(D15)<>'-') {kkd:=kkd+1;}
  if(trim(D16)<>'X' and trim(D16)<>'Х' and trim(D16)<>'' and trim(D16)<>'-') {kkd:=kkd+1;}
  if(trim(D17)<>'X' and trim(D17)<>'Х' and trim(D17)<>'' and trim(D17)<>'-') {kkd:=kkd+1;}
  if(trim(D18)<>'X' and trim(D18)<>'Х' and trim(D18)<>'' and trim(D18)<>'-') {kkd:=kkd+1;}
  if(trim(D19)<>'X' and trim(D19)<>'Х' and trim(D19)<>'' and trim(D19)<>'-') {kkd:=kkd+1;}
  if(trim(D20)<>'X' and trim(D20)<>'Х' and trim(D20)<>'' and trim(D20)<>'-') {kkd:=kkd+1;}
  if(trim(D21)<>'X' and trim(D21)<>'Х' and trim(D21)<>'' and trim(D21)<>'-') {kkd:=kkd+1;}
  if(trim(D22)<>'X' and trim(D22)<>'Х' and trim(D22)<>'' and trim(D22)<>'-') {kkd:=kkd+1;}
  if(trim(D23)<>'X' and trim(D23)<>'Х' and trim(D23)<>'' and trim(D23)<>'-') {kkd:=kkd+1;}
  if(trim(D24)<>'X' and trim(D24)<>'Х' and trim(D24)<>'' and trim(D24)<>'-') {kkd:=kkd+1;}
  if(trim(D25)<>'X' and trim(D25)<>'Х' and trim(D25)<>'' and trim(D25)<>'-') {kkd:=kkd+1;}
  if(trim(D26)<>'X' and trim(D26)<>'Х' and trim(D26)<>'' and trim(D26)<>'-') {kkd:=kkd+1;}
  if(trim(D27)<>'X' and trim(D27)<>'Х' and trim(D27)<>'' and trim(D27)<>'-') {kkd:=kkd+1;}
  if(trim(D28)<>'X' and trim(D28)<>'Х' and trim(D28)<>'' and trim(D28)<>'-') {kkd:=kkd+1;}
  if(trim(D29)<>'X' and trim(D29)<>'Х' and trim(D29)<>'' and trim(D29)<>'-') {kkd:=kkd+1;}
  if(trim(D30)<>'X' and trim(D30)<>'Х' and trim(D30)<>'' and trim(D30)<>'-') {kkd:=kkd+1;}
  if(trim(D31)<>'X' and trim(D31)<>'Х' and trim(D31)<>'' and trim(D31)<>'-') {kkd:=kkd+1;}
  xlSetCellStringValue(kkd, pos_x, 68, pos_x, 68);
// Объект строительства, РК, ШПЗ
cKau:=0;
wKau:=0;
  if(b=0)
  {
    for (i := 1; i<=6; i := i+1)
    {
      if(tls.lschet.TBLD[i]=40)
      {
        cKau:=tls.Lschet.CKAUD[i];
        wKau:=40;
      }
    }
  }
  else
  {
    for (i := 1; i<=6; i := i+1)
    {
      if(tpr.PEREXOD.TBLD[i]=40)
      {
        cKau:=tpr.PEREXOD.CKAUD[i];
        wKau:=40;
      }
    }
  }
  if(GetAnyKAU(cgAkNoDef, wKau, cKau))
  {
    GetCode := GivenAnName(cgAnCode);
  }
  else
  {
    GetCode := '';
  }
      xlSetCellStringValue(getcode, pos_x, 70, pos_x, 70);
// РК
  if(b=0)
  {
    prk:=tls.Lschet.Pensnal;
    if (prk=0)
    {
      if(tattr.getfirst ATTRVAL = tsok){prk:=tattr.ATTRVAL.VDOUBLE};
    }
    if (prk=0)
    {
      prk:=byte(dogettune('UP.ZAR.PROCRK'));
    }
  }
  else
  {
    prk:=tpr.PEREXOD.PROCRK;
    if (prk=0)
    {
      if(tattr.getfirst ATTRVAL = tsok){prk:=tattr.ATTRVAL.VDOUBLE};
    }
    if (prk=0)
    {
      prk:=byte(dogettune('UP.ZAR.PROCRK'));
    }
  }
      xlSetCellStringValue(prk+'%', pos_x, 69, pos_x, 69);
  if(b=0)
  {
    soz:=tls.Lschet.CSCHETD+tls.Lschet.CSUBSCHD;
  }
  else
  {
    soz:=tpr.PEREXOD.CSCHETD+tpr.PEREXOD.CSUBSCHD;
  }
      xlSetCellStringValue(soz, pos_x, 71, pos_x, 71);
      pos_x:=pos_x+1;
      xlSetCellStringValue(Ch1, pos_x, 7, pos_x, 7);
      xlSetCellStringValue(Ch2, pos_x, 8, pos_x, 8);
      xlSetCellStringValue(Ch3, pos_x, 9, pos_x, 9);
      xlSetCellStringValue(Ch4, pos_x, 10, pos_x, 10);
      xlSetCellStringValue(Ch5, pos_x, 11, pos_x, 11);
      xlSetCellStringValue(Ch6, pos_x, 12, pos_x, 12);
      xlSetCellStringValue(Ch7, pos_x, 13, pos_x, 13);
      xlSetCellStringValue(Ch8, pos_x, 14, pos_x, 14);
      xlSetCellStringValue(Ch9, pos_x, 15, pos_x, 15);
      xlSetCellStringValue(Ch10, pos_x, 16, pos_x, 16);
      xlSetCellStringValue(Ch11, pos_x, 17, pos_x, 17);
      xlSetCellStringValue(Ch12, pos_x, 18, pos_x, 18);
      xlSetCellStringValue(Ch13, pos_x, 19, pos_x, 19);
      xlSetCellStringValue(Ch14, pos_x, 20, pos_x, 20);
      xlSetCellStringValue(Ch15, pos_x, 21, pos_x, 21);
      xlSetCellStringValue(перв_пол_часы, pos_x, 23, pos_x, 23);
      pos_x:=pos_x+1;
      xlSetCellStringValue(D16, pos_x, 7, pos_x, 7);
      xlSetCellStringValue(D17, pos_x, 8, pos_x, 8);
      xlSetCellStringValue(D18, pos_x, 9, pos_x, 9);
      xlSetCellStringValue(D19, pos_x, 10, pos_x, 10);
      xlSetCellStringValue(D20, pos_x, 11, pos_x, 11);
      xlSetCellStringValue(D21, pos_x, 12, pos_x, 12);
      xlSetCellStringValue(D22, pos_x, 13, pos_x, 13);
      xlSetCellStringValue(D23, pos_x, 14, pos_x, 14);
      xlSetCellStringValue(D24, pos_x, 15, pos_x, 15);
      xlSetCellStringValue(D25, pos_x, 16, pos_x, 16);
      xlSetCellStringValue(D26, pos_x, 17, pos_x, 17);
      xlSetCellStringValue(D27, pos_x, 18, pos_x, 18);
      xlSetCellStringValue(D28, pos_x, 19, pos_x, 19);
      xlSetCellStringValue(D29, pos_x, 20, pos_x, 20);
      xlSetCellStringValue(D30, pos_x, 21, pos_x, 21);
      xlSetCellStringValue(D31, pos_x, 22, pos_x, 22);
      xlSetCellStringValue(втор_пол_дни, pos_x, 23, pos_x, 23);
      xlSetCellStringValue(месяц_часы, pos_x, 24, pos_x, 24);
      pos_x:=pos_x+1;
      xlSetCellStringValue(Ch16, pos_x, 7, pos_x, 7);
      xlSetCellStringValue(Ch17, pos_x, 8, pos_x, 8);
      xlSetCellStringValue(Ch18, pos_x, 9, pos_x, 9);
      xlSetCellStringValue(Ch19, pos_x, 10, pos_x, 10);
      xlSetCellStringValue(Ch20, pos_x, 11, pos_x, 11);
      xlSetCellStringValue(Ch21, pos_x, 12, pos_x, 12);
      xlSetCellStringValue(Ch22, pos_x, 13, pos_x, 13);
      xlSetCellStringValue(Ch23, pos_x, 14, pos_x, 14);
      xlSetCellStringValue(Ch24, pos_x, 15, pos_x, 15);
      xlSetCellStringValue(Ch25, pos_x, 16, pos_x, 16);
      xlSetCellStringValue(Ch26, pos_x, 17, pos_x, 17);
      xlSetCellStringValue(Ch27, pos_x, 18, pos_x, 18);
      xlSetCellStringValue(Ch28, pos_x, 19, pos_x, 19);
      xlSetCellStringValue(Ch29, pos_x, 20, pos_x, 20);
      xlSetCellStringValue(Ch30, pos_x, 21, pos_x, 21);
      xlSetCellStringValue(Ch31, pos_x, 22, pos_x, 22);
      xlSetCellStringValue(втор_пол_часы, pos_x, 23, pos_x, 23);
      pos_x:=pos_x+1;
      nst:=nst+1;
// Создание таблицы - END
end.
.}
.begin
      xlSetCellStringValue('Итого по листу:', pos_x, 2, pos_x, 2);
      pos_x:=pos_x+1;
      xlSetCellStringValue('Итого по объекту:', pos_x, 2, pos_x, 2);
      pos_x:=pos_x+1;
end.
.}
.{CheckEnter FIRSTPAGE
.}
.}

.begin
// Создание  подножия
      xlSetCellStringValue('end', pos_x, 1, pos_x, 1);  //НЕОБХОДИМО ДЛЯ ОПРЕДЕЛЕНИЯ ОКОНЧАНИЯ ТАБЕЛЯ
      pos_x:=pos_x+1;
      xlSetCellStringValue('Всего по табелю:', pos_x, 2, pos_x, 2);
      pos_x:=pos_x+2;
      xlSetCellStringValue('Списочная численность работников подразделения', pos_x, 2, pos_x, 2);
      xlSetCellStringValue('чел.', pos_x, 13, pos_x, 13);
      pos_x:=pos_x+2;
      xlSetCellStringValue('Ответственное лицо', pos_x, 1, pos_x, 1);
      xlSetCellStringValue(Dolotl, pos_x, 10, pos_x, 10);
      xlSetCellStringValue(PersFIOotl, pos_x, 24, pos_x, 24);
      xlSetCellStringValue('Работник кадровой службы', pos_x, 40, pos_x, 40);
      xlSetCellStringValue(Dolks, pos_x, 49, pos_x, 49);
      xlSetCellStringValue(PersFIOks, pos_x, 63, pos_x, 63);
      pos_x:=pos_x+1;
      xlSetCellStringValue('должность', pos_x, 10, pos_x, 10);
      xlSetCellStringValue('подпись', pos_x, 17, pos_x, 17);
      xlSetCellStringValue('расшифровка подписи', pos_x, 24, pos_x, 24);
      xlSetCellStringValue('должность', pos_x, 49, pos_x, 49);
      xlSetCellStringValue('подпись', pos_x, 56, pos_x, 56);
      xlSetCellStringValue('расшифровка подписи', pos_x, 63, pos_x, 63);
      pos_x:=pos_x+2;
      xlSetCellStringValue('Руководитель структурного подразделения', pos_x, 1, pos_x, 1);
      xlSetCellStringValue(Dolrukp, pos_x, 10, pos_x, 10);
      xlSetCellStringValue(PersFIOrukp, pos_x, 24, pos_x, 24);
      xlSetCellStringValue('Работник ПЭО или ООТиЗ', pos_x, 40, pos_x, 40);
      xlSetCellStringValue(Dolotiz, pos_x, 49, pos_x, 49);
      xlSetCellStringValue(PersFIOotiz, pos_x, 63, pos_x, 63);
      pos_x:=pos_x+1;
      xlSetCellStringValue('должность', pos_x, 10, pos_x, 10);
      xlSetCellStringValue('подпись', pos_x, 17, pos_x, 17);
      xlSetCellStringValue('расшифровка подписи', pos_x, 24, pos_x, 24);
      xlSetCellStringValue('должность', pos_x, 49, pos_x, 49);
      xlSetCellStringValue('подпись', pos_x, 56, pos_x, 56);
      xlSetCellStringValue('расшифровка подписи', pos_x, 63, pos_x, 63);
// Создание подножия - END
   xlImportModule('\\fs01-tns.tns.transneft.ru\apps\gal\Resources_Sources\Z_WT\frm\T13.bas');
   xlRunMacro('Tabel');
   xlKillExcel;                       // Окончание работы с Excel
   TABT13_03_PER.fexit;
end.
.endform
