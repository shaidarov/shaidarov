//------------------------------------------------------------------------------
//                                                      (c) ��௮��� ���������
//------------------------------------------------------------------------------
.set name = 'Statis'
.hide
.nameinlist 'Statis'
.fields
datan
datok
nrec_podr
Podr
Ob_podr
Kat
Chislennost
.endfields
!-------------------------------------------------------------------------------
! ������� ������� ���
!-------------------------------------------------------------------------------
^^
.{
.{
.{
^^^^^
.}
.}
.}
!-------------------------------------------------------------------------------
.endform
!-------------------------------------------------------------------------------
! �᭮���� �ଠ
!-------------------------------------------------------------------------------

/*.linkform 'Statis_01' prototype is 'Statis'
.nameinlist '�।��ᯨ�筠� �᫥������ �� ��ਮ�'
.var
  fname:String
  FBasName:String
  x:Integer
  pos_x:Integer
.endvar
.fields
.endfields
.begin
    pos_x:=0;
    FBasName:=GetStringParameter('Files','OutputFilesDirectory',ifFirstParameter);
    FBasName:=FBasName+'Statis.xls';
    DeleteFile(FBasName);
    xlCreateExcel(FBasName,true);  // ᮧ����� Excel
    xlSetActiveWorkBookByName(fname);  // ����� ��⨢��
      xlGetSheetsCount(x);
      while x > 1
       do
        {
          xlSetActiveSheet(x);
          xlDeleteSheet(x);
          xlGetSheetsCount(x);
        }
      xlSetSheetName(1,'����⨪�');        // ��� ��ࢮ�� ����
      xlSetActiveSheet(1);              // ��⨢�� ���� ����
      xlSetCellStringValue('�।��ᯨ�筠� �᫥������', pos_x+1, 1, pos_x+1, 3);
      xlSetCellStringValue('c '+DateToStr(StrToDate(datan,'DD/MM/YYYY'),'MONTH')+' �� '+DateToStr(StrToDate(datok,'DD/MM/YYYY'),'MONTH')+' '+year(StrToDate(datan,'DD/MM/YYYY')), pos_x+2, 1, pos_x+2, 3);
      pos_x:=pos_x+3;
end.
.{
.{
.begin
  xlSetCellStringValue(Podr, pos_x, 1, pos_x, 1);
  xlSetCellStringValue(Kat, pos_x, 2, pos_x, 2);
  xlSetCellStringValue(DoubleToStr(Chislennost,'6666.888'), pos_x, 3, pos_x, 3);
  pos_x:=pos_x+1;
end.
.}
.}
.begin
   xlKillExcel;                       // ����砭�� ࠡ��� � Excel
   Statis_01.fexit;
end.
.endform
*/
