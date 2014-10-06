.LinkForm 'PRINTAKTSPIS_1ongss234234' Prototype is 'PRINTAKTSPIS'
.NameInList 'Акт ввода документов в систему "Галактика" (ОНГСС)'
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
  np1 : integer

.endvar
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

FBasName :=GetStringParameter('Files','TmpFilesDirectory',0)+'akt_vvoda.xls';
fmacros := GetStringParameter('Files','TmpFilesDirectory',0)+'macros.bas';
DeleteFile(FBasName);
xlCreateExcel(FBasName,true);
xlSetActiveWorkBookByName('akt_vvoda');
   xlGetSheetsCount(xx);
   while xx > 1
    do
     {
       xlSetActiveSheet(xx);
       xlDeleteSheet(xx);
       xlGetSheetsCount(xx);
     }
   xlSetSheetName(1,'Акт ввода');
   xlSetActiveSheet(1);
   pos_x:=1;

   xlSetCellStringValue('ООО '+Организация , pos_x, 1, pos_x, 1);
   xlSetFontSize(10, pos_x, 1, pos_x, 1);
   xlAlignCellsEx( 2, 2, pos_x, 1, pos_x, 1);
   xlSetFontStyle( 1, pos_x, 1, pos_x, 6);
   pos_x:=pos_x+1;
   xlSetCellStringValue('Подразделение:  '+Склад , pos_x, 1, pos_x, 1);
   xlSetFontSize(10, pos_x, 1, pos_x, 6);
   xlAlignCellsEx( 2, 2, pos_x, 1, pos_x, 6);
   xlMergeCells( pos_x, 1, pos_x, 6);
   xlWrapText(pos_x, 1, pos_x, 6);
   pos_x:=pos_x+1;
   xlSetCellStringValue('МОЛ:  '+МОЛ_Откуда , pos_x, 1, pos_x, 1);
   xlSetFontSize(10, pos_x, 1, pos_x, 6);
   xlAlignCellsEx( 2, 2, pos_x, 1, pos_x, 6);
   xlMergeCells( pos_x, 1, pos_x, 6);
   xlWrapText(pos_x, 1, pos_x, 6);
   pos_x:=pos_x+2;


   xlSetCellStringValue('АКТ ввода документов в систему "Галактика"', pos_x, 1, pos_x, 1);
   xlSetFontSize(12, pos_x, 1, pos_x, 6);
   xlMergeCells( pos_x, 1, pos_x, 6);
   xlAlignCellsEx( 3, 2, pos_x, 1, pos_x, 6);
   xlSetFontStyle( 1, pos_x, 1, pos_x, 6);
   pos_x:=pos_x+1;
   xlSetCellStringValue('документ: Акт на списание №'+NOM+' от '+DateToStr(Дата, 'DD Mon YYYY')+'г.' , pos_x, 1, pos_x, 1);
   xlSetFontSize(10, pos_x, 1, pos_x, 6);
   xlMergeCells( pos_x, 1, pos_x, 6);
   xlAlignCellsEx( 3, 2, pos_x, 1, pos_x, 6);
   xlSetFontStyle( 1, pos_x, 1, pos_x, 6);
   pos_x:=pos_x+2;

   np1 := 1;

   xlSetCellStringValue('№'                    , pos_x, 1, pos_x, 1);
   xlSetCellStringValue('Код'                  , pos_x, 2, pos_x, 2);
   xlSetCellStringValue('Наименование'         , pos_x, 3, pos_x, 3);
   xlSetCellStringValue('Ед.изм.'              , pos_x, 4, pos_x, 4);
   xlSetCellStringValue('Кол-во'               , pos_x, 5, pos_x, 5);
   xlSetCellStringValue('Цена'                 , pos_x, 6, pos_x, 6);
   xlSetCellStringValue('Сумма'                , pos_x, 7, pos_x, 7);

   xlSetFontSize (8, pos_x, 1, pos_x, 6);
   xlSetFontStyle( 1, pos_x, 1, pos_x, 6);
   xlAlignCellsEx( 3, 2, pos_x, 1, pos_x, 6);

   xlSetColumnWidth(3 ,  pos_x, 1, pos_x, 1);
   xlSetColumnWidth(10,  pos_x, 2, pos_x, 2);
   xlSetColumnWidth(45,  pos_x, 3, pos_x, 3);
   xlSetColumnWidth( 8,  pos_x, 4, pos_x, 4);
   xlSetColumnWidth( 6,  pos_x, 5, pos_x, 5);
   xlSetColumnWidth( 8,  pos_x, 6, pos_x, 6);
   xlSetColumnWidth(10,  pos_x, 7, pos_x, 7);

   xlFrameCells(15,2,6,0,pos_x, 1, pos_x, 1);
   xlFrameCells(15,2,6,0,pos_x, 2, pos_x, 2);
   xlFrameCells(15,2,6,0,pos_x, 3, pos_x, 3);
   xlFrameCells(15,2,6,0,pos_x, 4, pos_x, 4);
   xlFrameCells(15,2,6,0,pos_x, 5, pos_x, 5);
   xlFrameCells(15,2,6,0,pos_x, 6, pos_x, 6);
   xlFrameCells(15,2,6,0,pos_x, 7, pos_x, 7);

   xlWrapText(pos_x, 1, pos_x, 7);
   pos_x:=pos_x+1;
end.
.{
.}
.{
.begin
  xlSetCellStringValue( np1 , pos_x, 1, pos_x, 1);
  xlSetFontSize(8, pos_x, 1, pos_x, 1);
  xlAlignCellsEx( 2, 2, pos_x, 1, pos_x, 1);
  xlSetCellStringValue(chr(39)+Код , pos_x, 2, pos_x, 2);
  xlSetFontSize(8, pos_x, 2, pos_x, 2);
  xlAlignCellsEx( 2, 2, pos_x, 2, pos_x, 2);
  xlSetCellStringValue(chr(39)+Наименование , pos_x, 3, pos_x, 3);
  xlSetFontSize(8, pos_x, 3, pos_x, 3);
  xlAlignCellsEx( 2, 2, pos_x, 3, pos_x, 3);
  xlSetCellStringValue(chr(39)+Отпускная_Единица_измерения , pos_x, 4, pos_x, 4);
  xlSetFontSize(8, pos_x, 4, pos_x, 4);
  xlAlignCellsEx( 2, 2, pos_x, 4, pos_x, 4);
  xlSetCellStringValue(doubletostr(Количество,'[|-]36`666`666`666`666.888'), pos_x, 5, pos_x, 5);
  xlSetFontSize(8, pos_x, 5, pos_x, 5);
  xlAlignCellsEx( 4, 2, pos_x, 5, pos_x, 5);
  xlSetCellStringValue(doubletostr(Цена,'[|-]36`666`666`666`666.88'), pos_x, 6, pos_x, 6);
  xlSetFontSize(8, pos_x, 6, pos_x, 6);
  xlAlignCellsEx( 4, 2, pos_x, 6, pos_x, 6);
  xlSetCellStringValue(doubletostr(Стоимость,'[|-]36`666`666`666`666.88'), pos_x, 7, pos_x, 7);
  xlSetFontSize(8, pos_x, 7, pos_x, 7);
  xlAlignCellsEx( 4, 2, pos_x, 7, pos_x, 7);

   xlFrameCells(15,2,6,0,pos_x, 1, pos_x, 1);
   xlFrameCells(15,2,6,0,pos_x, 2, pos_x, 2);
   xlFrameCells(15,2,6,0,pos_x, 3, pos_x, 3);
   xlFrameCells(15,2,6,0,pos_x, 4, pos_x, 4);
   xlFrameCells(15,2,6,0,pos_x, 5, pos_x, 5);
   xlFrameCells(15,2,6,0,pos_x, 6, pos_x, 6);
   xlFrameCells(15,2,6,0,pos_x, 7, pos_x, 7);

  pos_x:=pos_x+1;
  np1 := np1 + 1;
end.
.}
.begin
  xlMergeCells( pos_x, 1, pos_x, 6);
  xlSetCellStringValue('ИТОГО' , pos_x, 1, pos_x, 1);
  xlSetFontSize(8, pos_x, 1, pos_x, 1);
  xlAlignCellsEx( 2, 2, pos_x, 1, pos_x, 1);
  xlSetFontStyle( 1, pos_x, 1, pos_x, 7);

  xlSetCellStringValue(doubletostr(ИТОГО,'[|-]36`666`666`666`666.88'), pos_x, 7, pos_x, 7);
  xlSetFontSize(8, pos_x, 7, pos_x, 7);
  xlAlignCellsEx( 4, 2, pos_x, 7, pos_x, 7);

  xlFrameCells(15,2,6,0,pos_x, 1, pos_x, 6);
  xlFrameCells(15,2,6,0,pos_x, 7, pos_x, 7);

  pos_x:=pos_x+2;

  xlMergeCells( pos_x, 1, pos_x, 6);
  xlSetCellStringValue('Документ внесен в систему "Галактика"', pos_x, 1, pos_x, 1);
  xlSetFontSize(10, pos_x, 1, pos_x, 6);
  xlAlignCellsEx( 2, 2, pos_x, 1, pos_x, 6);
  xlWrapText(pos_x, 1, pos_x, 6);

  pos_x:=pos_x+2;

end.
.{while (Номер_члена_комиссии < Количество_членов_комиссии)
.begin
  Номер_члена_комиссии := Номер_члена_комиссии + 1;
  xlMergeCells( pos_x, 1, pos_x, 4);
  xlSetCellStringValue(Массив_Член_комиссии_Должность [Номер_члена_комиссии], pos_x, 1, pos_x, 1);
  xlSetFontSize(8, pos_x, 1, pos_x, 1);
  xlAlignCellsEx( 2, 2, pos_x, 1, pos_x, 1);
  xlMergeCells( pos_x, 1, pos_x, 2);
  xlSetCellStringValue(Массив_Член_комиссии_ФИО [Номер_члена_комиссии], pos_x, 5, pos_x, 5);
  xlSetFontSize(8, pos_x, 5, pos_x, 5);
  xlAlignCellsEx( 2, 2, pos_x, 5, pos_x, 5);
  xlFrameCells(8,2,6,0,pos_x, 3, pos_x, 4);
  xlSetRowHeight(20, pos_x, 1, pos_x, 6);

  pos_x:=pos_x+1;

end.
.}
.begin
DeleteFile(Fmacros);
if not LogStrToFile(Fmacros, 'Sub macros()') message('Ошибка записи файла макроса '+fmacros);
LogStrToFile(Fmacros, '    With ActiveSheet.PageSetup                                        ');
LogStrToFile(Fmacros, '       .PrintTitleRows = "$8:$8"                                      ');
LogStrToFile(Fmacros, '       .LeftMargin = Application.InchesToPoints(0.62)                ');   // левое поле
LogStrToFile(Fmacros, '       .RightMargin = Application.InchesToPoints(0.1)                ');   // правое поле
LogStrToFile(Fmacros, '       .TopMargin = Application.InchesToPoints(0.2)                  ');   // верхнее поле
LogStrToFile(Fmacros, '       .BottomMargin = Application.InchesToPoints(0.2)               ');   // нижнее поле
LogStrToFile(Fmacros, '       .HeaderMargin = Application.InchesToPoints(0.32)              ');   // верхний колонтитул
LogStrToFile(Fmacros, '       .FooterMargin = Application.InchesToPoints(0.32)              ');   // нижний колонтитул
LogStrToFile(Fmacros, '    End With                                                          ');
LogStrToFile(Fmacros, 'End Sub                                                               ');
if not xlImportModule(Fmacros) message ('Ошибка загрузки макроса');

xlGetSheetsCount(xx);
   while xx > 0
    do
     {
       xlSetActiveSheet(xx);
       if not xlRunMacro('macros') message('Ошибка запуска макроса');
       DeleteFile(Fmacros);
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
