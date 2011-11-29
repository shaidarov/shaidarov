Attribute VB_Name = "ImportedModule"

' Сама сводная таблица
Public MyPivotCacheSvod As PivotCache
Public Function MakePivotTable(ByVal PivotTableTemplID As Integer) As Boolean


    Dim OkFlag As Boolean
    Dim i, j, k As Long
    Dim AnaliticsArray() As String


'    On Error GoTo CustomError

        For k = 1 To 1


'Расход актов
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

            With MyPivotTable.PivotFields("Сумма акта с НДС")
                 .Orientation = xlDataField
                 .Position = 1
                 .NumberFormat = "#,##0"
            End With

            With MyPivotTable.PivotFields("НДС по акту")
                 .Orientation = xlDataField
                 .Position = 2
                 .NumberFormat = "#,##0"
            End With

            With MyPivotTable.PivotFields("Сумма акта с НДС в валюте")
                 .Orientation = xlDataField
                 .Position = 3
                 .NumberFormat = "#,##0"
            End With


        ' ------------------ Именуем лист ------------------
        j = 1
        SheetName = "Расход Актов"


        DestinationSheet.Name = SheetName
        Windows(DestinationWB.Name).Activate
        DestinationSheet.Select
        ActiveWindow.Zoom = 70
        MakePivotTable = True

    With Sheets("Расход Актов").PivotTables(1).DataPivotField
        .Orientation = xlColumnField
        .Position = 1
    End With



Sheets("Расход Актов").PivotTables(1).PivotFields( _
        "Сумма по полю Сумма акта с НДС").Caption = " Сумма акта с НДС"


Sheets("Расход Актов").PivotTables(1).PivotFields( _
        "Сумма по полю НДС по акту").Caption = " НДС по акту"

Sheets("Расход Актов").PivotTables(1).PivotFields( _
        "Сумма по полю Сумма акта с НДС в валюте").Caption = " Сумма акта с НДС в валюте"

            ' ------------------ Создаем поля таблицы ------------------


            MyPivotTable.AddFields _
                RowFields:=Array("Группа услуг", "№ договора", "Дата договора", "Дата окончания договора", "Заказчик", "Сумма договора", "НДС по договору", "Вал", "Отдел по договору", "Статус договора", "Номер акта", "Дата акта", "Услуга")

                ' ------------------ Удаляем лишние итоги------------------
            MyPivotTable.PivotFields("№ договора").Subtotals = _
            Array(False, False, False, False, False, False, False, False, False, False, False, False)

            MyPivotTable.PivotFields("Дата договора").Subtotals = _
            Array(False, False, False, False, False, False, False, False, False, False, False, False)

            MyPivotTable.PivotFields("Дата окончания договора").Subtotals = _
            Array(False, False, False, False, False, False, False, False, False, False, False, False)

            MyPivotTable.PivotFields("Заказчик").Subtotals = _
            Array(False, False, False, False, False, False, False, False, False, False, False, False)

            MyPivotTable.PivotFields("Сумма договора").Subtotals = _
            Array(False, False, False, False, False, False, False, False, False, False, False, False)

            MyPivotTable.PivotFields("НДС по договору").Subtotals = _
            Array(False, False, False, False, False, False, False, False, False, False, False, False)

            MyPivotTable.PivotFields("Вал").Subtotals = _
            Array(False, False, False, False, False, False, False, False, False, False, False, False)

            MyPivotTable.PivotFields("Отдел по договору").Subtotals = _
            Array(False, False, False, False, False, False, False, False, False, False, False, False)

            MyPivotTable.PivotFields("Статус договора").Subtotals = _
            Array(False, False, False, False, False, False, False, False, False, False, False, False)

            MyPivotTable.PivotFields("Номер акта").Subtotals = _
            Array(False, False, False, False, False, False, False, False, False, False, False, False)

            MyPivotTable.PivotFields("Дата акта").Subtotals = _
            Array(False, False, False, False, False, False, False, False, False, False, False, False)

            MyPivotTable.PivotFields("Услуга").Subtotals = _
            Array(False, False, False, False, False, False, False, False, False, False, False, False)




           ' ------------------ убираем автоформат------------------
           MyPivotTable.HasAutoFormat = False


            DestinationSheet.Cells(3, 2) = "Справка о выполнении объёмов c " _
            + CStr(ParametersSheet.Cells(1, 4).Value) _
            + " по " + CStr(ParametersSheet.Cells(2, 4).Value)


            With DestinationSheet.Cells(3, 2).Font
                .Bold = True
                .Name = "Arial"
                .Size = 12
            End With


DestinationSheet.Columns("A:A").ColumnWidth = 0.15
DestinationSheet.Columns("B:B").ColumnWidth = 10.14
DestinationSheet.Columns("C:C").ColumnWidth = 9.86
DestinationSheet.Columns("D:D").ColumnWidth = 9.57
DestinationSheet.Columns("E:E").ColumnWidth = 28.14
DestinationSheet.Columns("F:F").ColumnWidth = 15.29
DestinationSheet.Columns("G:G").ColumnWidth = 14.71
DestinationSheet.Columns("H:H").ColumnWidth = 6.71
DestinationSheet.Columns("I:I").ColumnWidth = 8.14
DestinationSheet.Columns("J:J").ColumnWidth = 13.14
DestinationSheet.Columns("K:K").ColumnWidth = 11#
DestinationSheet.Columns("L:L").ColumnWidth = 9.71
DestinationSheet.Columns("M:M").ColumnWidth = 45.14
DestinationSheet.Columns("N:N").ColumnWidth = 20.71
DestinationSheet.Columns("O:O").ColumnWidth = 18.43
DestinationSheet.Columns("P:P").ColumnWidth = 12#
DestinationSheet.Rows("8:8").RowHeight = 42

Rows("7:7").EntireRow.Hidden = True

With DestinationSheet.PageSetup
        .PrintTitleRows = "$8:$8"
        .PrintTitleColumns = "$A:$M"
        .PaperSize = xlPaperA4
        .Orientation = xlLandscape
        .LeftMargin = Application.InchesToPoints(0.31496062992126)
        .RightMargin = Application.InchesToPoints(0.196850393700787)
        .TopMargin = Application.InchesToPoints(0.393700787401575)
        .BottomMargin = Application.InchesToPoints(0.393700787401575)
        .HeaderMargin = Application.InchesToPoints(0.511811023622047)
        .FooterMargin = Application.InchesToPoints(0.196850393700787)
        .FirstPageNumber = xlAutomatic
        .CenterFooter = "Страница &P"
        .FitToPagesWide = 1
        .FitToPagesTall = False
        .Zoom = 60
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

    With ActiveSheet.PivotTables(1).PivotFields("Группа услуг")
        .LayoutBlankLine = True
'        .LayoutSubtotalLocation = xlAtTop
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


    Columns("F:G").NumberFormat = "#,##0"

    With Columns("M:M")
        .WrapText = True
        .Orientation = 0
        .AddIndent = False
        .ShrinkToFit = False
        .ReadingOrder = xlContext
        .MergeCells = False
    End With

'Расход актов
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







