.LinkForm 'OSKATREE_UnPick' Prototype is 'OSKATREE'
.Group 'Reestr'
.NameInList '�������������� ������� �� DBF � ����� INVNUM'
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
where (( 15 == katos.tidk and 0 == katos.CHIGHEROS and winnnum== katos.innum ));
.fields
  winnnum
  if(vvv.getfirst katos=0,vvv.katos.innum,'�� �������')
.endfields
.BEGIN
 wkl:=true ;
 do {
  wnmdbf:=GetFileName('*.dbf','�롥�� 䠩� ��� ������஢���� ����⪨ � ����� invnum') ; 
  if not filEexist(wnmdbf)
  { if message('���� '+wnmdbf+ ' �� �������'+chr(13)+
            '�������? ', YesNo)<>cmYes
    { wkl:=false ;
      OSKATREE.fexit ;
    }         
  } 
  else wkl:=false         
 } while wkl
  vvv.delete all pick where (( 27 == wlist )) ;
 end.
.{CheckEnter FiltersKatOs 
.} 
.{CheckEnter CYCLEOFKART 
.begin  
 vvv.insert into pick set pick.wlist:=27,pick.crec:=comp(KatosNrec) ;
end.
.}
.begin
  wHandle:=Dbfopen(wnmDBF,stOpenRead)
  wkl:=dbfgetfirst(whandle)=0
end.
��� � ���/��� � ���� 
.{ while wkl 
.begin
  winnnum:=trim(DBFGetFieldValue(wHandle,'INVNUM'))
  if vvv.getfirst katos=0
  { vvv.delete from pick where ((27==pick.wlist and katos.nrec==pick.crec (noindex) ));
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