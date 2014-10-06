Attribute VB_Name = "Module1"
Public start_v, start_g As Integer

Sub Tab_brig_2()
start_v = 10
start_g = 1
i = -1
'----------------Ширина ячеек------------------
Columns("A:A").ColumnWidth = 2.57
Columns("B:B").ColumnWidth = 6
Columns("C:C").ColumnWidth = 30.43
Columns("D:D").ColumnWidth = 21.43
Columns("E:E").ColumnWidth = 3
Columns("F:F").ColumnWidth = 5.43
Columns("G:AK").ColumnWidth = 2.43
Columns("AL:AP").ColumnWidth = 6.14
Do
'----------------Форматирование шапки------------------
s = i + 2
Range(Cells(s, 1), Cells(s, 1)).Select
  format_font_12b
Range(Cells(s + 1, 1), Cells(s + 1, 4)).Select
  format_font_12b
Range(Cells(s + 1, 5), Cells(s + 1, 5)).Select
  format_font_14
Range(Cells(s + 1, 13), Cells(s + 1, 41)).Select
  ob_cell
  format_font_10
Range(Cells(s + 2, 1), Cells(s + 2, 4)).Select
  format_font_12b
Range(Cells(s + 2, 17), Cells(s + 2, 17)).Select
  format_font_10b
Range(Cells(s + 3, 1), Cells(s + 3, 1)).Select
  format_font_12
Range(Cells(s + 4, 1), Cells(s + 4, 1)).Select
  format_font_12
'----------------Высота ячеек шапки-----------------
Range(Cells(s, 1), Cells(s, 1)).RowHeight = 15.75
Range(Cells(s + 1, 1), Cells(s + 1, 1)).RowHeight = 18.75
Range(Cells(s + 2, 1), Cells(s + 4, 1)).RowHeight = 15.75
'----------------Форматирование шапки таблицы------------------
For t = 1 To 6
  Range(Cells(s + 6, t), Cells(s + 7, t)).Select
    ob_cell
    format_cell
    format_font_10
Next t
Range(Cells(s + 6, 7), Cells(s + 6, 37)).Select
  ob_cell
  format_cell
  format_font_10
Range(Cells(s + 7, 7), Cells(s + 7, 37)).Select
  format_cell
  format_font_10
For t = 38 To 42
  Range(Cells(s + 6, t), Cells(s + 7, t)).Select
    ob_cell
    format_cell
    format_font_10
Next t
Range(Cells(s + 6, 1), Cells(s + 7, 42)).Select
  Line_all
'----------------Высота ячеек шапки таблицы-----------------
Range(Cells(s + 6, 1), Cells(s + 6, 1)).RowHeight = 13.5
Range(Cells(s + 7, 1), Cells(s + 7, 1)).RowHeight = 39.75
'----------------Форматирование таблицы------------------
i = i + start_v
Do While Cells(i, 1) <> ""
  Range(Cells(i, start_g), Cells(i, start_g + 5)).Select
    format_font_10
  Range(Cells(i, start_g + 6), Cells(i, start_g + 36)).Select
    format_cell_w
    format_font_10a
  Range(Cells(i, start_g + 37), Cells(i, start_g + 41)).Select
    format_cell_w
    format_font_10a
  Range(Cells(i, start_g), Cells(i, start_g)).RowHeight = 15.75
  Range(Cells(i, start_g), Cells(i, start_g + 41)).Select
    Line_all
i = i + 1
Loop
'----------------Форматирование подножия------------------
Range(Cells(i, 3), Cells(i, 3)).Select
  format_cell_l_w
  format_font_10b
Range(Cells(i, 38), Cells(i, 40)).Select
  format_cell
  format_font_10b
Range(Cells(i, 1), Cells(i, 42)).Select
  Line_all
i = i + 2
Range(Cells(i, 3), Cells(i, 3)).Select
  format_font_10
Range(Cells(i, 4), Cells(i, 5)).Select
  ob_cell
  format_cell
  format_font_10
i = i + 1
Range(Cells(i, 4), Cells(i, 5)).Select
  ob_cell
  format_cell
  format_font_10
  Line_verx
Range(Cells(i, 9), Cells(i, 17)).Select
  ob_cell
  format_cell
  format_font_10
  Line_verx
Range(Cells(i, 19), Cells(i, 37)).Select
  ob_cell
  format_cell
  format_font_10
  Line_verx
i = i + 2
Range(Cells(i, 3), Cells(i, 3)).Select
  format_font_10
Range(Cells(i, 4), Cells(i, 5)).Select
  ob_cell
  format_cell
  format_font_10
i = i + 1
Range(Cells(i, 4), Cells(i, 5)).Select
  ob_cell
  format_cell
  format_font_10
  Line_verx
Range(Cells(i, 9), Cells(i, 17)).Select
  ob_cell
  format_cell
  format_font_10
  Line_verx
Range(Cells(i, 19), Cells(i, 37)).Select
  ob_cell
  format_cell
  format_font_10
  Line_verx
Range(Cells(i + 2, 1), Cells(i + 2, 1)).Select
  ActiveWindow.SelectedSheets.HPageBreaks.Add Before:=ActiveCell
Loop Until Cells(i, 1) = "     "
'Range(Cells(i, 1), Cells(i, 1)).Select
'    With Selection.Font
'        .ThemeColor = xlThemeColorDark1
'        .TintAndShade = 0
'    End With
Range(Cells(1, 1), Cells(1, 1)).Select
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
    With Selection.Borders(xlInsideVertical)
        .LineStyle = xlContinuous
        .Weight = xlThin
        .ColorIndex = xlAutomatic
    End With
'    With Selection.Borders(xlInsideHorizontal)
'        .LineStyle = xlContinuous
'        .Weight = xlThin
'        .ColorIndex = xlAutomatic
'    End With
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
        .HeaderMargin = Application.InchesToPoints(0.31496062992126)
        .FooterMargin = Application.InchesToPoints(0.31496062992126)
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
        .Zoom = 68
        .PrintErrors = xlPrintErrorsDisplayed
'        .OddAndEvenPagesHeaderFooter = False
'        .DifferentFirstPageHeaderFooter = False
'        .ScaleWithDocHeaderFooter = True
'        .AlignMarginsHeaderFooter = True
'        .EvenPage.LeftHeader.Text = ""
'        .EvenPage.CenterHeader.Text = ""
'        .EvenPage.RightHeader.Text = ""
'        .EvenPage.LeftFooter.Text = ""
'        .EvenPage.CenterFooter.Text = ""
'        .EvenPage.RightFooter.Text = ""
'        .FirstPage.LeftHeader.Text = ""
'        .FirstPage.CenterHeader.Text = ""
'        .FirstPage.RightHeader.Text = ""
'        .FirstPage.LeftFooter.Text = ""
'        .FirstPage.CenterFooter.Text = ""
'        .FirstPage.RightFooter.Text = ""
    End With
End Function
