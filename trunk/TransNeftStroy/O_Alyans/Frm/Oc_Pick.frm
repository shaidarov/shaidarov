.LinkForm 'OSKATREE_Pick' Prototype is 'OSKATREE'
.Group 'Reestr'
.NameInList '������� �� DBF � ����� INVNUM'
.p 50
.var
 whandle:longint
 wnmdbf :string
 winnnum :string ;
 wkl:boolean
.endvar
.create view vvv
as select katos.innum
from katos,pick
where ((
 15 == katos.tidk
 and 0 == katos.CHIGHEROS
and winnnum== katos.innum 
)) ;
.fields
  winnnum
  if(vvv.getfirst katos=0,vvv.katos.innum,'�� �������')
.endfields
.BEGIN
 wkl:=true ;
 do {
  wnmdbf:=GetFileName('*.dbf','�롥�� 䠩� ��� ����⪨ � ����� invnum') ; 
  if not filEexist(wnmdbf)
  { if message('䠩� '+wnmdbf+ ' �� �������'+chr(13)+
            '�������? ', YesNo)<>cmYes
    { wkl:=false ;
      OSKATREE.fexit ;
    }         
  } 
  else wkl:=false         
 } while wkl
 end.
.{CheckEnter FiltersKatOs 
.} 
.{CheckEnter CYCLEOFKART   
.}
.begin
  wHandle:=Dbfopen(wnmDBF,stOpenRead)
  wkl:=dbfgetfirst(whandle)=0
  vvv.delete all pick where (( 27 == wlist )) ;
 end.
��� � ���/��� � ���� 
.{ while wkl 
.begin
  winnnum:=trim(DBFGetFieldValue(wHandle,'INVNUM'))
  if vvv.getfirst katos=0
  { vvv.insert into pick set pick.wlist:=27,pick.crec:=katos.nrec ;
  
  }
 end.
^/^
.begin
  wkl:=dbfgetnext(whandle)=0
  if not nextvisual wkl:=fALSE ;
 end.
.}
.begin
      dbfclose(whandle) ; 
end.
.endform