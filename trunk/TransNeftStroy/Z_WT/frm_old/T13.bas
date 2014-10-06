Attribute VB_Name = "Module1"
Public start_v, start_g As Integer

Sub Tabel()
start_v = 18
start_g = 1
i = 0
'----------------Ширина ячеек------------------
Columns("A:A").ColumnWidth = 3.43
Columns("B:B").ColumnWidth = 17
Columns("C:C").ColumnWidth = 17
Columns("D:D").ColumnWidth = 7.43
Columns("E:E").ColumnWidth = 6.57
Columns("F:F").ColumnWidth = 5.86
Columns("G:V").ColumnWidth = 4.14
Columns("W:W").ColumnWidth = 6.29
Columns("X:X").ColumnWidth = 5.43
Columns("Y:AA").ColumnWidth = 3.71
Columns("AB:AB").ColumnWidth = 4.43
Columns("AC:AC").ColumnWidth = 0
Columns("AD:AD").ColumnWidth = 3.71
Columns("AE:AG").ColumnWidth = 4.43
Columns("AH:AH").ColumnWidth = 6.29
Columns("AI:AJ").ColumnWidth = 5
Columns("AK:BO").ColumnWidth = 3.71
Columns("BP:BP").ColumnWidth = 4.86
Columns("BQ:BQ").ColumnWidth = 8
Columns("BR:BR").ColumnWidth = 5.86
'----------------Форматирование разовой шапки------------------
Range(Cells(1, 53), Cells(1, 71)).Select
  ob_cell
  format_cell_r
  format_font_18
Range(Cells(2, 53), Cells(2, 71)).Select
  ob_cell
  format_cell_r
  format_font_18
Range(Cells(3, 53), Cells(3, 71)).Select
  ob_cell
  format_cell_r
  format_font_18
Range(Cells(4, 53), Cells(4, 71)).Select
  ob_cell
  format_cell_r
  format_font_18
Range(Cells(1, 1), Cells(2, 1)).RowHeight = 21.75
Range(Cells(3, 1), Cells(3, 1)).RowHeight = 23.25
Range(Cells(4, 1), Cells(4, 1)).RowHeight = 22.5
i = 5
Do '!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
'----------------Форматирование шапки------------------
s = i + 1
If Cells(s, 1) = "" Then
Range(Cells(s, 2), Cells(s, 8)).Select
  ob_cell
  format_cell
  format_font_12b
Range(Cells(s + 1, 2), Cells(s + 1, 8)).Select
  ob_cell
  format_cell
  format_font_10b
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
Range(Cells(s + 2, 2), Cells(s + 2, 8)).Select
  ob_cell
  format_cell
  format_font_8b
Range(Cells(s + 3, 2), Cells(s + 3, 8)).Select
  ob_cell
  format_cell
  format_font_10b
Range(Cells(s + 4, 2), Cells(s + 4, 8)).Select
  ob_cell
  format_cell
  format_font_8b
    With Selection.Borders(xlEdgeTop)
        .LineStyle = xlContinuous
        .Weight = xlThin
        .ColorIndex = xlAutomatic
    End With
Range(Cells(s + 3, 23), Cells(s + 3, 23)).Select
format_font_12b
Range(Cells(s + 3, 43), Cells(s + 3, 43)).Select
format_font_12b
Range(Cells(s + 3, 36), Cells(s + 3, 42)).Select
  ob_cell
  format_cell
  format_font_12b
    With Selection.Borders(xlEdgeBottom)
        .LineStyle = xlContinuous
        .Weight = xlThin
        .ColorIndex = xlAutomatic
    End With
Range(Cells(s + 1, 54), Cells(s + 1, 57)).Select
  ob_cell
  format_cell
  format_font_8
Range(Cells(s + 1, 58), Cells(s + 1, 59)).Select
  ob_cell
  format_cell
  format_font_8
Range(Cells(s + 1, 60), Cells(s + 1, 61)).Select
  ob_cell
  format_cell
  format_font_8
Range(Cells(s + 1, 62), Cells(s + 1, 63)).Select
  ob_cell
  format_cell
  format_font_8
Range(Cells(s + 2, 54), Cells(s + 2, 55)).Select
  ob_cell
  format_cell
  format_font_8b
Range(Cells(s + 2, 56), Cells(s + 2, 57)).Select
  ob_cell
  format_cell
  format_font_8b
Range(Cells(s + 2, 58), Cells(s + 2, 59)).Select
  ob_cell
  format_cell
  format_font_8b
Range(Cells(s + 2, 60), Cells(s + 2, 61)).Select
  ob_cell
  format_cell
  format_font_8b
Range(Cells(s + 2, 62), Cells(s + 2, 63)).Select
  ob_cell
  format_cell
  format_font_8b
Range(Cells(s + 1, 54), Cells(s + 2, 63)).Select
  Line_all
Range(Cells(s + 1, 65), Cells(s + 1, 67)).Select
  ob_cell
  format_cell
  format_font_8
Range(Cells(s + 2, 66), Cells(s + 2, 67)).Select
  ob_cell
  format_cell
  format_font_8
Range(Cells(s, 68), Cells(s, 71)).Select
  ob_cell
  format_cell
  format_font_10
Range(Cells(s + 1, 68), Cells(s + 1, 71)).Select
  ob_cell
  format_cell
  format_font_8b
Range(Cells(s + 2, 68), Cells(s + 2, 71)).Select
  ob_cell
  format_cell
  format_font_8b
Range(Cells(s + 3, 68), Cells(s + 3, 71)).Select
  ob_cell
  format_cell
  format_font_8b
Range(Cells(s, 68), Cells(s + 3, 71)).Select
  Line_all
i = i + 5
'----------------Высота ячеек шапки----------------------------
Range(Cells(s, 1), Cells(s, 1)).RowHeight = 18
Range(Cells(s + 1, 1), Cells(s + 1, 1)).RowHeight = 22.5
Range(Cells(s + 2, 1), Cells(s + 3, 1)).RowHeight = 18
Range(Cells(s + 4, 1), Cells(s + 4, 1)).RowHeight = 21.75
tnr = i
End If
'----------------Форматирование шапки таблицы------------------
s = i + 1
For t = 1 To 6
  Range(Cells(s, t), Cells(s + 4, t)).Select
    ob_cell
    format_cell
    format_font_10
Next t
Range(Cells(s, 1), Cells(s + 4, 6)).Select
  Line_kr_j
Range(Cells(s, 7), Cells(s, 22)).Select
  ob_cell
  format_cell
  format_font_10
For t = 7 To 22
  Range(Cells(s + 1, t), Cells(s + 2, t)).Select
    ob_cell
    format_cell
    format_font_10
  Range(Cells(s + 3, t), Cells(s + 4, t)).Select
    ob_cell
    format_cell
    format_font_10
Next t
Range(Cells(s, 23), Cells(s, 24)).Select
  ob_cell
  format_cell
  format_font_8
Range(Cells(s + 1, 23), Cells(s + 2, 23)).Select
  ob_cell
  format_cell
  format_font_8
Range(Cells(s + 1, 24), Cells(s + 2, 24)).Select
  ob_cell
  format_cell
  format_font_8
Range(Cells(s + 3, 23), Cells(s + 3, 24)).Select
  ob_cell
  format_cell
  format_font_10
Range(Cells(s + 4, 23), Cells(s + 4, 24)).Select
  ob_cell
  format_cell
  format_font_10
Range(Cells(s, 25), Cells(s + 2, 30)).Select
  ob_cell
  format_cell
  format_font_10
Range(Cells(s + 3, 25), Cells(s + 4, 30)).Select
  ob_cell
  format_cell
  format_font_10
Range(Cells(s, 31), Cells(s + 2, 32)).Select
  ob_cell
  format_cell
  format_font_10
Range(Cells(s + 3, 31), Cells(s + 4, 31)).Select
  ob_cell
  format_cell
  format_font_10
Range(Cells(s + 3, 32), Cells(s + 4, 32)).Select
  ob_cell
  format_cell
  format_font_10
Range(Cells(s, 33), Cells(s + 4, 33)).Select
  ob_cell
  format_cell
  format_font_10
Range(Cells(s, 34), Cells(s + 4, 34)).Select
  ob_cell
  format_cell
  format_font_10
Range(Cells(s, 35), Cells(s + 2, 36)).Select
  ob_cell
  format_cell
  format_font_10
Range(Cells(s + 3, 35), Cells(s + 4, 35)).Select
  ob_cell
  format_cell
  format_font_10
Range(Cells(s + 3, 36), Cells(s + 4, 36)).Select
  ob_cell
  format_cell
  format_font_10
Range(Cells(s, 37), Cells(s + 2, 66)).Select
  ob_cell
  format_cell
  format_font_10
Range(Cells(s + 3, 37), Cells(s + 4, 66)).Select
  ob_cell
  format_cell
  format_font_10
Range(Cells(s, 67), Cells(s + 4, 67)).Select
  ob_cell
  format_cell
  format_font_7
Range(Cells(s, 68), Cells(s + 4, 68)).Select
  ob_cell
  format_cell
  format_font_7
Range(Cells(s, 69), Cells(s + 2, 71)).Select
  ob_cell
  format_cell
  format_font_7
Range(Cells(s + 3, 69), Cells(s + 4, 69)).Select
  ob_cell
  format_cell
  format_font_8
Range(Cells(s + 3, 70), Cells(s + 4, 70)).Select
  ob_cell
  format_cell
  format_font_8
Range(Cells(s + 3, 71), Cells(s + 4, 71)).Select
  ob_cell
  format_cell
  format_font_8
Range(Cells(s, 7), Cells(s + 4, 71)).Select
  Line_kr_j
Range(Cells(s + 5, 1), Cells(s + 5, 71)).Select
  format_cell
  format_font_10
  Line_kr_j_v
Range(Cells(s + 5, 7), Cells(s + 5, 22)).Select
  ob_cell
Range(Cells(s + 5, 23), Cells(s + 5, 23)).Select
  Selection.Borders(xlEdgeRight).LineStyle = xlNone
Range(Cells(s + 6, 1), Cells(s + 6, 71)).Select
  format_cell
  format_font_8_I
  Line_kr_j_v
Range(Cells(s + 6, 7), Cells(s + 6, 22)).Select
  ob_cell
Range(Cells(s + 6, 23), Cells(s + 6, 24)).Select
  ob_cell
  Line_kr_j_v
Range(Cells(s + 6, 31), Cells(s + 6, 32)).Select
  ob_cell
  Line_kr_j_v
Range(Cells(s + 6, 35), Cells(s + 6, 36)).Select
  ob_cell
i = i + 7
'----------------Высота ячеек шапки таблицы-----------------
Range(Cells(s, 1), Cells(s + 3, 1)).RowHeight = 12.75
Range(Cells(s + 4, 1), Cells(s + 6, 1)).RowHeight = 14.25
'----------------Форматирование таблицы---------------------
i = i + 1
ob = i - 2
iday = 0
ichas = 0
Do While Cells(i, 1) <> "" And Cells(i, 1) <> "end"
  Range(Cells(i, start_g), Cells(i + 3, start_g)).Select
    ob_cell
    format_cell
    format_font_10b
  Range(Cells(i, start_g + 1), Cells(i + 3, start_g + 1)).Select
    ob_cell
    format_cell
    format_font_12
  Range(Cells(i, start_g + 2), Cells(i + 3, start_g + 2)).Select
    ob_cell
    format_cell
    format_font_11
  Range(Cells(i, start_g + 3), Cells(i + 3, start_g + 3)).Select
    ob_cell
    format_cell
    format_font_12
  Range(Cells(i, start_g + 4), Cells(i + 3, start_g + 4)).Select
    ob_cell
    format_cell
    format_font_10
  Range(Cells(i, start_g + 5), Cells(i + 3, start_g + 5)).Select
    ob_cell
    format_cell
    format_font_10
  Range(Cells(i, start_g + 6), Cells(i + 3, start_g + 21)).Select
    format_cell
    format_font_12
  Range(Cells(i, start_g + 22), Cells(i, start_g + 22)).Select
    format_cell
    format_font_12b
  Range(Cells(i + 1, start_g + 22), Cells(i + 1, start_g + 22)).Select
    format_cell
    format_font_12b
  Range(Cells(i + 2, start_g + 22), Cells(i + 2, start_g + 22)).Select
    format_cell
    format_font_12b
  Range(Cells(i + 3, start_g + 22), Cells(i + 3, start_g + 22)).Select
    format_cell
    format_font_12b
  Range(Cells(i, start_g + 23), Cells(i + 1, start_g + 23)).Select
    ob_cell
    format_cell
    format_font_12b
  Range(Cells(i + 2, start_g + 23), Cells(i + 3, start_g + 23)).Select
    ob_cell
    format_cell
    format_font_12b
  Range(Cells(i, start_g), Cells(i + 3, start_g)).RowHeight = 21.75
  Range(Cells(i, start_g), Cells(i + 3, start_g + 5)).Select
    Line_kr_j
  Range(Cells(i, start_g + 6), Cells(i + 1, start_g + 21)).Select
    Line_kr_j
  Range(Cells(i + 2, start_g + 6), Cells(i + 3, start_g + 21)).Select
    Line_kr_j
  Range(Cells(i, start_g + 22), Cells(i + 3, start_g + 23)).Select
    Line_kr_j
  Range(Cells(i, start_g + 24), Cells(i + 3, start_g + 29)).Select
    format_cell_w
    format_font_11
    Line_kr_j
  Range(Cells(i, start_g + 30), Cells(i + 3, start_g + 31)).Select
    format_cell_w
    format_font_11
    Line_kr_j
  Range(Cells(i, start_g + 32), Cells(i + 3, start_g + 70)).Select
    format_cell_w
    format_font_11
    Line_kr_j
  Cells(i, 23).Select
  ActiveCell.FormulaR1C1 = _
    "=SUMPRODUCT((RC[-16]:RC[-2]=""К"")*(R[1]C[-16]:R[1]C[-2]<>""""))+SUMPRODUCT((RC[-16]:RC[-2]=""СП"")*(R[1]C[-16]:R[1]C[-2]<>""""))+SUMPRODUCT((RC[-16]:RC[-2]=""ВМ"")*(R[1]C[-16]:R[1]C[-2]<>""""))" & _
    "+SUMPRODUCT((RC[-16]:RC[-2]=""Я"")*(R[1]C[-16]:R[1]C[-2]<>""""))+SUMPRODUCT((RC[-16]:RC[-2]=""РВ"")*(R[1]C[-16]:R[1]C[-2]<>""""))+SUMPRODUCT((RC[-16]:RC[-2]=""ЯР"")*(R[1]C[-16]:R[1]C[-2]<>""""))" & _
    "+SUMPRODUCT((RC[-16]:RC[-2]=""СТ"")*(R[1]C[-16]:R[1]C[-2]<>""""))"
  Cells(i + 2, 23).Select
  ActiveCell.FormulaR1C1 = _
    "=SUMPRODUCT((RC[-16]:RC[-1]=""К"")*(R[1]C[-16]:R[1]C[-1]<>""""))+SUMPRODUCT((RC[-16]:RC[-1]=""СП"")*(R[1]C[-16]:R[1]C[-1]<>""""))+SUMPRODUCT((RC[-16]:RC[-1]=""ВМ"")*(R[1]C[-16]:R[1]C[-1]<>""""))" & _
    "+SUMPRODUCT((RC[-16]:RC[-1]=""Я"")*(R[1]C[-16]:R[1]C[-1]<>""""))+SUMPRODUCT((RC[-16]:RC[-1]=""РВ"")*(R[1]C[-16]:R[1]C[-1]<>""""))+SUMPRODUCT((RC[-16]:RC[-1]=""ЯР"")*(R[1]C[-16]:R[1]C[-1]<>""""))" & _
    "+SUMPRODUCT((RC[-16]:RC[-1]=""СТ"")*(R[1]C[-16]:R[1]C[-1]<>""""))"
  Cells(i + 1, 23).Select
  ActiveCell.FormulaR1C1 = _
    "=SUMIF(R[-1]C[-16]:R[-1]C[-2],""=К"",RC[-16]:RC[-2])+SUMIF(R[-1]C[-16]:R[-1]C[-2],""=СП"",RC[-16]:RC[-2])+SUMIF(R[-1]C[-16]:R[-1]C[-2],""=ВМ"",RC[-16]:RC[-2])+SUMIF(R[-1]C[-16]:R[-1]C[-2],""=Я"",RC[-16]:RC[-2])" & _
    "+SUMIF(R[-1]C[-16]:R[-1]C[-2],""=РВ"",RC[-16]:RC[-2])+SUMIF(R[-1]C[-16]:R[-1]C[-2],""=РП"",RC[-16]:RC[-2])+SUMIF(R[-1]C[-16]:R[-1]C[-2],""=ЯР"",RC[-16]:RC[-2])+SUMIF(R[-1]C[-16]:R[-1]C[-2],""=С"",RC[-16]:RC[-2])" & _
    "+SUMIF(R[-1]C[-16]:R[-1]C[-2],""=Ст"",RC[-16]:RC[-2])"
  Cells(i + 3, 23).Select
  ActiveCell.FormulaR1C1 = _
    "=SUMIF(R[-1]C[-16]:R[-1]C[-1],""=К"",RC[-16]:RC[-1])+SUMIF(R[-1]C[-16]:R[-1]C[-1],""=СП"",RC[-16]:RC[-1])+SUMIF(R[-1]C[-16]:R[-1]C[-1],""=ВМ"",RC[-16]:RC[-1])+SUMIF(R[-1]C[-16]:R[-1]C[-1],""=Я"",RC[-16]:RC[-1])" & _
    "+SUMIF(R[-1]C[-16]:R[-1]C[-1],""=РВ"",RC[-16]:RC[-1])+SUMIF(R[-1]C[-16]:R[-1]C[-1],""=РП"",RC[-16]:RC[-1])+SUMIF(R[-1]C[-16]:R[-1]C[-1],""=ЯР"",RC[-16]:RC[-1])+SUMIF(R[-1]C[-16]:R[-1]C[-1],""=С"",RC[-16]:RC[-1])" & _
    "+SUMIF(R[-1]C[-16]:R[-1]C[-1],""=Ст"",RC[-16]:RC[-1])"
  Cells(i, 24).Select
  ActiveCell.FormulaR1C1 = "=RC[-1]+R[2]C[-1]"
  Cells(i + 2, 24).Select
  ActiveCell.FormulaR1C1 = "=R[-1]C[-1]+R[1]C[-1]"
  iday = iday + Cells(i, 24)
  ichas = ichas + Cells(i + 2, 24)
  Cells(i, 26).Select
  ActiveCell.FormulaR1C1 = _
    "=SUMIF(RC[-19]:RC[-5],""РВ"",R[1]C[-19]:R[1]C[-5])+SUMIF(R[2]C[-19]:R[2]C[-4],""РВ"",R[3]C[-19]:R[3]C[-4])"
  Cells(i, 27).Select
  ActiveCell.FormulaR1C1 = _
    "=SUMIF(RC[-20]:RC[-6],""РП"",R[1]C[-20]:R[1]C[-6])+SUMIF(R[2]C[-20]:R[2]C[-5],""РП"",R[3]C[-20]:R[3]C[-5])"
  Cells(i, 28).Select
  ActiveCell.FormulaR1C1 = _
    "=SUMIF(RC[-21]:RC[-7],""ЯР"",R[1]C[-21]:R[1]C[-7])+SUMIF(R[2]C[-21]:R[2]C[-6],""ЯР"",R[3]C[-21]:R[3]C[-6])"
  Cells(i, 30).Select
  ActiveCell.FormulaR1C1 = _
    "=SUMIF(RC[-23]:RC[-9],""Ст"",R[1]C[-23]:R[1]C[-9])+SUMIF(R[2]C[-23]:R[2]C[-8],""СТ"",R[3]C[-23]:R[3]C[-8])"
  Cells(i, 31).Select
  ActiveCell.FormulaR1C1 = _
    "=COUNTIF(RC[-24]:RC[-10],""=Дп"")+COUNTIF(R[2]C[-24]:R[2]C[-9],""=Дп"")"
  Cells(i, 32).Select
  ActiveCell.FormulaR1C1 = _
    "=SUMIF(RC[-25]:RC[-11],""Дп"",R[1]C[-25]:R[1]C[-11])+SUMIF(R[2]C[-25]:R[2]C[-10],""Дп"",R[3]C[-25]:R[3]C[-10])"
  Cells(i, 33).Select
  ActiveCell.FormulaR1C1 = _
    "=SUMIF(RC[-26]:RC[-12],""Лв"",R[1]C[-26]:R[1]C[-12])+SUMIF(R[2]C[-26]:R[2]C[-11],""Лв"",R[3]C[-26]:R[3]C[-11])"
  Cells(i, 34).Select
  ActiveCell.FormulaR1C1 = "=R[2]C[-10]+RC[-1]+RC[-2]+RC[2]"
  Cells(i, 35).Select
  ActiveCell.FormulaR1C1 = "=SUM(RC[2]:RC[31])"
  Cells(i, 36).Select
  ActiveCell.FormulaR1C1 = _
    "=SUMIF(RC[-29]:RC[-15],""НП"",R[1]C[-29]:R[1]C[-15])+SUMIF(R[2]C[-29]:R[2]C[-14],""НП"",R[3]C[-29]:R[3]C[-14])"
  For t = 37 To 66
    z = Trim(Cells(ob, t))
    If t = 55 Then z = "НП"
    Cells(i, t).Select
    ActiveCell.FormulaR1C1 = _
      "=COUNTIF(RC[-" + CStr(t - 7) + "]:RC[-" + CStr(t - 21) + "],""=" + z + """)+COUNTIF(R[2]C[-" + CStr(t - 7) + "]:R[2]C[-" + CStr(t - 22) + "],""=" + z + """)"
  Next t
Cells(i, 67).Select
  ActiveCell.FormulaR1C1 = _
    "=COUNTIF(RC[-60]:RC[-46],""=В"")+COUNTIF(R[2]C[-60]:R[2]C[-45],""=В"")+SUMPRODUCT((RC[-60]:RC[-46]=""ВМ"")*(R[1]C[-60]:R[1]C[-46]=""""))+SUMPRODUCT((R[2]C[-60]:R[2]C[-45]=""ВМ"")*(R[3]C[-60]:R[3]C[-45]=""""))" & _
    "+SUMPRODUCT((RC[-60]:RC[-46]=""СП"")*(R[1]C[-60]:R[1]C[-46]=""""))+SUMPRODUCT((R[2]C[-60]:R[2]C[-45]=""СП"")*(R[3]C[-60]:R[3]C[-45]=""""))" & _
    "+SUMPRODUCT((RC[-60]:RC[-46]=""К"")*(R[1]C[-60]:R[1]C[-46]=""""))+SUMPRODUCT((R[2]C[-60]:R[2]C[-45]=""К"")*(R[3]C[-60]:R[3]C[-45]=""""))"
i = i + 4
Loop
'----------------Форматирование подножия------------------
Range(Cells(i, 2), Cells(i, 22)).Select
  ob_cell
  format_cell_l_w
  format_font_11b
  Line_kr
Range(Cells(i, 23), Cells(i, 71)).Select
  format_cell_r_w
  format_font_10
  Line_kr_j_v
Cells(i, 23) = iday
iiday = iiday + iday
Cells(i, 24) = ichas
iichas = iichas + ichas
For t = 25 To 68
Cells(i, t).Select
 ActiveCell.FormulaR1C1 = "=SUM(R[-" + CStr(i - ob - 2) + "]C:R[-1]C)"
Next t
i = i + 1
If Trim(Cells(i, 2)) = "Итого по объекту:" Then
  Range(Cells(i, 2), Cells(i, 22)).Select
    ob_cell
    format_cell_l_w
    format_font_11b
    Line_kr
  Range(Cells(i, 23), Cells(i, 71)).Select
    format_cell_r_w
    format_font_10
    Line_kr_j_v
  bb = False
  For t = tnr To i
    If Trim(Cells(t, 2)) = "Итого по листу:" Then
      If bb = False Then
        st_f = "=R[-" + CStr(i - t) + "]C"
      Else
        st_f = st_f + "+R[-" + CStr(i - t) + "]C"
      End If
      bb = True
    End If
  Next t
  For t = 23 To 68
    Cells(i, t).Select
    ActiveCell.FormulaR1C1 = st_f
  Next t
  i = i + 1
End If
If Cells(i, 1) <> "end" Then
  Range(Cells(i, 1), Cells(i, 1)).Select
    ActiveWindow.SelectedSheets.HPageBreaks.Add Before:=ActiveCell
End If
Loop Until Cells(i, 1) = "end"
Range(Cells(i, 1), Cells(i, 1)).Select
    Selection.Font.ColorIndex = 2
i = i + 1
Range(Cells(i, 2), Cells(i, 22)).Select
  ob_cell
  format_cell_l_w
  format_font_11b
  Line_kr
Range(Cells(i, 23), Cells(i, 71)).Select
  format_cell_r_w
  format_font_10
  Line_kr_j_v
bb = False
For t = 1 To i
  If Trim(Cells(t, 2)) = "Итого по объекту:" Then
    If bb = False Then
      st_f = "=R[-" + CStr(i - t) + "]C"
    Else
      st_f = st_f + "+R[-" + CStr(i - t) + "]C"
    End If
    bb = True
  End If
Next t
Cells(i, 23) = iiday
Cells(i, 24) = iichas
For t = 23 To 68
Cells(i, t).Select
 ActiveCell.FormulaR1C1 = st_f
Next t
i = i + 2
Range(Cells(i, 2), Cells(i, 9)).Select
  ob_cell
  format_cell_l_w
  format_font_14b
Range(Cells(i, 10), Cells(i, 12)).Select
  ob_cell
  format_cell_w
  format_font_14b
  Line_niz
Range(Cells(i, 13), Cells(i, 13)).Select
  format_cell_l_w
  format_font_14b
i = i + 2
Range(Cells(i, 1), Cells(i, 1)).Select
  format_cell_l_w
  format_font_14b
Range(Cells(i, 10), Cells(i, 15)).Select
  ob_cell
  format_cell_w
  format_font_12
Range(Cells(i, 17), Cells(i, 22)).Select
  ob_cell
  format_cell_w
  format_font_12
Range(Cells(i, 24), Cells(i, 31)).Select
  ob_cell
  format_cell_w
  format_font_12b
Range(Cells(i, 40), Cells(i, 40)).Select
  format_cell_l_w
  format_font_14b
Range(Cells(i, 49), Cells(i, 54)).Select
  ob_cell
  format_cell_w
  format_font_12
Range(Cells(i, 56), Cells(i, 61)).Select
  ob_cell
  format_cell_w
  format_font_12
Range(Cells(i, 63), Cells(i, 69)).Select
  ob_cell
  format_cell_w
  format_font_12b
i = i + 1
Range(Cells(i, 10), Cells(i, 15)).Select
  ob_cell
  format_cell_w
  format_font_12
  Line_verx
Range(Cells(i, 17), Cells(i, 22)).Select
  ob_cell
  format_cell_w
  format_font_12
  Line_verx
Range(Cells(i, 24), Cells(i, 31)).Select
  ob_cell
  format_cell_w
  format_font_12
  Line_verx
Range(Cells(i, 49), Cells(i, 54)).Select
  ob_cell
  format_cell_w
  format_font_12
  Line_verx
Range(Cells(i, 56), Cells(i, 61)).Select
  ob_cell
  format_cell_w
  format_font_12
  Line_verx
Range(Cells(i, 63), Cells(i, 69)).Select
  ob_cell
  format_cell_w
  format_font_12
  Line_verx
i = i + 2
Range(Cells(i, 1), Cells(i, 1)).Select
  format_cell_l_w
  format_font_14b
Range(Cells(i, 10), Cells(i, 15)).Select
  ob_cell
  format_cell_w
  format_font_12
Range(Cells(i, 17), Cells(i, 22)).Select
  ob_cell
  format_cell_w
  format_font_12
Range(Cells(i, 24), Cells(i, 31)).Select
  ob_cell
  format_cell_w
  format_font_12b
Range(Cells(i, 40), Cells(i, 40)).Select
  format_cell_l_w
  format_font_14b
Range(Cells(i, 49), Cells(i, 54)).Select
  ob_cell
  format_cell_w
  format_font_12
Range(Cells(i, 56), Cells(i, 61)).Select
  ob_cell
  format_cell_w
  format_font_12
Range(Cells(i, 63), Cells(i, 69)).Select
  ob_cell
  format_cell_w
  format_font_12b
i = i + 1
Range(Cells(i, 10), Cells(i, 15)).Select
  ob_cell
  format_cell_w
  format_font_12
  Line_verx
Range(Cells(i, 17), Cells(i, 22)).Select
  ob_cell
  format_cell_w
  format_font_12
  Line_verx
Range(Cells(i, 24), Cells(i, 31)).Select
  ob_cell
  format_cell_w
  format_font_12
  Line_verx
Range(Cells(i, 49), Cells(i, 54)).Select
  ob_cell
  format_cell_w
  format_font_12
  Line_verx
Range(Cells(i, 56), Cells(i, 61)).Select
  ob_cell
  format_cell_w
  format_font_12
  Line_verx
Range(Cells(i, 63), Cells(i, 69)).Select
  ob_cell
  format_cell_w
  format_font_12
  Line_verx
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
Function format_cell_r()
    With Selection
        .HorizontalAlignment = xlRight
        .VerticalAlignment = xlCenter
        .WrapText = True
End With
End Function
Function format_cell_r_w()
    With Selection
        .HorizontalAlignment = xlRight
        .VerticalAlignment = xlCenter
        .WrapText = False
End With
End Function
Function format_font_18()
With Selection.Font
  .Name = "Times New Roman"
  .Size = 18
End With
End Function
Function format_font_14()
With Selection.Font
  .Size = 14
End With
End Function
Function format_font_14b()
With Selection.Font
  .Size = 14
  .Bold = True
End With
End Function
Function format_font_12()
With Selection.Font
  .Size = 12
End With
End Function
Function format_font_12b()
With Selection.Font
  .Size = 12
  .Bold = True
End With
End Function
Function format_font_11()
With Selection.Font
  .Size = 11
End With
End Function
Function format_font_11b()
With Selection.Font
  .Size = 11
  .Bold = True
End With
End Function
Function format_font_10()
With Selection.Font
  .Size = 10
End With
End Function
Function format_font_10b()
With Selection.Font
  .Size = 10
  .Bold = True
End With
End Function
Function format_font_8()
With Selection.Font
  .Size = 8
End With
End Function
Function format_font_8b()
With Selection.Font
  .Name = "Arial Cyr"
  .Size = 8
  .Bold = True
End With
End Function
Function format_font_8_I()
With Selection.Font
  .Size = 8
  .Italic = True
End With
End Function
Function format_font_7()
With Selection.Font
  .Size = 7
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
Function Line_niz()
    With Selection.Borders(xlEdgeBottom)
        .LineStyle = xlContinuous
        .Weight = xlThin
        .ColorIndex = xlAutomatic
    End With
End Function
Function Line_kr_j()
    With Selection.Borders(xlEdgeLeft)
        .LineStyle = xlContinuous
        .Weight = xlMedium
        .ColorIndex = xlAutomatic
    End With
    With Selection.Borders(xlEdgeTop)
        .LineStyle = xlContinuous
        .Weight = xlMedium
        .ColorIndex = xlAutomatic
    End With
    With Selection.Borders(xlEdgeBottom)
        .LineStyle = xlContinuous
        .Weight = xlMedium
        .ColorIndex = xlAutomatic
    End With
    With Selection.Borders(xlEdgeRight)
        .LineStyle = xlContinuous
        .Weight = xlMedium
        .ColorIndex = xlAutomatic
    End With
    With Selection.Borders(xlInsideVertical)
        .LineStyle = xlContinuous
        .Weight = xlThin
        .ColorIndex = xlAutomatic
    End With
    With Selection.Borders(xlInsideHorizontal)
        .LineStyle = xlContinuous
        .Weight = xlThin
        .ColorIndex = xlAutomatic
    End With
End Function
Function Line_kr_j_v()
    With Selection.Borders(xlEdgeLeft)
        .LineStyle = xlContinuous
        .Weight = xlMedium
        .ColorIndex = xlAutomatic
    End With
    With Selection.Borders(xlEdgeTop)
        .LineStyle = xlContinuous
        .Weight = xlMedium
        .ColorIndex = xlAutomatic
    End With
    With Selection.Borders(xlEdgeBottom)
        .LineStyle = xlContinuous
        .Weight = xlMedium
        .ColorIndex = xlAutomatic
    End With
    With Selection.Borders(xlEdgeRight)
        .LineStyle = xlContinuous
        .Weight = xlMedium
        .ColorIndex = xlAutomatic
    End With
    With Selection.Borders(xlInsideVertical)
        .LineStyle = xlContinuous
        .Weight = xlThin
        .ColorIndex = xlAutomatic
    End With
End Function
Function Line_kr()
    With Selection.Borders(xlEdgeLeft)
        .LineStyle = xlContinuous
        .Weight = xlMedium
        .ColorIndex = xlAutomatic
    End With
    With Selection.Borders(xlEdgeTop)
        .LineStyle = xlContinuous
        .Weight = xlMedium
        .ColorIndex = xlAutomatic
    End With
    With Selection.Borders(xlEdgeBottom)
        .LineStyle = xlContinuous
        .Weight = xlMedium
        .ColorIndex = xlAutomatic
    End With
    With Selection.Borders(xlEdgeRight)
        .LineStyle = xlContinuous
        .Weight = xlMedium
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
        .LeftMargin = Application.InchesToPoints(0.590551181102362)
        .RightMargin = Application.InchesToPoints(0.196850393700787)
        .TopMargin = Application.InchesToPoints(0.196850393700787)
        .BottomMargin = Application.InchesToPoints(0.275590551181102)
        .HeaderMargin = Application.InchesToPoints(0.196850393700787)
        .FooterMargin = Application.InchesToPoints(0.275590551181102)
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
        .Zoom = 37
        .PrintErrors = xlPrintErrorsDisplayed
    End With
    ActiveWindow.View = xlPageBreakPreview
    ActiveWindow.Zoom = 70
End Function

