Attribute VB_Name = "Module1"
Public start_v, start_g As Integer

Sub VedNar()
start_v = 18
start_g = 1
i = -1
'----------------Ширина ячеек------------------
Columns("A:A").ColumnWidth = 2
Columns("B:B").ColumnWidth = 5.86
Columns("C:C").ColumnWidth = 27.86
Columns("D:D").ColumnWidth = 19.86
Columns("E:E").ColumnWidth = 2.86
Columns("F:F").ColumnWidth = 6.86
Columns("G:N").ColumnWidth = 8.86
Columns("K:K").ColumnWidth = 3.86
Do
'----------------Форматирование шапки------------------
s = i + 2
Range(Cells(s, 1), Cells(s + 3, 1)).Select
  format_font_10b
Range(Cells(s + 1, 1), Cells(s + 1, 12)).Select
  ob_cell
  format_cell_l
Range(Cells(s + 1, 13), Cells(s + 1, 13)).Select
  format_font_10
Range(Cells(s + 3, 6), Cells(s + 3, 6)).Select
  format_font_10b
Range(Cells(s + 4, 1), Cells(s + 12, 5)).Select
  format_font_10
Range(Cells(s + 7, 4), Cells(s + 12, 4)).Select
  Line_all
  Line_horiz
Range(Cells(s + 3, 13), Cells(s + 12, 14)).Select
  Line_horiz
'----------------Высота ячеек шапки---------------------
Range(Cells(s, 1), Cells(s + 13, 1)).RowHeight = 12.75
Range(Cells(s + 1, 1), Cells(s + 1, 1)).RowHeight = 25.5
'-----------Форматирование шапки таблицы----------------
Range(Cells(s + 14, 1), Cells(s + 15, 14)).Select
  format_font_10b
  format_cell
  Line_all
  Line_vert
'----------------Высота ячеек шапки таблицы---------------
Range(Cells(s + 14, 1), Cells(s + 14, 1)).RowHeight = 63.75
Range(Cells(s + 15, 1), Cells(s + 15, 1)).RowHeight = 12.75
'------------------Форматирование таблицы-----------------
i = i + start_v
Do While trim(Cells(i, 1)) <> ""
  Range(Cells(i, start_g), Cells(i, start_g + 13)).Select
    format_font_10
    format_cell
    Line_all
    Line_vert
  Range(Cells(i, start_g + 2), Cells(i, start_g + 3)).Select
    format_cell_l_w
  Range(Cells(i, start_g + 8), Cells(i, start_g + 13)).Select
    Selection.NumberFormat = "#,##0.00"
i = i + 1
Loop
'----------------Форматирование подножия------------------
Range(Cells(i, 1), Cells(i, 14)).Select
  format_font_10b
  format_cell
  Line_all
  Line_vert
Range(Cells(i, 9), Cells(i, 14)).Select
  Selection.NumberFormat = "#,##0.00"
Range(Cells(i + 2, 1), Cells(i + 2, 1)).Select
  ActiveWindow.SelectedSheets.HPageBreaks.Add Before:=ActiveCell
Loop Until Cells(i+1, 1) = "     "
finish_format
End Sub

Function ob_cell()
With Selection
  .MergeCells = True
End With
End Function
Function format_cell()
    With Selection
        .HorizontalAlignment = xlCenter
        .VerticalAlignment = xlCenter
        .WrapText = True
End With
End Function
Function format_cell_l()
    With Selection
        .HorizontalAlignment = xlLeft
        .VerticalAlignment = xlCenter
        .WrapText = True
End With
End Function
Function format_cell_w()
    With Selection
        .HorizontalAlignment = xlCenter
        .VerticalAlignment = xlCenter
        .WrapText = False
End With
End Function
Function format_cell_l_w()
    With Selection
        .HorizontalAlignment = xlLeft
        .VerticalAlignment = xlCenter
        .WrapText = False
End With
End Function
Function format_font_14()
With Selection.Font
  .Name = "Times New Roman"
  .Size = 14
End With
End Function
Function format_font_12()
With Selection.Font
  .Name = "Times New Roman"
  .Size = 12
End With
End Function
Function format_font_12b()
With Selection.Font
  .Name = "Times New Roman"
  .Size = 12
  .Bold = True
End With
End Function
Function format_font_10()
With Selection.Font
  .Name = "Times New Roman"
  .Size = 10
End With
End Function
Function format_font_10a()
With Selection.Font
  .Name = "Arial"
  .Size = 10
End With
End Function
Function format_font_10b()
With Selection.Font
  .Name = "Times New Roman"
  .Size = 10
  .Bold = True
End With
End Function
Function Line_all()
    With Selection.Borders(xlEdgeLeft)
        .LineStyle = xlContinuous
        .Weight = xlThin
        .ColorIndex = xlAutomatic
    End With
    With Selection.Borders(xlEdgeTop)
        .LineStyle = xlContinuous
        .Weight = xlThin
        .ColorIndex = xlAutomatic
    End With
    With Selection.Borders(xlEdgeBottom)
        .LineStyle = xlContinuous
        .Weight = xlThin
        .ColorIndex = xlAutomatic
    End With
    With Selection.Borders(xlEdgeRight)
        .LineStyle = xlContinuous
        .Weight = xlThin
        .ColorIndex = xlAutomatic
    End With
End Function
Function Line_vert()
    With Selection.Borders(xlInsideVertical)
        .LineStyle = xlContinuous
        .Weight = xlThin
        .ColorIndex = xlAutomatic
    End With
End Function
Function Line_horiz()
    With Selection.Borders(xlInsideHorizontal)
        .LineStyle = xlContinuous
        .Weight = xlThin
        .ColorIndex = xlAutomatic
    End With
End Function
Function Line_verx()
    With Selection.Borders(xlEdgeTop)
        .LineStyle = xlContinuous
        .Weight = xlThin
        .ColorIndex = xlAutomatic
    End With
End Function
Function finish_format()
    With ActiveSheet.PageSetup
        .PrintTitleRows = ""
        .PrintTitleColumns = ""
    End With
    ActiveSheet.PageSetup.PrintArea = ""
    With ActiveSheet.PageSetup
        .LeftHeader = ""
        .CenterHeader = ""
        .RightHeader = ""
        .LeftFooter = ""
        .CenterFooter = ""
        .RightFooter = ""
        .LeftMargin = Application.InchesToPoints(0.393700787401575)
        .RightMargin = Application.InchesToPoints(0.393700787401575)
        .TopMargin = Application.InchesToPoints(0.78740157480315)
        .BottomMargin = Application.InchesToPoints(0.393700787401575)
        .HeaderMargin = Application.InchesToPoints(0.511811023622047)
        .FooterMargin = Application.InchesToPoints(0.511811023622047)
        .PrintHeadings = False
        .PrintGridlines = False
        .PrintComments = xlPrintNoComments
        .PrintQuality = 600
        .CenterHorizontally = False
        .CenterVertically = False
        .Orientation = xlLandscape
        .Draft = False
        .PaperSize = xlPaperA4
        .FirstPageNumber = xlAutomatic
        .Order = xlDownThenOver
        .BlackAndWhite = False
        .Zoom = 100
        .PrintErrors = xlPrintErrorsDisplayed
    End With
End Function
