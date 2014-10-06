.LinkForm 'PRINTAKTSPIS_1ongss' Prototype is 'PRINTAKTSPIS'
.NameInList 'Акт о списании товарно-материальных ценностей (ОНГСС)'
.var
  mfo_:String
  unn_:String
  okpo_:String
  Номер_члена_комиссии:Word
  Массив_Член_комиссии_nRec: ARRAY [1..2] of Comp
  Массив_Член_комиссии_ФИО: ARRAY [1..2] of String
  Массив_Член_комиссии_Табельный_Номер: ARRAY [1..2] of String
  Массив_Член_комиссии_Должность: ARRAY [1..2] of String
  pos_x,xx:Integer
  FBasName,Fmacros:String
  Stoim : double
  cenasp : double
  Itog  : double

.endvar
.Create  view A1
From
SpSopr
,KatSopr
Where
         ((
         SpSoprnrec == SpSopr.nRec
         ))
;


.fields
.endfields
.begin
  mfo_  := ' ' + sGetTune('KatOrg.FldView.MFO')  + ': ';
  unn_  := ' ' + sGetTune('KatOrg.FldView.UNN')  + ': ';
  okpo_ := ' ' + sGetTune('KatOrg.FldView.OKPO') + ': ';
end.
.{
.begin
  Номер_члена_комиссии := 0;


  for (Номер_члена_комиссии := 1; Номер_члена_комиссии <= Count(Массив_Член_комиссии_nRec); Номер_члена_комиссии := Номер_члена_комиссии + 1)
  {
    Массив_Член_комиссии_nRec            [Номер_члена_комиссии] := comp(0);
    Массив_Член_комиссии_ФИО             [Номер_члена_комиссии] := '';
    Массив_Член_комиссии_Табельный_Номер [Номер_члена_комиссии] := '';
    Массив_Член_комиссии_Должность       [Номер_члена_комиссии] := '';
  }

  Номер_члена_комиссии := 0;
end.
.{CheckEnter COMMISSIONMEMBER_PRINTAKTSPIS
.begin
  Номер_члена_комиссии := Номер_члена_комиссии + 1;
  Массив_Член_комиссии_nRec            [Номер_члена_комиссии] := Член_комиссии_nRec;
  Массив_Член_комиссии_ФИО             [Номер_члена_комиссии] := Член_комиссии_ФИО;
  Массив_Член_комиссии_Табельный_Номер [Номер_члена_комиссии] := string(Член_комиссии_Табельный_Номер);
  Массив_Член_комиссии_Должность       [Номер_члена_комиссии] := Член_комиссии_Должность;
end.
.}
.begin

  Номер_члена_комиссии := 0;

FBasName :=GetStringParameter('Files','TmpFilesDirectory',0)+'akt_spis.xls';
fmacros := GetStringParameter('Files','TmpFilesDirectory',0)+'macros.bas';
DeleteFile(FBasName);
xlCreateExcel(FBasName,true);
xlSetActiveWorkBookByName('akt_spis');
   xlGetSheetsCount(xx);
   while xx > 1
    do
     {
       xlSetActiveSheet(xx);
       xlDeleteSheet(xx);
       xlGetSheetsCount(xx);
     }
   xlSetSheetName(1,'Акт на списание');
   xlSetActiveSheet(1);
   pos_x:=1;

   xlSetCellStringValue('ООО '+Организация , pos_x, 1, pos_x, 1);
   xlSetFontSize(10, pos_x, 1, pos_x, 1);
   xlAlignCellsEx( 2, 2, pos_x, 1, pos_x, 1);
   xlSetCellStringValue('УТВЕРЖДАЮ:' , pos_x, 5, pos_x, 5);
   xlSetFontSize(10, pos_x, 5, pos_x, 5);
   xlAlignCellsEx( 2, 2, pos_x, 5, pos_x, 5);
   xlSetFontStyle( 1, pos_x, 5, pos_x, 5);
   xlMergeCells( pos_x, 5, pos_x, 7);
   pos_x:=pos_x+1;
   xlSetCellStringValue(Руководитель_должность , pos_x, 5, pos_x, 5);
   xlSetFontSize(10, pos_x, 5, pos_x, 5);
   xlAlignCellsEx( 2, 2, pos_x, 5, pos_x, 5);
   xlMergeCells( pos_x, 5, pos_x, 7);
   pos_x:=pos_x+1;
   xlSetCellStringValue(Руководитель_ФИО , pos_x, 5, pos_x, 5);
   xlSetFontSize(10, pos_x, 5, pos_x, 5);
   xlAlignCellsEx( 2, 2, pos_x, 5, pos_x, 5);
   xlMergeCells( pos_x, 5, pos_x, 7);
   xlWrapText(pos_x, 7, pos_x, 7);
   pos_x:=pos_x+1;
   xlMergeCells( pos_x, 5, pos_x, 6);
   xlFrameCells(8,2,7,0,pos_x, 5, pos_x, 6);
   xlSetCellStringValue(DateToStr(Дата, 'DD Mon YYYY')+'г.' , pos_x, 7, pos_x, 7);
   xlSetFontSize(8, pos_x, 7, pos_x, 7);
   xlAlignCellsEx( 2, 2, pos_x, 7, pos_x, 7);
   xlSetRowHeight(20, pos_x, 1, pos_x, 1);
   pos_x:=pos_x+1;
   xlSetCellStringValue('Подразделение:  '+Склад , pos_x, 1, pos_x, 1);
   xlSetFontSize(10, pos_x, 1, pos_x, 7);
   xlAlignCellsEx( 2, 2, pos_x, 1, pos_x, 7);
   xlMergeCells( pos_x, 1, pos_x, 7);
   xlWrapText(pos_x, 1, pos_x, 7);
   pos_x:=pos_x+1;
   xlSetCellStringValue('МОЛ:  '+МОЛ_Откуда , pos_x, 1, pos_x, 1);
   xlSetFontSize(10, pos_x, 1, pos_x, 7);
   xlAlignCellsEx( 2, 2, pos_x, 1, pos_x, 7);
   xlMergeCells( pos_x, 1, pos_x, 7);
   xlWrapText(pos_x, 1, pos_x, 7);
   pos_x:=pos_x+2;


   xlSetCellStringValue('АКТ №'+NOM+' от '+DateToStr(Дата, 'DD Mon YYYY')+'г.' , pos_x, 1, pos_x, 1);
   xlSetFontSize(12, pos_x, 1, pos_x, 7);
   xlMergeCells( pos_x, 1, pos_x, 7);
   xlAlignCellsEx( 3, 2, pos_x, 1, pos_x, 7);
   xlSetFontStyle( 1, pos_x, 1, pos_x, 7);
   pos_x:=pos_x+1;
   xlSetCellStringValue('на списание товарно-материальных ценностей' , pos_x, 1, pos_x, 1);
   xlSetFontSize(10, pos_x, 1, pos_x, 7);
   xlMergeCells( pos_x, 1, pos_x, 7);
   xlAlignCellsEx( 3, 2, pos_x, 1, pos_x, 7);
   xlSetFontStyle( 1, pos_x, 1, pos_x, 7);
   pos_x:=pos_x+2;

   xlSetCellStringValue('Код'                  , pos_x, 1, pos_x, 1);
   xlSetCellStringValue('Наименование'         , pos_x, 2, pos_x, 2);
   xlSetCellStringValue('Ед.изм.'              , pos_x, 3, pos_x, 3);
   xlSetCellStringValue('Кол-во'               , pos_x, 4, pos_x, 4);
   xlSetCellStringValue('Цена'                 , pos_x, 5, pos_x, 5);
   xlSetCellStringValue('Сумма'                , pos_x, 6, pos_x, 6);
   xlSetCellStringValue('Причина списания'     , pos_x, 7, pos_x, 7);

   xlSetFontSize (8, pos_x, 1, pos_x, 7);
   xlSetFontStyle( 1, pos_x, 1, pos_x, 7);
   xlAlignCellsEx( 3, 2, pos_x, 1, pos_x, 7);

   xlSetColumnWidth(10,  pos_x, 1, pos_x, 1);
   xlSetColumnWidth(20,  pos_x, 2, pos_x, 2);
   xlSetColumnWidth( 8,  pos_x, 3, pos_x, 3);
   xlSetColumnWidth( 6,  pos_x, 4, pos_x, 4);
   xlSetColumnWidth( 8,  pos_x, 5, pos_x, 5);
   xlSetColumnWidth(10,  pos_x, 6, pos_x, 6);
   xlSetColumnWidth(25,  pos_x, 7, pos_x, 7);

   xlFrameCells(15,2,7,0,pos_x, 1, pos_x, 1);
   xlFrameCells(15,2,7,0,pos_x, 2, pos_x, 2);
   xlFrameCells(15,2,7,0,pos_x, 3, pos_x, 3);
   xlFrameCells(15,2,7,0,pos_x, 4, pos_x, 4);
   xlFrameCells(15,2,7,0,pos_x, 5, pos_x, 5);
   xlFrameCells(15,2,7,0,pos_x, 6, pos_x, 6);
   xlFrameCells(15,2,7,0,pos_x, 7, pos_x, 7);

   xlWrapText(pos_x, 1, pos_x, 7);
   pos_x:=pos_x+1;
   Itog := 0;
   if a1.getfirst Katsopr where ((  НРЕКДОКУМЕНТА == KatSopr.nRec )) = tsOk
   Itog := KatSopr.Summa;
end.
.{
.}
.{
.begin
  xlSetCellStringValue(chr(39)+Код , pos_x, 1, pos_x, 1);
  xlSetFontSize(8, pos_x, 1, pos_x, 1);
  xlAlignCellsEx( 2, 2, pos_x, 1, pos_x, 1);
  xlSetCellStringValue(chr(39)+Наименование , pos_x, 2, pos_x, 2);
  xlSetFontSize(8, pos_x, 2, pos_x, 2);
  xlAlignCellsEx( 2, 2, pos_x, 2, pos_x, 2);
  xlSetCellStringValue(chr(39)+Отпускная_Единица_измерения , pos_x, 3, pos_x, 3);
  xlSetFontSize(8, pos_x, 3, pos_x, 3);
  xlAlignCellsEx( 2, 2, pos_x, 3, pos_x, 3);
  xlSetCellStringValue(doubletostr(Количество,'[|-]36`666`666`666`666.888'), pos_x, 4, pos_x, 4);
  xlSetFontSize(8, pos_x, 4, pos_x, 4);
  xlAlignCellsEx( 4, 2, pos_x, 4, pos_x, 4);
  cenasp := 0;
  if a1.getfirst SpSopr where (( SpSoprnRec == SpSopr.nRec)) = tsOk
     cenasp := a1.SpSopr.price;
  xlSetCellStringValue(Цена, pos_x, 5, pos_x, 5);
  xlSetFontSize(8, pos_x, 5, pos_x, 5);
  xlAlignCellsEx( 4, 2, pos_x, 5, pos_x, 5);
  Stoim := 0;
//  message(Цена);
  Stoim := cenasp*Количество;
  xlSetCellStringValue(Round(Stoim,2), pos_x, 6, pos_x, 6);

  xlSetFontSize(8, pos_x, 6, pos_x, 6);
  xlAlignCellsEx( 4, 2, pos_x, 6, pos_x, 6);
  xlSetCellStringValue(chr(39)+причина_списания , pos_x, 7, pos_x, 7);
  xlSetFontSize(8, pos_x, 7, pos_x, 7);
  xlAlignCellsEx( 2, 2, pos_x, 7, pos_x, 7);
  xlWrapText(pos_x, 1, pos_x, 7);

   xlFrameCells(15,2,7,0,pos_x, 1, pos_x, 1);
   xlFrameCells(15,2,7,0,pos_x, 2, pos_x, 2);
   xlFrameCells(15,2,7,0,pos_x, 3, pos_x, 3);
   xlFrameCells(15,2,7,0,pos_x, 4, pos_x, 4);
   xlFrameCells(15,2,7,0,pos_x, 5, pos_x, 5);
   xlFrameCells(15,2,7,0,pos_x, 6, pos_x, 6);
   xlFrameCells(15,2,7,0,pos_x, 7, pos_x, 7);

  pos_x:=pos_x+1;
//  Itog := Itog + Round(Stoim,2);
end.
.}
.begin
  xlMergeCells( pos_x, 1, pos_x, 5);
  xlSetCellStringValue('ИТОГО' , pos_x, 1, pos_x, 1);
  xlSetFontSize(8, pos_x, 1, pos_x, 1);
  xlAlignCellsEx( 2, 2, pos_x, 1, pos_x, 1);
  xlSetFontStyle( 1, pos_x, 1, pos_x, 7);

  xlSetCellStringValue(Round(Itog,2), pos_x, 6, pos_x, 6);
  xlSetFontSize(8, pos_x, 6, pos_x, 6);
  xlAlignCellsEx( 4, 2, pos_x, 6, pos_x, 6);

  xlFrameCells(15,2,7,0,pos_x, 1, pos_x, 5);
  xlFrameCells(15,2,7,0,pos_x, 6, pos_x, 6);
  xlFrameCells(15,2,7,0,pos_x, 7, pos_x, 7);

  pos_x:=pos_x+2;

  xlMergeCells( pos_x, 1, pos_x, 7);
  xlSetCellStringValue('Заключение комиссии: списать с подотчета '+МОЛ_Откуда , pos_x, 1, pos_x, 1);
  xlSetFontSize(10, pos_x, 1, pos_x, 7);
  xlAlignCellsEx( 2, 2, pos_x, 1, pos_x, 7);
  xlWrapText(pos_x, 1, pos_x, 7);
  pos_x:=pos_x+2;


end.
.{while (Номер_члена_комиссии < Количество_членов_комиссии)
.begin
  Номер_члена_комиссии := Номер_члена_комиссии + 1;
  xlMergeCells( pos_x, 1, pos_x, 4);
  xlSetCellStringValue(Массив_Член_комиссии_Должность [Номер_члена_комиссии], pos_x, 1, pos_x, 1);
  xlSetFontSize(8, pos_x, 1, pos_x, 1);
  xlAlignCellsEx( 2, 2, pos_x, 1, pos_x, 1);
  xlMergeCells( pos_x, 1, pos_x, 4);
  xlSetCellStringValue(Массив_Член_комиссии_ФИО [Номер_члена_комиссии], pos_x, 7, pos_x, 7);
  xlSetFontSize(8, pos_x, 7, pos_x, 7);
  xlAlignCellsEx( 2, 2, pos_x, 7, pos_x, 7);
  xlFrameCells(8,2,7,0,pos_x, 5, pos_x, 6);
  xlSetRowHeight(20, pos_x, 1, pos_x, 7);

  pos_x:=pos_x+1;

end.
.}
.begin
//DeleteFile(Fmacros);
//if not LogStrToFile(Fmacros, 'Sub macros()') message('Ошибка записи файла макроса '+fmacros);
LogStrToFile(Fmacros, '    With ActiveSheet.PageSetup                                        ');
LogStrToFile(Fmacros, '       .PrintTitleRows = "$11:$11"                                      ');
LogStrToFile(Fmacros, '       .LeftMargin = Application.InchesToPoints(0.72)                ');   // левое поле
LogStrToFile(Fmacros, '       .RightMargin = Application.InchesToPoints(0.1)                ');   // правое поле
LogStrToFile(Fmacros, '       .TopMargin = Application.InchesToPoints(0.2)                  ');   // верхнее поле
LogStrToFile(Fmacros, '       .BottomMargin = Application.InchesToPoints(0.2)               ');   // нижнее поле
LogStrToFile(Fmacros, '       .HeaderMargin = Application.InchesToPoints(0.32)              ');   // верхний колонтитул
LogStrToFile(Fmacros, '       .FooterMargin = Application.InchesToPoints(0.32)              ');   // нижний колонтитул
LogStrToFile(Fmacros, '    End With                                                          ');
LogStrToFile(Fmacros, 'End Sub                                                               ');
//if not xlImportModule(Fmacros) message ('Ошибка загрузки макроса');

xlGetSheetsCount(xx);
   while xx > 0
    do
     {
       xlSetActiveSheet(xx);
      // if not xlRunMacro('macros') message('Ошибка запуска макроса');
      // DeleteFile(Fmacros);
       xx:=xx-1;
     }
 xlKillExcel;
end.
.{?internal;(Количество_членов_комиссии = 0)
.}
.}
.begin
PRINTAKTSPIS.fexit;
end.
.endform
