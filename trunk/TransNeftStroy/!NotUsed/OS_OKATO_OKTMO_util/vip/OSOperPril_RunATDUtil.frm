.LinkForm 'OSOPERPRIL_UTIL' Prototype is 'OSOPERPRIL'
.Group 'Приложения к акту'
.NameInList '!!! Проставить ОКТМО в новое значение изменяемого параметра АТД по существующему коду ОКАТО'
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
