.LinkForm 'OSOPERPRIL_UTIL' Prototype is 'OSOPERPRIL'
.Group '�ਫ������ � ����'
.NameInList '!!! ���⠢��� ����� � ����� ���祭�� �����塞��� ��ࠬ��� ��� �� �������饬� ���� �����'
.f "NUL"
.fields
.endfields

.{OSOPEROBJLOOP
.begin
  RunInterface('OsOperFill_OKATO_OKTMO', MoveOsNRec, NastrOsNRec);
end.
.{OSOPERPRILGOODSLOOP
.{CheckEnter OSOPERPRILMEMO
.}
.}
.if PAGESYMBOL
.else
.end
.}
.endform
