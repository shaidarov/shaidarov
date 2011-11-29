Attribute VB_Name = "ImportedModule"

' Сама сводная таблица
Public MyPivotCacheSvod As PivotCache
Public Function MakePivotTable(ByVal PivotTableTemplID As Integer) As Boolean


    Dim OkFlag As Boolean
    Dim i, j, k As Long
    Dim AnaliticsArray() As String


'    On Error GoTo CustomError

        For k = 1 To 1


'Расход ТТН
'<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<

 MakePivotTable = False

        Set DestinationSheet = DestinationWB.Sheets.Add
        Set DestinationRange = DestinationSheet.Cells(7, 1)

            ' ------------------ Создаем таблицу ------------------
        Set MyPivotTable = MyPivotCache.CreatePivotTable(TableDestination:=DestinationRange)

        ' ------------------ печатаем заголовки------------------
        MyPivotTable.PrintTitles = True
        ' ------------------ объединять ячейки контрагента------------------

        UpdateAllFields


        Select Case k

        Case 1

            ' ------------------ добавление полей данных ------------------

            With MyPivotTable.PivotFields("Стоимость без НДС")
                 .Orientation = xlDataField
                 .Position = 1
                 .NumberFormat = "#,##0"
            End With

            With MyPivotTable.PivotFields("НДС")
                 .Orientation = xlDataField
                 .Position = 2
                 .NumberFormat = "#,##0"
            End With

            With MyPivotTable.PivotFields("Налог с продаж")
                 .Orientation = xlDataField
                 .Position = 3
                 .NumberFormat = "#,##0"
            End With
            With MyPivotTable.PivotFields("Итого")
                 .Orientation = xlDataField
                 .Position = 4
                 .NumberFormat = "#,##0"
            End With

        ' ------------------ Именуем лист ------------------
        j = 1
        SheetName = "Расход ТТН"


        DestinationSheet.Name = SheetName
        Windows(DestinationWB.Name).Activate
        DestinationSheet.Select
        ActiveWindow.Zoom = 85
        MakePivotTable = True

    With Sheets("Расход ТТН").PivotTables(1).DataPivotField
        .Orientation = xlColumnField
        .Position = 1
    End With



Sheets("Расход ТТН").PivotTables(1).PivotFields( _
        "Сумма по полю Стоимость без НДС").Caption = " Стоимость без НДС"


Sheets("Расход ТТН").PivotTables(1).PivotFields( _
        "Сумма по полю Налог с продаж").Caption = " Налог с продаж"

Sheets("Расход ТТН").PivotTables(1).PivotFields( _
        "Сумма по полю НДС").Caption = " НДС"

Sheets("Расход ТТН").PivotTables(1).PivotFields( _
        "Сумма по полю Итого").Caption = " Итого"


            ' ------------------ Создаем поля таблицы ------------------


            MyPivotTable.AddFields _
                PageFields:=Array("МОЛ"), _
                RowFields:=Array("Контрагент к взаиморасчетам", "Номер ТТН", "Дата выписки ТТН")

                ' ------------------ Удаляем лишние итоги------------------
            MyPivotTable.PivotFields("Номер ТТН").Subtotals = _
            Array(False, False, False, False, False, False, False, False, False, False, False, False)

            MyPivotTable.PivotFields("Дата выписки ТТН").Subtotals = _
            Array(False, False, False, False, False, False, False, False, False, False, False, False)




           ' ------------------ убираем автоформат------------------
           MyPivotTable.HasAutoFormat = False


            DestinationSheet.Cells(3, 2) = "Расход товарно-материальных ценностей c " _
            + CStr(ParametersSheet.Cells(1, 4).Value) _
            + " по " + CStr(ParametersSheet.Cells(2, 4).Value)


            With DestinationSheet.Cells(3, 2).Font
                .Bold = True
                .Name = "Arial"
                .Size = 12
            End With


DestinationSheet.Columns("A:A").ColumnWidth = 16.5
DestinationSheet.Columns("B:B").ColumnWidth = 11.6
DestinationSheet.Columns("C:C").ColumnWidth = 12.3
DestinationSheet.Columns("D:D").ColumnWidth = 20#
DestinationSheet.Columns("E:E").ColumnWidth = 16#
DestinationSheet.Columns("F:F").ColumnWidth = 12#
DestinationSheet.Columns("G:G").ColumnWidth = 21#
DestinationSheet.Rows("8:8").RowHeight = 40.5

Rows("7:7").EntireRow.Hidden = True


With DestinationSheet.PageSetup
        .PrintTitleRows = "$8:$8"
        .PrintTitleColumns = "$A:$E"
        .PaperSize = xlPaperA4
        .Orientation = xlPortrait
        .LeftMargin = Application.InchesToPoints(0.78740157480315)
        .RightMargin = Application.InchesToPoints(0.393700787401575)
        .TopMargin = Application.InchesToPoints(0.590551181102362)
        .BottomMargin = Application.InchesToPoints(0.590551181102362)
        .HeaderMargin = Application.InchesToPoints(0.511811023622047)
        .FooterMargin = Application.InchesToPoints(0.393700787401575)
        .FirstPageNumber = xlAutomatic
        .CenterFooter = "Страница &P"
        .FitToPagesWide = 1
        .FitToPagesTall = False
        .Zoom = 80
End With

With DestinationSheet.Range("A8:AZ8")
        .HorizontalAlignment = xlCenter
        .VerticalAlignment = xlCenter
        .WrapText = True
        .Orientation = 0
        .AddIndent = False
        .IndentLevel = 0
        .ShrinkToFit = False
        .ReadingOrder = xlContext
        .MergeCells = False
    End With



        Case 2



        End Select

    With ActiveSheet.PivotTables(1).PivotFields("Контрагент к взаиморасчетам")
        .LayoutBlankLine = True
        .LayoutSubtotalLocation = xlAtTop
        .LayoutForm = xlOutline
    End With



    With DestinationSheet.Range("A8:G8")
        .HorizontalAlignment = xlCenter
        .VerticalAlignment = xlCenter
        .WrapText = True
        .Orientation = 0
        .AddIndent = False
        .IndentLevel = 0
        .ShrinkToFit = False
        .ReadingOrder = xlContext
        .MergeCells = False
    End With

'Расход ТТН
'>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>



'Расход ТМЦ
'<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<


 MakePivotTable = False

        Set DestinationSheet = DestinationWB.Sheets.Add
        Set DestinationRange = DestinationSheet.Cells(7, 1)

            ' ------------------ Создаем таблицу ------------------
        Set MyPivotTable = MyPivotCache.CreatePivotTable(TableDestination:=DestinationRange)

        ' ------------------ печатаем заголовки------------------
        MyPivotTable.PrintTitles = True
        ' ------------------ объединять ячейки контрагента------------------

        UpdateAllFields


        Select Case k

        Case 1

            ' ------------------ добавление полей данных ------------------

            With MyPivotTable.PivotFields("Стоимость без НДС")
                 .Orientation = xlDataField
                 .Position = 1
                 .NumberFormat = "#,##0"
            End With

            With MyPivotTable.PivotFields("НДС")
                 .Orientation = xlDataField
                 .Position = 2
                 .NumberFormat = "#,##0"
            End With

            With MyPivotTable.PivotFields("Налог с продаж")
                 .Orientation = xlDataField
                 .Position = 3
                 .NumberFormat = "#,##0"
            End With
            With MyPivotTable.PivotFields("Итого")
                 .Orientation = xlDataField
                 .Position = 4
                 .NumberFormat = "#,##0"
            End With

        ' ------------------ Именуем лист ------------------
        j = 1
        SheetName = "Расход ТМЦ"


        DestinationSheet.Name = SheetName
        Windows(DestinationWB.Name).Activate
        DestinationSheet.Select
        ActiveWindow.Zoom = 85
        MakePivotTable = True

    With Sheets("Расход ТМЦ").PivotTables(1).DataPivotField
        .Orientation = xlColumnField
        .Position = 1
    End With



Sheets("Расход ТМЦ").PivotTables(1).PivotFields( _
        "Сумма по полю Стоимость без НДС").Caption = " Стоимость без НДС"


Sheets("Расход ТМЦ").PivotTables(1).PivotFields( _
        "Сумма по полю Налог с продаж").Caption = " Налог с продаж"

Sheets("Расход ТМЦ").PivotTables(1).PivotFields( _
        "Сумма по полю НДС").Caption = " НДС"

Sheets("Расход ТМЦ").PivotTables(1).PivotFields( _
        "Сумма по полю Итого").Caption = " Итого"




            ' ------------------ Создаем поля таблицы ------------------


            MyPivotTable.AddFields _
                PageFields:=Array("МОЛ"), _
                RowFields:=Array("Контрагент к взаиморасчетам", "Номер ТТН", "Дата выписки ТТН", "Наименование продукции", "Количество фактическое", "Уч ед")

                ' ------------------ Удаляем лишние итоги------------------
            MyPivotTable.PivotFields("Дата выписки ТТН").Subtotals = _
            Array(False, False, False, False, False, False, False, False, False, False, False, False)

            MyPivotTable.PivotFields("Наименование продукции").Subtotals = _
            Array(False, False, False, False, False, False, False, False, False, False, False, False)

            MyPivotTable.PivotFields("Количество фактическое").Subtotals = _
            Array(False, False, False, False, False, False, False, False, False, False, False, False)


           ' ------------------ убираем автоформат------------------
           MyPivotTable.HasAutoFormat = False



            With MyPivotTable.RowFields("Количество фактическое")
                 .Orientation = xlRowField
                 .NumberFormat = "#,##0.00"
            End With


            DestinationSheet.Cells(3, 4) = "Расход товарно-материальных ценностей c " _
            + CStr(ParametersSheet.Cells(1, 4).Value) _
            + " по " + CStr(ParametersSheet.Cells(2, 4).Value)


            With DestinationSheet.Cells(3, 4).Font
                .Bold = True
                .Name = "Arial"
                .Size = 12
            End With


DestinationSheet.Columns("A:A").ColumnWidth = 16.5
DestinationSheet.Columns("B:B").ColumnWidth = 8#
DestinationSheet.Columns("C:C").ColumnWidth = 12.3
DestinationSheet.Columns("D:D").ColumnWidth = 58#
DestinationSheet.Columns("E:E").ColumnWidth = 12#
DestinationSheet.Columns("F:F").ColumnWidth = 8#
DestinationSheet.Columns("G:G").ColumnWidth = 17#
DestinationSheet.Columns("H:H").ColumnWidth = 13#
DestinationSheet.Columns("I:I").ColumnWidth = 13#
DestinationSheet.Columns("J:J").ColumnWidth = 17#
DestinationSheet.Rows("8:8").RowHeight = 40.5

Rows("7:7").EntireRow.Hidden = True

With DestinationSheet.PageSetup
        .PrintTitleRows = "$8:$8"
        .PrintTitleColumns = "$A:$E"
        .PaperSize = xlPaperA4
        .Orientation = xlLandscape
        .LeftMargin = Application.InchesToPoints(0.78740157480315)
        .RightMargin = Application.InchesToPoints(0.393700787401575)
        .TopMargin = Application.InchesToPoints(0.590551181102362)
        .BottomMargin = Application.InchesToPoints(0.590551181102362)
        .HeaderMargin = Application.InchesToPoints(0.511811023622047)
        .FooterMargin = Application.InchesToPoints(0.393700787401575)
        .FirstPageNumber = xlAutomatic
        .CenterFooter = "Страница &P"
        .FitToPagesWide = 1
        .FitToPagesTall = False
        .Zoom = 75
End With

With DestinationSheet.Range("A8:AZ8")
        .HorizontalAlignment = xlCenter
        .VerticalAlignment = xlCenter
        .WrapText = True
        .Orientation = 0
        .AddIndent = False
        .IndentLevel = 0
        .ShrinkToFit = False
        .ReadingOrder = xlContext
        .MergeCells = False
    End With



        Case 2



        End Select


    With ActiveSheet.PivotTables(1).PivotFields("Контрагент к взаиморасчетам")
        .LayoutBlankLine = True
        .LayoutSubtotalLocation = xlAtTop
        .LayoutForm = xlOutline
    End With



    With DestinationSheet.Range("A8:G8")
        .HorizontalAlignment = xlCenter
        .VerticalAlignment = xlCenter
        .WrapText = True
        .Orientation = 0
        .AddIndent = False
        .IndentLevel = 0
        .ShrinkToFit = False
        .ReadingOrder = xlContext
        .MergeCells = False
    End With
         
'Расход ТМЦ
'>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>



Next k
    Exit Function



CustomError:
        ActiveWindow.Zoom = 85
        MakePivotTable = False
End Function


Public Function CheckFieldItem(PT As PivotTable, FieldName As String, FieldItemName As String) As Boolean
    Dim i As Long
    CheckFieldItem = False
    For i = 1 To PT.PivotFields(FieldName).PivotItems.Count
        If PT.PivotFields(FieldName).PivotItems(i).Name = FieldItemName Then CheckFieldItem = True
    Next i
End Function




