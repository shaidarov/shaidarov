.form 'control_122'
.nameinlist '������ ��ᮮ⢥��⢨� ����ࠣ��⮢ � �������� � ����'
.group '����஫� ᮮ⢥��⢨� ����⨢���� ������'
.ard
.p 60
.defo portrait
.var
 d1,d2:date;
 b2,b3:byte;
 npp:integer;
 str:string;
.endvar
.create view t1 as
select basedoc.nodoc,basedoc.ddoc,basedoc.descr,basedoc.total,schet.name,
if(dogov.nrec=2,plat.name,dogov.name)(Fieldname=dorg)
from basedoc,dogovor,
katorg schet,katorg dogov,katorg plat where
((
basedoc.cdogovor/==dogovor.nrec
and basedoc.corg==schet.nrec
and dogovor.cpol==dogov.nrec
and dogovor.cplat==plat.nrec
))
and basedoc.corg<>dogovor.cplat
and basedoc.corg<>dogovor.cpol
and basedoc.ddoc>=d1
and basedoc.ddoc<=d2
and (basedoc.viddoc=101
or basedoc.viddoc=111
or basedoc.viddoc=201
or basedoc.viddoc=211)
order ord1 by basedoc.viddoc,basedoc.ddoc
order ord2 by basedoc.viddoc,basedoc.descr;
.begin
 d1:=DGETTUNE('dat_m_ot');
 d2:=DATE(LAST_DAY(d1),MONTH(d1),YEAR(d1));
 IF RunInterface(control_105,d1,d2,b2,b3)=cmCancel control_122.fexit;
 IF b3=0 SETORDER(tiOrd1);
 ELSE SETORDER(tiOrd2);
 IF b2=1 d1:=date(1,6,2001);
 npp:=0;
end.
.fields
 commonformheader
 d1
 d2
 if(basedoc.viddoc=101,'��� �� ���㯪�',if(basedoc.viddoc=111,
 '��� �� �।������ ���㯮�',if(basedoc.viddoc=201,'��� �� �த���','��� �� �।������')))
 npp
 t1.basedoc.ddoc
 t1.basedoc.descr
 t1.basedoc.nodoc
 t1.schet.name
 t1.dorg
 t1.basedoc.total
.endfields
^
             ��        �������� ��ᮮ⢥��⢨� ����ࠣ��⮢
                           � �������� � ����
                        c @@@@@@@@@@ �� @@@@@@@@@@
.{table 't1' BY basedoc.viddoc
.��[h
                                                                                                                                               ���� @np@
   �������������������������������������������������������������������������������������������������������������������������������������������������������Ŀ
   �   N   �   ���    ����ਯ��     �����    �            ����ࠣ��� �� ����               �           ����ࠣ��� �� ��������          �    C㬬�     �
   �  �/�  � ���㬥�� �          �   ���㬥��  �                                              �                                           � �� ���㬥��� �
   ���������������������������������������������������������������������������������������������������������������������������������������������������������
.]h
    ��@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@��
.{BY basedoc.nrec
.begin
 npp:=npp+1;
end.
      &&&&& @@@@@@@@@@@ @@@@@@@@@@ @@@@@@@@@@@@@@ @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@  @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@   &&&&&&&&&.&&��
.}
.}
.endform