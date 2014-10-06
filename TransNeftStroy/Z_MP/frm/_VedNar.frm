.LinkForm 'VEDNAR_01_PER_TNS' Prototype is 'VEDNAR'
.Group 'Бригадные наряды'
.NameInList 'Полная справка о бригадных нарядах (ТНС)'
.var
  fname:String
  FBasName:String
  My_Organization: string
  pos_x:Integer
  pos_y:Integer
  x:Integer
  i:Integer
  PersonalAccountCount:LongInt
  ksb:LongInt
  sum_CHASF:Double
  sum_SUMKTY:Double
  sum_SUMMA:Double
  sum_SUMMPREM:Double
  sum_AGRSUM:Double
  p3:Double
  p4:Double
  p5:Double
  p6:Double
  sch:Double
  cls:Comp
  cpost:Comp
  csysnar:Comp
  cKau:Comp
  cbrig:Comp
  npost:String
  nk:String
  nf:String
  wKau:Word
  dat1:Date
.endvar
.Create  view tmp
  as Select
  PRNARYAD.CLSCH from PRNARYAD
  Where((PRNARYAD_NREC==PRNARYAD.NREC))
;
.Create  view tmp1
  as Select
  LSCHET.CAPPOINT, LSCHET.TPERSON from LSCHET
  Where((cls==LSCHET.NREC))
;
.Create  view tmp2
  as Select
  Catalogs.Name from Catalogs
  Where((cpost==Catalogs.nrec))
;
.Create  view tmp3
  as Select
  SYS_NAR.SUMMANAR, SYS_NAR.PRPREM, SYS_NAR.DATAN, SYS_NAR.NBRIG from SYS_NAR
  Where((SYS_NAR_NREC==SYS_NAR.nrec))
;
.Create  view tmp4
  as Select
  PRNARYAD.PROC from PRNARYAD
  Where((csysnar==PRNARYAD.MNREC))
;
.Create  view tmp5
  as Select
  BRIGAD.CLSCHET from BRIGAD
  Where((cbrig== BRIGAD.NBRIG))
;
.Create  view tmp6
  as Select
  Persons.FIO from Persons
  Where((tmp1.LSCHET.TPERSON==Persons.Nrec))
;
.Create  view tmp7
  as Select
  BRWORK.TABN from BRWORK
  Where((cbrig==BRWORK.NBRIG))
;
.fields
.endfields
.begin
    pos_x:=0;
    FBasName:=GetStringParameter('Files','OutputFilesDirectory',ifFirstParameter);
    FBasName:=FBasName+'SpBrig.xls';
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
      xlSetSheetName(1,'справка по бригаде');        // имя первого листа
      xlSetActiveSheet(1);              // активен первый лист
      My_Organization:=sGetTune('MYORG');
end.
.{CheckEnter VEDNAR_DEPARTMENTLOOP
.{CheckEnter VEDNAR_BRIGADELOOP
.{CheckEnter VEDNAR_JOBSHEETLOOP
.{CheckEnter VEDNAR_JOBSHEETADDITIONALPAYMENTLOOP
.}
.{CheckEnter VEDNAR_JOBLISTLOOP
.{CheckEnter VEDNAR_JOBLISTITEMADDITIONALPAYMENTLOOP
.}
.}
.begin
If (tmp3.getfirst SYS_NAR = tsok)
{
csysnar:=tmp3.SYS_NAR.nrec;
cbrig:=tmp3.SYS_NAR.NBRIG;
}
if (tmp5.getfirst BRIGAD = tsok) {cls:=tmp5.BRIGAD.CLSCHET};
ksb:=0;
_loop  BRWORK Where((cbrig==BRWORK.NBRIG))
{
ksb:=ksb+1;
}
if (tmp1.getfirst LSCHET = tsok) {};
if (tmp6.getfirst Persons = tsok) {nf:=tmp6.persons.fio};
If (tmp4.getfirst PRNARYAD = tsok) {}
sch:=0;
tmp4._loop  PRNARYAD
{
sch:=sch+tmp4.PRNARYAD.CHASF;
}
p3:=tmp3.SYS_NAR.SUMMANAR;
p4:=SummaStoimLsh-p3;
p5:=tmp4.PRNARYAD.PROC;
p6:=(p3+p4)*p5/100;
cKau:=0;
wKau:=0;
for (i := 1; i<=6; i := i+1)
{
  if(tmp4.PRNARYAD.TBLD[i]=40)
  {
     cKau:=tmp4.PRNARYAD.CKAUD[i];
     wKau:=40;
  }
}
nk:= if(GetAnyKAU(cgAkSimple, wKau, cKau),GivenAnName(1), '');
dat1:=tmp3.SYS_NAR.DATOK;
pos_x:=pos_x+1;

xlSetCellStringValue(My_Organization, pos_x, 1, pos_x, 1);
pos_x:=pos_x+1;
xlSetCellStringValue('Наименование объекта: '+nk, pos_x, 1, pos_x, 1);
xlSetCellStringValue('УТВЕРЖДАЮ', pos_x, 13, pos_x, 13);
pos_x:=pos_x+1;
xlSetCellStringValue('Ведомость распределения заработной платы бригады', pos_x, 1, pos_x, 1);
pos_x:=pos_x+1;
xlSetCellStringValue('к наряду № ___  ' + LoCase(DateToStr(dat1,'за Month YYYY г.')), pos_x, 1, pos_x, 1);
xlSetCellStringValue('Причины снижения премии с указанием виновных лиц:', pos_x, 6, pos_x, 6);
pos_x:=pos_x+1;
xlSetCellStringValue('бригада в количестве ' + ksb + ' чел.', pos_x, 1, pos_x, 1);
pos_x:=pos_x+1;
xlSetCellStringValue('Бригадир - ' + Substr(nf,1,Pos(' ',nf)-1) +' '+ Substr(nf,Pos(' ',nf)+1,1)+'.'+Substr(nf,Pos(' ',Substr(nf,Pos(' ',nf)+1,Length(nf)))+Pos(' ',nf)+1,1) + '.', pos_x, 1, pos_x, 1);
pos_x:=pos_x+1;
xlSetCellStringValue('производитель работ', pos_x, 1, pos_x, 1);
pos_x:=pos_x+1;
xlSetCellStringValue('п.1. Всего закрыто по наряду сдельно:', pos_x, 1, pos_x, 1);
xlSetCellStringValue(SummaStoimLsh, pos_x, 4, pos_x, 4);
xlSetCellStringValue('руб. (п.___Положения об оплате)', pos_x, 5, pos_x, 5);
pos_x:=pos_x+1;
xlSetCellStringValue('п.2. Фактически отработано часов по наряду: ', pos_x, 1, pos_x, 1);
xlSetCellStringValue(sch, pos_x, 4, pos_x, 4);
xlSetCellStringValue('час', pos_x, 5, pos_x, 5);
pos_x:=pos_x+1;
xlSetCellStringValue('п.3. Оплачено по тарифу:', pos_x, 1, pos_x, 1);
xlSetCellStringValue(p3, pos_x, 4, pos_x, 4);
xlSetCellStringValue('руб. (п.___Положения об оплате)', pos_x, 5, pos_x, 5);
pos_x:=pos_x+1;
xlSetCellStringValue('п.4. Приработок (п.1-п.3): ', pos_x, 1, pos_x, 1);
xlSetCellStringValue(p4, pos_x, 4, pos_x, 4);
xlSetCellStringValue('руб. (п.___Положения об оплате)', pos_x, 5, pos_x, 5);
pos_x:=pos_x+1;
xlSetCellStringValue('п.5. Размер премии', pos_x, 1, pos_x, 1);
xlSetCellStringValue(p5, pos_x, 4, pos_x, 4);
xlSetCellStringValue('%     (п.___ Положения о премировании)', pos_x, 5, pos_x, 5);
pos_x:=pos_x+1;
xlSetCellStringValue('п.6. Фонд премирования (п.3+п.4)*п.5:', pos_x, 1, pos_x, 1);
xlSetCellStringValue(p6, pos_x, 4, pos_x, 4);
xlSetCellStringValue('руб.', pos_x, 5, pos_x, 5);
pos_x:=pos_x+2;
xlSetCellStringValue('№', pos_x, 1, pos_x, 1);
xlSetCellStringValue('Таб.№', pos_x, 2, pos_x, 2);
xlSetCellStringValue('ФИО', pos_x, 3, pos_x, 3);
xlSetCellStringValue('Профессия, должность', pos_x, 4, pos_x, 4);
xlSetCellStringValue('Разряд', pos_x, 5, pos_x, 5);
xlSetCellStringValue('Тар. ставка', pos_x, 6, pos_x, 6);
xlSetCellStringValue('Дата начала', pos_x, 7, pos_x, 7);
xlSetCellStringValue('Дата окончания', pos_x, 8, pos_x, 8);
xlSetCellStringValue('Отработано часов', pos_x, 9, pos_x, 9);
xlSetCellStringValue('Основная заработная плата по тарифу', pos_x, 10, pos_x, 10);
xlSetCellStringValue('КТУ', pos_x, 11, pos_x, 11);
xlSetCellStringValue('КТУ с учетом отраб. времени', pos_x, 12, pos_x, 12);
xlSetCellStringValue('Распределение приработка с премией', pos_x, 13, pos_x, 13);
xlSetCellStringValue('Всего', pos_x, 14, pos_x, 14);
pos_x:=pos_x+1;
xlSetCellStringValue('1', pos_x, 1, pos_x, 1);
xlSetCellStringValue('2', pos_x, 3, pos_x, 3);
xlSetCellStringValue('3', pos_x, 4, pos_x, 4);
xlSetCellStringValue('4', pos_x, 5, pos_x, 5);
xlSetCellStringValue('5', pos_x, 6, pos_x, 6);
xlSetCellStringValue('6', pos_x, 9, pos_x, 9);
xlSetCellStringValue('7', pos_x, 10, pos_x, 10);
xlSetCellStringValue('8', pos_x, 11, pos_x, 11);
xlSetCellStringValue('9', pos_x, 12, pos_x, 12);
xlSetCellStringValue('10', pos_x, 13, pos_x, 13);
xlSetCellStringValue('11', pos_x, 14, pos_x, 14);
end.
.begin
sum_CHASF   := 0;
sum_SUMKTY := 0;
sum_SUMMA   := 0;
sum_SUMMPREM:= 0;
sum_AGRSUM  := 0;
end.
.{CheckEnter VEDNAR_JOBLOOP
.begin
PersonalAccountCount := 0
end.
.{CheckEnter VEDNAR_PERSONALACCOUNTLOOP
.begin
If (tmp.getfirst PRNARYAD = tsok) {cls:=tmp.PRNARYAD.CLSCH};
If (tmp1.getfirst LSCHET = tsok) {cpost:=tmp1.LSCHET.CAPPOINT};
If (tmp2.getfirst CATALOGS = tsok) {npost:=tmp2.CATALOGS.NAME};
pos_x:=pos_x+1;
xlSetCellStringValue(NP, pos_x, 1, pos_x, 1);
xlSetCellStringValue(TABN, pos_x, 2, pos_x, 2);
xlSetCellStringValue(FIO, pos_x, 3, pos_x, 3);
xlSetCellStringValue(npost, pos_x, 4, pos_x, 4);
xlSetCellStringValue(razr, pos_x, 5, pos_x, 5);
xlSetCellStringValue(DoubleToStr(tarif,'666666666666.8899'), pos_x, 6, pos_x, 6);
xlSetCellStringValue(DatetoStr(StrToDate(Datan,'DD/MM/YYYY'),'DD.MM.YYYY'), pos_x, 7, pos_x, 7);
xlSetCellStringValue(DatetoStr(StrToDate(Datok,'DD/MM/YYYY'),'DD.MM.YYYY'), pos_x, 8, pos_x, 8);
xlSetCellStringValue(DoubleToStr(CHASF,'666666666666.8899'), pos_x, 9, pos_x, 9);
xlSetCellStringValue(DoubleToStr(SUMMA,'666666666666.8899'), pos_x, 10, pos_x, 10);
xlSetCellStringValue(DoubleToStr(double(KTY),'666666666666.8899'), pos_x, 11, pos_x, 11);
xlSetCellStringValue(DoubleToStr(SUMMA*double(KTY),'666666666666.8899'), pos_x, 12, pos_x, 12);
xlSetCellStringValue(DoubleToStr(SUMMPREM,'666666666666.8899'), pos_x, 13, pos_x, 13);
xlSetCellStringValue(DoubleToStr(SUMMA + SUMMPREM,'666666666666.8899'), pos_x, 14, pos_x, 14);
Inc(PersonalAccountCount)
sum_CHASF   := sum_CHASF+ CHASF;
sum_SUMKTY := sum_SUMKTY+ (SUMMA*double(KTY));
sum_SUMMA   := sum_SUMMA+ SUMMA;
sum_SUMMPREM:= sum_SUMMPREM+ SUMMPREM;
sum_AGRSUM  := sum_AGRSUM+ SUMMA+ SUMMPREM;
end.
.{CheckEnter VEDNAR_JOBADDITIONALPAYMENTLOOP
.}
.}
.{?internal;PersonalAccountCount > 1
.}
.}
.begin
pos_x:=pos_x+1;
xlSetCellStringValue('Итого:', pos_x, 3, pos_x, 3);
xlSetCellStringValue(DoubleToStr(sum_CHASF,'666666666666.8899'), pos_x, 9, pos_x, 9);
xlSetCellStringValue(DoubleToStr(sum_SUMMA,'666666666666.8899'), pos_x, 10, pos_x, 10);
xlSetCellStringValue(DoubleToStr(sum_SUMKTY,'666666666666.8899'), pos_x, 12, pos_x, 12);
xlSetCellStringValue(DoubleToStr(sum_SUMMPREM,'666666666666.8899'), pos_x, 13, pos_x, 13);
xlSetCellStringValue(DoubleToStr(sum_AGRSUM,'666666666666.8899'), pos_x, 14, pos_x, 14);
pos_x:=pos_x+1;
end.
.}
.}
.}
.begin
 xlSetCellStringValue('     ', pos_x, 1, pos_x, 1);
 xlImportModule('\\fs01-tns.tns.transneft.ru\apps\gal\Resources_Sources\Z_MP\frm\VedNar.bas');
 xlRunMacro('VedNar');
 xlKillExcel;                       // Окончание работы с Excel
 VEDNAR_01_PER_TNS.fexit;
end.
.endform
