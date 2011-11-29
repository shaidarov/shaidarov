Attribute VB_Name = "ImportedModule"

' ���� ������� �������
Public MyPivotCacheSvod As PivotCache
Public Function MakePivotTable(ByVal PivotTableTemplID As Integer) As Boolean


    Dim OkFlag As Boolean
    Dim i, j, k As Long
    Dim AnaliticsArray() As String


'    On Error GoTo CustomError

        For k = 1 To 1


'������ ���������
'<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<

 MakePivotTable = False

        Set DestinationSheet = DestinationWB.Sheets.Add
        Set DestinationRange = DestinationSheet.Cells(7, 1)

            ' ------------------ ������� ������� ------------------
        Set MyPivotTable = MyPivotCache.CreatePivotTable(TableDestination:=DestinationRange)

        ' ------------------ �������� ���������------------------
        MyPivotTable.PrintTitles = True
        ' ------------------ ���������� ������ �����������------------------

        UpdateAllFields


        Select Case k

        Case 1

            ' ------------------ ���������� ����� ������ ------------------

            With MyPivotTable.PivotFields("����� ����")
                 .Orientation = xlDataField
                 .Position = 1
                 .NumberFormat = "#,##0"
                 .Function = xlSum
                 .Caption = " ����� ����"
            End With


        ' ------------------ ������� ���� ------------------
        j = 1
        SheetName = "������ ���������"


        DestinationSheet.Name = SheetName
        Windows(DestinationWB.Name).Activate
        DestinationSheet.Select
        ActiveWindow.Zoom = 85
        MakePivotTable = True


            ' ------------------ ������� ���� ������� ------------------


            MyPivotTable.AddFields _
                RowFields:=Array("����� �� ��������", "� ��������", "���� ��������", "���� ��������� ��������", _
                                 "����������", "������", "������ �� ��������", "����� ��������", "������", "� ����", "���� ����")

                ' ------------------ ������� ������ �����------------------
            MyPivotTable.PivotFields("� ��������").Subtotals = _
            Array(False, False, False, False, False, False, False, False, False, False, False, False)
            MyPivotTable.PivotFields("���� ��������").Subtotals = _
            Array(False, False, False, False, False, False, False, False, False, False, False, False)
            MyPivotTable.PivotFields("���� ��������� ��������").Subtotals = _
            Array(False, False, False, False, False, False, False, False, False, False, False, False)
            MyPivotTable.PivotFields("����������").Subtotals = _
            Array(False, False, False, False, False, False, False, False, False, False, False, False)
            MyPivotTable.PivotFields("������").Subtotals = _
            Array(False, False, False, False, False, False, False, False, False, False, False, False)
            MyPivotTable.PivotFields("������ �� ��������").Subtotals = _
            Array(False, False, False, False, False, False, False, False, False, False, False, False)
            MyPivotTable.PivotFields("����� ��������").Subtotals = _
            Array(False, False, False, False, False, False, False, False, False, False, False, False)
            MyPivotTable.PivotFields("������").Subtotals = _
            Array(False, False, False, False, False, False, False, False, False, False, False, False)
            MyPivotTable.PivotFields("� ����").Subtotals = _
            Array(False, False, False, False, False, False, False, False, False, False, False, False)
            MyPivotTable.PivotFields("���� ����").Subtotals = _
            Array(False, False, False, False, False, False, False, False, False, False, False, False)


           ' ------------------ ������� ����������------------------
           MyPivotTable.HasAutoFormat = False


            DestinationSheet.Cells(3, 4) = "������ ��������� c " _
            + CStr(ParametersSheet.Cells(1, 4).Value) _
            + " �� " + CStr(ParametersSheet.Cells(2, 4).Value)


            With DestinationSheet.Cells(3, 4).Font
                .Bold = True
                .Name = "Arial"
                .Size = 12
            End With


    With ActiveSheet.PivotTables(1).PivotFields("����� �� ��������")
        .LayoutBlankLine = True
        .LayoutSubtotalLocation = xlAtTop
        .LayoutForm = xlOutline
    End With

DestinationSheet.Columns("A:A").ColumnWidth = 0.5
DestinationSheet.Columns("B:B").ColumnWidth = 12.5
DestinationSheet.Columns("C:C").ColumnWidth = 10
DestinationSheet.Columns("D:D").ColumnWidth = 10.5
DestinationSheet.Columns("E:E").ColumnWidth = 38
DestinationSheet.Columns("F:F").ColumnWidth = 13.5
DestinationSheet.Columns("G:G").ColumnWidth = 36
DestinationSheet.Columns("H:H").ColumnWidth = 16.5
DestinationSheet.Columns("I:I").ColumnWidth = 6.71
DestinationSheet.Columns("J:J").ColumnWidth = 15.3
DestinationSheet.Columns("K:K").ColumnWidth = 12
DestinationSheet.Columns("L:L").ColumnWidth = 11
DestinationSheet.Rows("8:8").RowHeight = 40

Rows("7:7").EntireRow.Hidden = True


With DestinationSheet.PageSetup
        .PrintTitleRows = "$8:$8"
        .PrintTitleColumns = "$A:$E"
        .PaperSize = xlPaperA4
        .Orientation = xlLandscape
        .LeftMargin = Application.InchesToPoints(0.196850393700787)
        .RightMargin = Application.InchesToPoints(0.196850393700787)
        .TopMargin = Application.InchesToPoints(0.669291338582677)
        .BottomMargin = Application.InchesToPoints(0.47244094488189)
        .HeaderMargin = Application.InchesToPoints(0.31496062992126)
        .FooterMargin = Application.InchesToPoints(0.31496062992126)
        .FirstPageNumber = xlAutomatic
        .CenterFooter = "�������� &P"
        .FitToPagesWide = 1
        .FitToPagesTall = False
        .Zoom = 79
End With

    With DestinationSheet.Range("B8:AZ60000")
        .WrapText = True
        .VerticalAlignment = xlCenter
    End With

    Columns("H:H").NumberFormat = "#,##0"
    Columns("A:A").Font.Bold = True
    Columns("I:L").HorizontalAlignment = xlRight

    
        Case 2

        End Select

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

'������ ���������
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














