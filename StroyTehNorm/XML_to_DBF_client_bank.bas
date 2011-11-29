Attribute VB_Name = "Module1"
Sub XML_to_BDF()
    
Range("Y1").FormulaR1C1 = "D/K"
    
      i = 2
While Cells(i, 12) <> ""
    If Cells(i, 13) = "" Then
        Range(Cells(i, 25), Cells(i, 36)).Cut Destination:=Range(Cells(i, 13), Cells(i, 24))
        Range(Cells(i, 25), Cells(i, 25)).FormulaR1C1 = "d"
                         Else
                         Range(Cells(i, 25), Cells(i, 25)).FormulaR1C1 = "k"
    End If
    
    i = i + 1
Wend
    
    Cells.NumberFormat = "0"
    Cells.ColumnWidth = 200
    
    Cells.EntireColumn.AutoFit

    ChDir "E:\!StroyTehNorm\client-bank\EXPORT\1"
    
    ActiveWorkbook.SaveAs Filename:= _
        "E:\!StroyTehNorm\client-bank\EXPORT\1\bank.dbf", FileFormat:=xlDBF4, _
        CreateBackup:=False
    
    ActiveWorkbook.Close SaveChanges

End Sub


