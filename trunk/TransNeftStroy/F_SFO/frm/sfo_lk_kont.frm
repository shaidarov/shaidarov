.LinkForm 'PERSCARDongss' Prototype is 'PERSCARDPROT'
.Group '���� ����窨 ��� ���'
.Group '���� ����窨 ��� ��� (��������)'
.NameInList '���. ����஫� ���������� ���譨� ��ਡ�⮢'
.var
prim :string;
.endvar

.Create view t1
as select
perssfo.nrec
from
     perssfo,
     mbpin,
     attrnam attrnams,
     attrval attrvals,
     attrnam attrnamv,
     attrval attrvalv,
     attrnam attrnamc,
     attrval attrvalc,
     attrnam attrnamp,
     attrval attrvalp,
     attrnam attrnamo,
     attrval attrvalo,
     attrnam,
     attrval

where ((
        CardNo              == perscard.cardnom

        and word(4005)      == attrnams.wtable
        and '���� �����' == attrnams.name
        and word(4005)      == attrvals.wtable
        and perscard.nrec   == attrvals.crec
        and attrnams.nrec   == attrvals.cattrnam

        and word(4005)      == attrnamv.wtable
        and '���� �த�樨, ࠡ��, ���' == attrnamv.name
        and word(4005)      == attrvalv.wtable
        and perscard.nrec   == attrvalv.crec
        and attrnamv.nrec   == attrvalv.cattrnam

        and perscard.cpodr  == fpco.cmean(noindex)

        and word(4005)      == attrnamc.wtable
        and '������ �⢥��⢥�����' == attrnamc.name
        and word(4005)      == attrvalc.wtable
        and perscard.nrec   == attrvalc.crec
        and attrnamc.nrec   == attrvalc.cattrnam

        and perscard.cpodr  ==  katpodr.nrec

        and word(4005)      == attrnamp.wtable
        and '���ࠧ������� �⭥ᥭ�� �����' == attrnamp.name
        and word(4005)      == attrvalp.wtable
        and perscard.nrec   == attrvalp.crec
        and attrnamp.nrec   == attrvalp.cattrnam

        and word(4005)      == attrnam.wtable
        and '��� �⭥ᥭ�� �����' == attrnam.name
        and word(4005)      == attrval.wtable
        and perscard.nrec   == attrval.crec
        and attrnam.nrec    == attrval.cattrnam

        and word(4005)      == attrnamo.wtable
        and '��ꥪ�� ��ந⥫��⢠' == attrnamo.name
        and word(4005)      == attrvalo.wtable
        and perscard.nrec   == attrvalo.crec
        and attrnamo.nrec   == attrvalo.cattrnam

      ))
;

.fields
  CardNo
  substr(trim(prim),1,length(trim(prim))-1)
.endfields
���� � �஢�થ ���������� ��ਡ�⮢ � ����� ����窠�

����������������������������������������������������������������������������������������������Ŀ
������ ����窨  �                                ���ᠭ��                                     �
����������������������������������������������������������������������������������������������Ĵ
.{
.begin

prim:='';

t1._loop perscard
 {
if t1.getfirst attrnam = tsok
if t1.getfirst attrval <> tsok
 {
  prim:='�� 㪠��� ��� �����, ';
 }

if t1.getfirst attrnamo = tsok
if t1.getfirst attrvalo <> tsok
 {
  prim:=prim+'�� 㪠��� ��ꥪ� ��ந⥫��⢠, ';
 }

if t1.getfirst attrnams = tsok
if t1.getfirst attrvals <> tsok
 {
  prim:=prim+'�� 㪠���� ����� �����, ';
 }

if t1.getfirst attrnamv = tsok
if t1.getfirst attrvalv <> tsok
 {
  prim:=prim+'�� 㪠��� ��� �த�樨, ';
 }

if t1.getfirst attrnamc = tsok
if t1.getfirst attrvalc <> tsok
 {
  prim:=prim+'�� 㪠��� 業�� �⢥��⢥�����, ';
 }

if t1.getfirst attrnamp = tsok
if t1.getfirst attrvalp <> tsok
 {
  prim:=prim+'�� 㪠���� ���ࠧ������� �⭥ᥭ�� �����,';
 }

 }
end.
.{?internal; prim<>''
�@@@@@@@@@@@@@@@@�@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@�
����������������������������������������������������������������������������������������������Ĵ
.}
.{?internal; (IsCustom)
.}
.{?internal;(frmFlag=True)
.{CheckEnter FRMCIRCLE
.}
.}
.{?internal;(spcFlag=True)
.{CheckEnter SPCCIRCLE
.}
.}
.{
.}
.}
������������������������������������������������������������������������������������������������
.endform
