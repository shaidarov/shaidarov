.LinkForm 'TAB_BRIG_PER_TNS' Prototype is 'BRIGADETBL'
.NameInList 'Табель учета рабочего времени по бригадам ТНС'
.var
  nf:String
  soz:String
  GetCode:String
  Nameobs:String
  fname:String
  FBasName:String
  b:Byte
  I:Byte
  razryad:Byte
  xtemp:Integer
  xobs:Integer
  x:Integer
  pos_x:Integer
  pos_y:Integer
  cKau:Comp
  cbrigadir:Comp
  cpersfio:Comp
  storg:String
  wKau:Word
.endvar
.Create  view tmp
  as Select
  BRIGAD.CLSCHET from BRIGAD
  Where((brignrec == BRIGAD.NREC))
;
.Create  view tmp1
  as Select
  LSCHET.TPERSON from LSCHET
  Where((cbrigadir==LSCHET.NREC))
;
.Create  view tmp2
  as Select
  Persons.FIO from Persons
  Where((cpersfio==Persons.Nrec))
;
.Create  view tls
  as Select
  Lschet.CSCHETD, Lschet.CSUBSCHD, Lschet.RAZR from Lschet
  Where((lschetnrec==Lschet.nrec))
;
.Create  view tpr
  as Select
  PEREXOD.CSCHETD, PEREXOD.CSUBSCHD, PEREXOD.RAZR from PEREXOD
  Where((perexodnrec==PEREXOD.nrec))
;
.fields
.endfields
.begin
    pos_x:=0;
    FBasName:=GetStringParameter('Files','OutputFilesDirectory',ifFirstParameter);
    FBasName:=FBasName+'Tab_brig.xls';
//    FBasName:='c:\Tab_brig.xls';
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
      xlSetSheetName(1,'табель по бригадам');        // имя первого листа
      xlSetActiveSheet(1);              // активен первый лист
end.

.{CheckEnter BRIGDATA
.begin
      nf:='';
      pos_x:=pos_x+1;
      if (tmp.getfirst BRIGAD = tsok) {cbrigadir:=tmp.BRIGAD.CLSCHET;}
      if (tmp1.getfirst LSCHET = tsok) {cpersfio:=tmp1.LSCHET.TPERSON;}
      if (tmp2.getfirst Persons = tsok) {nf:=tmp2.Persons.FIO;}
      storg:=sgettune('MYORG');
      xlSetCellStringValue(storg, pos_x, 1, pos_x, 1);
      pos_x:=pos_x+1;
      xlSetCellStringValue('ТАБЕЛЬ за            '+DatetoStr(date(1,wtMonth,wtYear),'Month'), pos_x, 1, pos_x, 1);
      xlSetCellStringValue(wtYear+'г.', pos_x, 4, pos_x, 4);
      xlSetCellStringValue('Наименование объекта:', pos_x, 5, pos_x, 5);
      xobs:=pos_x;
      pos_x:=pos_x+1;
      xlSetCellStringValue('к наряду № ___ от " __ "', pos_x, 1, pos_x, 1);
      xlSetCellStringValue(wtYear+'г.', pos_x, 4, pos_x, 4);
      xlSetCellStringValue('Утверждаю ответственный за объект : ____________________', pos_x, 17, pos_x, 17);
      pos_x:=pos_x+1;
      xlSetCellStringValue('бригада в количестве '+wrkinbrig+' чел.', pos_x, 1, pos_x, 1);
      pos_x:=pos_x+1;
      xlSetCellStringValue('Бригадир - '+Substr(nf,1,Pos(' ',nf)-1) +' '+ Substr(nf,Pos(' ',nf)+1,1)+'.'+Substr(nf,Pos(' ',Substr(nf,Pos(' ',nf)+1,Length(nf)))+Pos(' ',nf)+1,1) + '.', pos_x, 1, pos_x, 1);
      pos_x:=pos_x+2;
      xlSetCellStringValue('№ п/п', pos_x, 1, pos_x, 1);
      xlSetCellStringValue('Таб.№', pos_x, 2, pos_x, 2);
      xlSetCellStringValue('ФИО', pos_x, 3, pos_x, 3);
      xlSetCellStringValue('Професия, должность', pos_x, 4, pos_x, 4);
      xlSetCellStringValue('разряд', pos_x, 5, pos_x, 5);
      xlSetCellStringValue('тарифная ставка', pos_x, 6, pos_x, 6);
      xlSetCellStringValue('отметка о явках и неявках на работу по числам месяца', pos_x, 7, pos_x, 7);
      xlSetCellStringValue('Всего отработано часов', pos_x, 38, pos_x, 38);
      xlSetCellStringValue('из них ночные', pos_x, 39, pos_x, 39);
      xlSetCellStringValue('объект', pos_x, 40, pos_x, 40);
      xlSetCellStringValue('Б/С', pos_x, 41, pos_x, 41);
      pos_x:=pos_x+1;
      for (i := 7; i<=37; i := i+1) xlSetCellStringValue(i-6, pos_x, i, pos_x, i);
end.
.{CheckEnter WRKDATA
.begin
b:=0;
razryad:=0;
soz:='';
if perexodnrec<>0 {b:=1;}
if(b=0)
{
  if(tls.getfirst Lschet = tsok){};
}
else
{
  if(tpr.getfirst PEREXOD = tsok){};
}
  if(b=0)
  {
    razryad:=tls.Lschet.Razr;
    soz:=tls.Lschet.CSCHETD+tls.Lschet.CSUBSCHD;
  }
  else
  {
    razryad:=tpr.PEREXOD.Razr;
    soz:=tpr.PEREXOD.CSCHETD+tpr.PEREXOD.CSUBSCHD;
  }
cKau:=0;
wKau:=0;
GetCode:=0;
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
  if(GetAnyKAU(cgAkNoDef, wKau, cKau))
  {
    Nameobs := GivenAnName(1);
  }
  else
  {
    Nameobs := '';
  }
      pos_x:=pos_x+1;
      xlSetCellStringValue(wtNpp, pos_x, 1, pos_x, 1);
      xlSetCellStringValue(wtTabN, pos_x, 2, pos_x, 2);
      xlSetCellStringValue(wtFIO, pos_x, 3, pos_x, 3);
      xlSetCellStringValue(wtPost, pos_x, 4, pos_x, 4);
      xlSetCellStringValue(razryad, pos_x, 5, pos_x, 5);
      xlSetCellStringValue(wtSalary, pos_x, 6, pos_x, 6);
      xlSetCellStringValue(wtD01, pos_x, 7, pos_x, 7);
      xlSetCellStringValue(wtD02, pos_x, 8, pos_x, 8);
      xlSetCellStringValue(wtD03, pos_x, 9, pos_x, 9);
      xlSetCellStringValue(wtD04, pos_x, 10, pos_x, 10);
      xlSetCellStringValue(wtD05, pos_x, 11, pos_x, 11);
      xlSetCellStringValue(wtD06, pos_x, 12, pos_x, 12);
      xlSetCellStringValue(wtD07, pos_x, 13, pos_x, 13);
      xlSetCellStringValue(wtD08, pos_x, 14, pos_x, 14);
      xlSetCellStringValue(wtD09, pos_x, 15, pos_x, 15);
      xlSetCellStringValue(wtD10, pos_x, 16, pos_x, 16);
      xlSetCellStringValue(wtD11, pos_x, 17, pos_x, 17);
      xlSetCellStringValue(wtD12, pos_x, 18, pos_x, 18);
      xlSetCellStringValue(wtD13, pos_x, 19, pos_x, 19);
      xlSetCellStringValue(wtD14, pos_x, 20, pos_x, 20);
      xlSetCellStringValue(wtD15, pos_x, 21, pos_x, 21);
      xlSetCellStringValue(wtD16, pos_x, 22, pos_x, 22);
      xlSetCellStringValue(wtD17, pos_x, 23, pos_x, 23);
      xlSetCellStringValue(wtD18, pos_x, 24, pos_x, 24);
      xlSetCellStringValue(wtD19, pos_x, 25, pos_x, 25);
      xlSetCellStringValue(wtD20, pos_x, 26, pos_x, 26);
      xlSetCellStringValue(wtD21, pos_x, 27, pos_x, 27);
      xlSetCellStringValue(wtD22, pos_x, 28, pos_x, 28);
      xlSetCellStringValue(wtD23, pos_x, 29, pos_x, 29);
      xlSetCellStringValue(wtD24, pos_x, 30, pos_x, 30);
      xlSetCellStringValue(wtD25, pos_x, 31, pos_x, 31);
      xlSetCellStringValue(wtD26, pos_x, 32, pos_x, 32);
      xlSetCellStringValue(wtD27, pos_x, 33, pos_x, 33);
      xlSetCellStringValue(wtD28, pos_x, 34, pos_x, 34);
      xlSetCellStringValue(wtD29, pos_x, 35, pos_x, 35);
      xlSetCellStringValue(wtD30, pos_x, 36, pos_x, 36);
      xlSetCellStringValue(wtD31, pos_x, 37, pos_x, 37);
      xlSetCellStringValue(round(double(WorkingHours)), pos_x, 38, pos_x, 38);
      xlSetCellStringValue(NightHours, pos_x, 39, pos_x, 39);
      xlSetCellStringValue(GetCode, pos_x, 40, pos_x, 40);
      xlSetCellStringValue(soz, pos_x, 41, pos_x, 41);
end.
.}
.begin
      pos_x:=pos_x+1;
      xlSetCellStringValue('Итого:', pos_x, 3, pos_x, 3);
      xlSetCellStringValue(round(double(WorkingHoursSum)), pos_x, 38, pos_x, 38);
      xlSetCellStringValue(NightHoursSum, pos_x, 39, pos_x, 39);
      xlSetCellStringValue(Nameobs, xobs, 13, xobs, 13);
      pos_x:=pos_x+2;
      xlSetCellStringValue('Ответственное лицо', pos_x, 3, pos_x, 3);
      xlSetCellStringValue('Производитель работ', pos_x, 4, pos_x, 4);
      pos_x:=pos_x+1;
      xlSetCellStringValue('должность', pos_x, 4, pos_x, 4);
      xlSetCellStringValue('подпись', pos_x, 9, pos_x, 9);
      xlSetCellStringValue('расшифровка подписи', pos_x, 19, pos_x, 19);
      pos_x:=pos_x+2;
      xlSetCellStringValue('Работник кадровой службы', pos_x, 3, pos_x, 3);
      xlSetCellStringValue('Специалист по кадрам', pos_x, 4, pos_x, 4);
      pos_x:=pos_x+1;
      xtemp:=pos_x
      xlSetCellStringValue('должность', pos_x, 4, pos_x, 4);
      xlSetCellStringValue('подпись', pos_x, 9, pos_x, 9);
      xlSetCellStringValue('расшифровка подписи', pos_x, 19, pos_x, 19);
      pos_x:=pos_x+1;
end.
.}
.begin
   xlSetCellStringValue('     ', xtemp, 1, xtemp, 1);
   xlImportModule('\\fs01-tns.tns.transneft.ru\apps\gal\Resources_Sources\Z_WT\frm\tab_brig.bas');
   xlRunMacro('tab_brig');
   xlKillExcel;
   Tab_brig_Per_tns.fexit;
end.
.endform
