.LinkForm 'PERSCARDongss' Prototype is 'PERSCARDPROT'
.Group '���� ����窨 ��� ���'
.Group '���� ����窨 ��� ��� (��������)'
.NameInList '����஫� ���������� ���譨� ��ਡ�⮢ �� ���� ����窠�'
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
  prim
.endfields
���� � �஢�થ ���������� ��ਡ�⮢ � ����� ����窠�

����������������������������������������������������������������������������������������������Ŀ
������ ����窨  �                                ���ᠭ��                                     �
����������������������������������������������������������������������������������������������Ĵ
.{
.begin
 if t1.getfirst perscard = tsok
 {

 if t1.perscard.cmol = 0
  {
   t1.perscard.cmol := 013F000000000019h;
   t1.update current perscard;

  }

 if t1.getfirst attrnams = tsok
 if t1.getfirst attrvals <> tsok
  {
   t1.ClearBuffer(t1.tnattrvals);
   t1.attrvals.wtable   := word(4005);
   t1.attrvals.crec     := t1.perscard.nrec;
   t1.attrvals.cattrnam := t1.attrnams.nrec;
   t1.attrvals.vcomp    := 28147497671089137;
   t1.attrvals.vstring  := '��稥 ��室� �� ��࠭� ��㤠 � �孨�� ������᭮��';
   t1.insert current attrvals;
  }

 if t1.getfirst attrnamv = tsok
 if t1.getfirst attrvalv <> tsok
  {
   t1.ClearBuffer(t1.tnattrvalv);
   t1.attrvalv.wtable   := word(4005);
   t1.attrvalv.crec     := t1.perscard.nrec;
   t1.attrvalv.cattrnam := t1.attrnamv.nrec;
   t1.attrvalv.vcomp    := 28147497671068490;
   t1.attrvalv.vstring  := '��ந⥫�� ࠡ��� (����� ��ந⥫��⢮)';
   t1.insert current attrvalv;
  }

 if t1.getfirst fpco = tsok
  {
 if t1.getfirst attrnamc = tsok
 if t1.getfirst attrvalc <> tsok
  {
   t1.ClearBuffer(t1.tnattrvalc);
   t1.attrvalc.wtable   := word(4005);
   t1.attrvalc.crec     := t1.perscard.nrec;
   t1.attrvalc.cattrnam := t1.attrnamc.nrec;
   t1.attrvalc.vcomp    := fpco.nrec;
   t1.attrvalc.vstring  := fpco.name;
   t1.insert current attrvalc;
  }
  }

 if t1.getfirst katpodr = tsok
  {
 if t1.getfirst attrnamp = tsok
 if t1.getfirst attrvalp <> tsok
  {
   t1.ClearBuffer(t1.tnattrvalp);
   t1.attrvalp.wtable   := word(4005);
   t1.attrvalp.crec     := t1.perscard.nrec;
   t1.attrvalp.cattrnam := t1.attrnamp.nrec;
   t1.attrvalp.vcomp    := katpodr.nrec;
   t1.attrvalp.vstring  := katpodr.name;
   t1.insert current attrvalp;
  }
  }

 if t1.getfirst attrnam = tsok
 if t1.getfirst attrval = tsok
  {
   if t1.attrval.vcomp = 0064000000000080h
    {
    if t1.getfirst attrnamo = tsok
    if t1.getfirst attrvalo = tsok
     {
      if t1.attrvalo.vcomp <> 013F000000000023h
       {
        t1.attrvalo.vcomp    := 013F000000000023h;
        t1.attrvalo.vstring  := '�ᯮ����⥫�� ��室�';
        if t1.update current attrvalo = tsok {}
       }
     }
     else
      {
       t1.ClearBuffer(t1.tnattrvalo);
       t1.attrvalo.wtable   := word(4005);
       t1.attrvalo.crec     := t1.perscard.nrec;
       t1.attrvalo.cattrnam := t1.attrnamo.nrec;
       t1.attrvalo.vcomp    := 013F000000000023h;
       t1.attrvalo.vstring  := '�ᯮ����⥫�� ��室�';
       t1.insert current attrvalo;
      }
    }
   if t1.attrval.vcomp = 0064000000000083h
    {
    if t1.getfirst attrnamo = tsok
    if t1.getfirst attrvalo = tsok
     {
      if t1.attrvalo.vcomp <> 013E000000000239h
       {
        t1.attrvalo.vcomp    := 013E000000000239h;
        t1.attrvalo.vstring  := '���宧��⢥���  ��室�';
        if t1.update current attrvalo = tsok {}
       }
     }
     else
      {
       t1.ClearBuffer(t1.tnattrvalo);
       t1.attrvalo.wtable   := word(4005);
       t1.attrvalo.crec     := t1.perscard.nrec;
       t1.attrvalo.cattrnam := t1.attrnamo.nrec;
       t1.attrvalo.vcomp    := 013E000000000239h;
       t1.attrvalo.vstring  := '���宧��⢥���  ��室�';
       t1.insert current attrvalo;
      }

    }
  }

//0064000000000080h 23 ���,   013F000000000023h - �ᯮ����⥫��
//0064000000000083h 26 ���   013E000000000239h  - ���宧��⢥���

prim:='';

if t1.getfirst attrnam = tsok
if t1.getfirst attrval <> tsok
 {
  prim:='�� 㪠��� ��� �����';
 }

if t1.getfirst attrnamo = tsok
if t1.getfirst attrvalo <> tsok
 {
  prim:=prim+', �� 㪠��� ��ꥪ� ��ந⥫��⢠';
 }
 }
end.
.{?internal; prim<>''
�@@@@@@@@@@@@@@@@�@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@�
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
