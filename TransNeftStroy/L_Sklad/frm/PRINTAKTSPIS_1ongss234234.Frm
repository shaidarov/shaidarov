.LinkForm 'PRINTAKTSPIS_1ongss234234' Prototype is 'PRINTAKTSPIS'
.NameInList '��� ����� ���㬥�⮢ � ��⥬� "�����⨪�" (�����)'
.var
  mfo_:String
  unn_:String
  okpo_:String
  �����_童��_�����ᨨ:Word
  ���ᨢ_����_�����ᨨ_nRec: ARRAY [1..2] of Comp
  ���ᨢ_����_�����ᨨ_���: ARRAY [1..2] of String
  ���ᨢ_����_�����ᨨ_�������_�����: ARRAY [1..2] of String
  ���ᨢ_����_�����ᨨ_���������: ARRAY [1..2] of String
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
  �����_童��_�����ᨨ := 0;


  for (�����_童��_�����ᨨ := 1; �����_童��_�����ᨨ <= Count(���ᨢ_����_�����ᨨ_nRec); �����_童��_�����ᨨ := �����_童��_�����ᨨ + 1)
  {
    ���ᨢ_����_�����ᨨ_nRec            [�����_童��_�����ᨨ] := comp(0);
    ���ᨢ_����_�����ᨨ_���             [�����_童��_�����ᨨ] := '';
    ���ᨢ_����_�����ᨨ_�������_����� [�����_童��_�����ᨨ] := '';
    ���ᨢ_����_�����ᨨ_���������       [�����_童��_�����ᨨ] := '';
  }

  �����_童��_�����ᨨ := 0;
end.
.{CheckEnter COMMISSIONMEMBER_PRINTAKTSPIS
.begin
  �����_童��_�����ᨨ := �����_童��_�����ᨨ + 1;
  ���ᨢ_����_�����ᨨ_nRec            [�����_童��_�����ᨨ] := ����_�����ᨨ_nRec;
  ���ᨢ_����_�����ᨨ_���             [�����_童��_�����ᨨ] := ����_�����ᨨ_���;
  ���ᨢ_����_�����ᨨ_�������_����� [�����_童��_�����ᨨ] := string(����_�����ᨨ_�������_�����);
  ���ᨢ_����_�����ᨨ_���������       [�����_童��_�����ᨨ] := ����_�����ᨨ_���������;
end.
.}
.begin

  �����_童��_�����ᨨ := 0;

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
   xlSetSheetName(1,'��� �����');
   xlSetActiveSheet(1);
   pos_x:=1;

   xlSetCellStringValue('��� '+�࣠������ , pos_x, 1, pos_x, 1);
   xlSetFontSize(10, pos_x, 1, pos_x, 1);
   xlAlignCellsEx( 2, 2, pos_x, 1, pos_x, 1);
   xlSetFontStyle( 1, pos_x, 1, pos_x, 6);
   pos_x:=pos_x+1;
   xlSetCellStringValue('���ࠧ�������:  '+����� , pos_x, 1, pos_x, 1);
   xlSetFontSize(10, pos_x, 1, pos_x, 6);
   xlAlignCellsEx( 2, 2, pos_x, 1, pos_x, 6);
   xlMergeCells( pos_x, 1, pos_x, 6);
   xlWrapText(pos_x, 1, pos_x, 6);
   pos_x:=pos_x+1;
   xlSetCellStringValue('���:  '+���_��㤠 , pos_x, 1, pos_x, 1);
   xlSetFontSize(10, pos_x, 1, pos_x, 6);
   xlAlignCellsEx( 2, 2, pos_x, 1, pos_x, 6);
   xlMergeCells( pos_x, 1, pos_x, 6);
   xlWrapText(pos_x, 1, pos_x, 6);
   pos_x:=pos_x+2;


   xlSetCellStringValue('��� ����� ���㬥�⮢ � ��⥬� "�����⨪�"', pos_x, 1, pos_x, 1);
   xlSetFontSize(12, pos_x, 1, pos_x, 6);
   xlMergeCells( pos_x, 1, pos_x, 6);
   xlAlignCellsEx( 3, 2, pos_x, 1, pos_x, 6);
   xlSetFontStyle( 1, pos_x, 1, pos_x, 6);
   pos_x:=pos_x+1;
   xlSetCellStringValue('���㬥��: ��� �� ᯨᠭ�� �'+NOM+' �� '+DateToStr(���, 'DD Mon YYYY')+'�.' , pos_x, 1, pos_x, 1);
   xlSetFontSize(10, pos_x, 1, pos_x, 6);
   xlMergeCells( pos_x, 1, pos_x, 6);
   xlAlignCellsEx( 3, 2, pos_x, 1, pos_x, 6);
   xlSetFontStyle( 1, pos_x, 1, pos_x, 6);
   pos_x:=pos_x+2;

   np1 := 1;

   xlSetCellStringValue('�'                    , pos_x, 1, pos_x, 1);
   xlSetCellStringValue('���'                  , pos_x, 2, pos_x, 2);
   xlSetCellStringValue('������������'         , pos_x, 3, pos_x, 3);
   xlSetCellStringValue('��.���.'              , pos_x, 4, pos_x, 4);
   xlSetCellStringValue('���-��'               , pos_x, 5, pos_x, 5);
   xlSetCellStringValue('����'                 , pos_x, 6, pos_x, 6);
   xlSetCellStringValue('�㬬�'                , pos_x, 7, pos_x, 7);

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
  xlSetCellStringValue(chr(39)+��� , pos_x, 2, pos_x, 2);
  xlSetFontSize(8, pos_x, 2, pos_x, 2);
  xlAlignCellsEx( 2, 2, pos_x, 2, pos_x, 2);
  xlSetCellStringValue(chr(39)+������������ , pos_x, 3, pos_x, 3);
  xlSetFontSize(8, pos_x, 3, pos_x, 3);
  xlAlignCellsEx( 2, 2, pos_x, 3, pos_x, 3);
  xlSetCellStringValue(chr(39)+���᪭��_������_����७�� , pos_x, 4, pos_x, 4);
  xlSetFontSize(8, pos_x, 4, pos_x, 4);
  xlAlignCellsEx( 2, 2, pos_x, 4, pos_x, 4);
  xlSetCellStringValue(doubletostr(������⢮,'[|-]36`666`666`666`666.888'), pos_x, 5, pos_x, 5);
  xlSetFontSize(8, pos_x, 5, pos_x, 5);
  xlAlignCellsEx( 4, 2, pos_x, 5, pos_x, 5);
  xlSetCellStringValue(doubletostr(����,'[|-]36`666`666`666`666.88'), pos_x, 6, pos_x, 6);
  xlSetFontSize(8, pos_x, 6, pos_x, 6);
  xlAlignCellsEx( 4, 2, pos_x, 6, pos_x, 6);
  xlSetCellStringValue(doubletostr(�⮨�����,'[|-]36`666`666`666`666.88'), pos_x, 7, pos_x, 7);
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
  xlSetCellStringValue('�����' , pos_x, 1, pos_x, 1);
  xlSetFontSize(8, pos_x, 1, pos_x, 1);
  xlAlignCellsEx( 2, 2, pos_x, 1, pos_x, 1);
  xlSetFontStyle( 1, pos_x, 1, pos_x, 7);

  xlSetCellStringValue(doubletostr(�����,'[|-]36`666`666`666`666.88'), pos_x, 7, pos_x, 7);
  xlSetFontSize(8, pos_x, 7, pos_x, 7);
  xlAlignCellsEx( 4, 2, pos_x, 7, pos_x, 7);

  xlFrameCells(15,2,6,0,pos_x, 1, pos_x, 6);
  xlFrameCells(15,2,6,0,pos_x, 7, pos_x, 7);

  pos_x:=pos_x+2;

  xlMergeCells( pos_x, 1, pos_x, 6);
  xlSetCellStringValue('���㬥�� ���ᥭ � ��⥬� "�����⨪�"', pos_x, 1, pos_x, 1);
  xlSetFontSize(10, pos_x, 1, pos_x, 6);
  xlAlignCellsEx( 2, 2, pos_x, 1, pos_x, 6);
  xlWrapText(pos_x, 1, pos_x, 6);

  pos_x:=pos_x+2;

end.
.{while (�����_童��_�����ᨨ < ������⢮_童���_�����ᨨ)
.begin
  �����_童��_�����ᨨ := �����_童��_�����ᨨ + 1;
  xlMergeCells( pos_x, 1, pos_x, 4);
  xlSetCellStringValue(���ᨢ_����_�����ᨨ_��������� [�����_童��_�����ᨨ], pos_x, 1, pos_x, 1);
  xlSetFontSize(8, pos_x, 1, pos_x, 1);
  xlAlignCellsEx( 2, 2, pos_x, 1, pos_x, 1);
  xlMergeCells( pos_x, 1, pos_x, 2);
  xlSetCellStringValue(���ᨢ_����_�����ᨨ_��� [�����_童��_�����ᨨ], pos_x, 5, pos_x, 5);
  xlSetFontSize(8, pos_x, 5, pos_x, 5);
  xlAlignCellsEx( 2, 2, pos_x, 5, pos_x, 5);
  xlFrameCells(8,2,6,0,pos_x, 3, pos_x, 4);
  xlSetRowHeight(20, pos_x, 1, pos_x, 6);

  pos_x:=pos_x+1;

end.
.}
.begin
DeleteFile(Fmacros);
if not LogStrToFile(Fmacros, 'Sub macros()') message('�訡�� ����� 䠩�� ����� '+fmacros);
LogStrToFile(Fmacros, '    With ActiveSheet.PageSetup                                        ');
LogStrToFile(Fmacros, '       .PrintTitleRows = "$8:$8"                                      ');
LogStrToFile(Fmacros, '       .LeftMargin = Application.InchesToPoints(0.62)                ');   // ����� ����
LogStrToFile(Fmacros, '       .RightMargin = Application.InchesToPoints(0.1)                ');   // �ࠢ�� ����
LogStrToFile(Fmacros, '       .TopMargin = Application.InchesToPoints(0.2)                  ');   // ���孥� ����
LogStrToFile(Fmacros, '       .BottomMargin = Application.InchesToPoints(0.2)               ');   // ������ ����
LogStrToFile(Fmacros, '       .HeaderMargin = Application.InchesToPoints(0.32)              ');   // ���孨� ��������
LogStrToFile(Fmacros, '       .FooterMargin = Application.InchesToPoints(0.32)              ');   // ������ ��������
LogStrToFile(Fmacros, '    End With                                                          ');
LogStrToFile(Fmacros, 'End Sub                                                               ');
if not xlImportModule(Fmacros) message ('�訡�� ����㧪� �����');

xlGetSheetsCount(xx);
   while xx > 0
    do
     {
       xlSetActiveSheet(xx);
       if not xlRunMacro('macros') message('�訡�� ����᪠ �����');
       DeleteFile(Fmacros);
       xx:=xx-1;
     }
 xlKillExcel;
end.
.{?internal;(������⢮_童���_�����ᨨ = 0)
.}
.}
.begin
PRINTAKTSPIS.fexit;
end.
.endform
