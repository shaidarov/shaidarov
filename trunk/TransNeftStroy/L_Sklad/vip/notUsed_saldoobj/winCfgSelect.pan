Var
  sDescr, sDesgr : string;
!-------------------------------------------------------------------------------
Window winCfgEdit '������ ����' Gray;
  Show at (5,2,,21)
Panel panCfgEdit
  Table OborCfg;
Screen scrCfgEdit
  Show at (,,,9)
  Fields
    OborCfg.nRep       ('� 蠡����')
      : NoProtect;
    OborCfg.RepName    ('������������ 蠡����')
      : NoProtect;
    OborCfg.wFilter[6] ('��㯯�஢�� 1')
      : [ list 0 ''], Protect;
    OborCfg.wFilter[0] ('��� ����')
      : [ list 0 '���쪮 ᠫ줮',
               1 '���쪮 ��室�',
               2 '���쪮 ��室�',
               3 '��室� � ��室�',
               4 '���줮 � ��������',
               5 '���줮 � �������� � ����஢���'
               // , 5 '�ࠢ����� ᠫ줮'
               ], Protect;
    OborCfg.wFilter[7] ('��㯯�஢�� 2')
      : [ list 0 ''], Protect;
    OborCfg.wFilter[1] ('��� ᠫ줮')
      : [ list 0 '�������� �� ���㬥�⠬',
               1 '�� ���⪮� ���'], skip,Protect;
    OborCfg.wFilter[8] ('��㯯�஢�� 3')
      : [ list 0 ''], Protect;
    OborCfg.sRep[1]    ('�।��⠢��� �ࠢ� �� ���������/㤠�����')
      : NoProtect, PickButton;
    OborCfg.wFilter[9] ('��㯯�஢�� 4')
      : [ list 0 ''], Protect;
    OborCfg.wFilter[2] ('� ��ப� �⮣�� �뢮���� ��� � ������������ �஢��');
    OborCfg.wFilter[10] ('��㯯�஢�� 5')
      : [ list 0 ''], Protect;
    OborCfg.Column    ('������ Excel ��� �뢮�� � ����'): NoProtect, PickButton;
    OborCfg.wFilter[15] ('����� �������'): , NoProtect;
    OborCfg.wFilter[16] ('����� ��ப� '): , NoProtect;
<<

  ������.@@@ ��������.@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@   ��㯯�஢�� 1.@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
  ������� � ����   .@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@   ��㯯�஢�� 2.@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
  ����� ᠫ줮      .@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@   ��㯯�஢�� 3.@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
  ��������� 蠡����  .@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@   ��㯯�஢�� 4.@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
   [.] �뢮���� � �⮣� ��� � �������� �஢��`              ��㯯�஢�� 5.@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
  ������ Excel ����.@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@   �뢮�:����� �������.@@@@@ ����� ��ப�.@@@@@
>>
end; //scrCfgEdit
HandleEvent
  cmCheckField:
  {
    case CurField of
/*2010-saldoobj
      #OborCfg.wFilter[0]:
      {
        If OborCfg.wFilter[0]>0 and OborCfg.wFilter[0]<4
          OborCfg.wFilter[1]:=0;
      }
*/
      #OborCfg.sRep[1]:
        OborCfg.sRep[1]:=' '+Trim(OborCfg.sRep[1])+' ';
    end;
    update current OborCfg;
    RescanPanel(#OborCfg);
  }
  cmPick: {
    If CurField=#OborCfg.sRep[1]
    {
      case (Message('��������� '#13+
                    '��㯯� ���ਯ�஢ - "��" '#13+
                    '���ਯ�� - "���"', YesNo)) of
        cmYes:
          if (RunInterface('C_COMMON::GetGrDescr', sDesgr, FALSE, FALSE, comp(0))<>cmCancel)
            if (Pos(' '+sDesgr+' ', OborCfg.sRep[1]) = 0)
              OborCfg.sRep[1]:=' '+trim(OborCfg.sRep[1]+' '+sDesgr)+' ';
            else
              Message('��㯯� ���ਯ�஢ "'+ sDesgr+'" �뫠 ��������� ࠭��', Information+Cancel);
        cmNo:
          if (RunInterface('C_COMMON::GetDescr', sDescr, sDesgr, word(0))<>cmCancel)
            if (Pos(' '+sDescr+' ', OborCfg.sRep[1]) = 0)
              OborCfg.sRep[1]:=' '+trim(OborCfg.sRep[1]+' '+sDescr)+' ';
            else
              Message('���ਯ�� "'+sDescr+'" �� �������� ࠭��', Information+Cancel);
      end;
      sDescr:=sGetTune('User.Descr');
      sDesgr:=sGetTune('User.DesGr');
      update current OborCfg;
      RescanPanel(#OborCfg);
    }
    if CurField=#OborCfg.Column {
      set OborCfg.Column:=getfilename('*.xls','������ ���� � 䠩��-蠡���� Excel');
      update current OborCfg;
    }
  }
  cmDelOnProtect:
  {
    Case CurField of
      #OborCfg.sRep[1]     : OborCfg.sRep[1]:=' ';
      #OborCfg.wFilter[6]  : OborCfg.wFilter[6] :=0;
      #OborCfg.wFilter[7]  : OborCfg.wFilter[7] :=0;
      #OborCfg.wFilter[8]  : OborCfg.wFilter[8] :=0;
      #OborCfg.wFilter[9]  : OborCfg.wFilter[9] :=0;
      #OborCfg.wFilter[10] : OborCfg.wFilter[10]:=0;
      #OborCfg.wFilter[15] : OborCfg.wFilter[15]:=0;
      #OborCfg.wFilter[16] : OborCfg.wFilter[16]:=0;
      #OborCfg.Column      : OborCfg.Column:='';
    end;
    // update current OborCfg;
    RescanPanel(#OborCfg);
  }
end; //handleEvent panCfgEdit
end; //panCfgEdit
Panel panCfgColEdit
  Table OborCfgCol;
Browse scrCfgColEdit
  Show at (,10,72,)
  Fields
    OborCfgCol.nCol
          #3'�'                ('� �/�')                         :  [3], NoProtect;
    OborCfgCol.Name
          #3'����� � �������' ('����� � �������')              : [20], Protect;
    OborCfgCol.NameGroup
          #3'��������� 1'      ('��������� �������. 1 ��ப�')   : [15], NoProtect;
    OborCfgCol.SortName
          #3'��������� 2'      ('��������� �������. 2 ��ப�')   : [13], NoProtect;
    OborCfgCol.Format
          #3'��ଠ�'           ('��ଠ� ������� ��� Excel')      : [10], NoProtect;
    OborCfgCol.Attr[2]
          #3'��ਭ�'           ('��ਭ� ������� ��� Excel')      :  [6], NoProtect;
    OborCfgCol.Attr[3]
          #3'�⮣'             ('�⮣� �� �������')              :  [5], [List 0 '���', 1 '��'];
end; //scrCfgColEdit
Screen scrCfgCol2Edit
  Show at (73,10,79,)
  Buttons
    cmMoveLeft;
    cmMoveRight;
<<
<. < .>

<. > .>
>>
end; //scrCfgCol2Edit
HandleEvent
  cmCheckField:
  {
    update current OborCfgCol;
    RescanPanel(#OborCfgCol);
  }
end; //handleEvent panCfgColEdit
end; //panCfgCol2Edit
Panel panCfgCol3Edit
  Table collist;
Browse scrCfgCol3Edit
  Show at (80,10,,)
  Fields
    collist.n
          #3'����㯭� �������' ('������������ ����㯭�� �������') : [20], Protect;
end; //scrCfgCol3Edit
end; //panCfgCol3Edit
HandleEvent
  cmInit:
  {
    //salsoobj OborCfg.wFilter[1]:=0;
    SetEnumList(scrCfgEdit, #OborCfg.wFilter[6],  sGroupName);
    SetEnumList(scrCfgEdit, #OborCfg.wFilter[7],  sGroupName);
    SetEnumList(scrCfgEdit, #OborCfg.wFilter[8],  sGroupName);
    SetEnumList(scrCfgEdit, #OborCfg.wFilter[9],  sGroupName);
    SetEnumList(scrCfgEdit, #OborCfg.wFilter[10], sGroupName);
  }
  cmMoveLeft:
  {
    PushPos(#OborCfgCol);
    if (getfirst OborCfgCol where ((OborCfg.nRec==OborCfgCol.cOborCfg))
                                    and OborCfgCol.Attr[0]=collist.t
                                    and OborCfgCol.Attr[1]=collist.i)=tsOk
    {
      If Message('����� ������� 㦥 ����. �� ࠢ�� ��������?',YesNo)=cmNo
      {
        PopPos(#OborCfgCol);
        Abort;
      }
    }
    if getlast OborCfgCol where ((OborCfg.nRec==OborCfgCol.cOborCfg and 0<<OborCfgCol.nCol))=tsOk
      OborCfgCol.nCol:=OborCfgCol.nCol+1;
    else
      OborCfgCol.nCol:=1;
    OborCfgCol.nRec:=GetNextNrec(#OborCfgCol,0);
    OborCfgCol.cOborCfg:=OborCfg.nRec;
    OborCfgCol.Name:=collist.n;
    OborCfgCol.Attr[0]:=collist.t;
    OborCfgCol.Attr[1]:=collist.i;
    OborCfgCol.Attr[2]:=10;
    OborCfgCol.Attr[3]:=0;
    OborCfgCol.Format:='@';
    OborCfgCol.NameGroup:=collist.n;
    OborCfgCol.SortName:='';
    Case collist.t of
    1: { OborCfgCol.Attr[2]:= 8; OborCfgCol.Attr[3]:=0; OborCfgCol.Format:='@'; }
    2: { OborCfgCol.Attr[2]:=25; OborCfgCol.Attr[3]:=0; OborCfgCol.Format:='@'; }
    3: { OborCfgCol.Attr[2]:=10; OborCfgCol.Attr[3]:=0; OborCfgCol.Format:='@'; }
    4: { OborCfgCol.Attr[2]:=10; OborCfgCol.Attr[3]:=1; OborCfgCol.Format:='# ##0,000'; }
    5: { OborCfgCol.Attr[2]:=10; OborCfgCol.Attr[3]:=1; OborCfgCol.Format:='# ##0,000'; }
    6: { OborCfgCol.Attr[2]:=10; OborCfgCol.Attr[3]:=1; OborCfgCol.Format:='# ##0,00'; }
    end;
    insert current OborCfgCol;
    RescanPanel(#OborCfgCol);
  }
  cmMoveRight:
    If Message('�� 㢥७�, �� ��� 㤠���� �������?',YesNo)=cmYes
    {
      delete current OborCfgCol;
      if getfirst OborCfgCol=tsOk
      { }
      RescanPanel(#OborCfgCol);
    }
  cmDefault:
  {
    Message('�஢�ઠ ���祭��!');
  }
end; //HandleEvent window winCfgEdit
end; //winCfgEdit
!-------------------------------------------------------------------------------
Window winCfgSelect '�롮� 蠡���� ����' Cyan, DoAccept;
  Show at (5,2,,23)
Panel panCfgSelect
  Table OborCfg;
Browse scrCfgSelect
  Show at (,,80,9)
  Fields
    OborCfg.nRep
          #3'�'                    ('� 蠡���� �/�')        :  [5], Protect;
    OborCfg.RepName
          #3'������������ 蠡����' ('������������ 蠡����') : [30], Protect;
    GetTypeReport(OborCfg.wFilter[0])
          #3'��� ����'           ('��� ����')           : [15], Protect;
    GetTypeSaldo(OborCfg.wFilter[1])
          #3'���줮'               ('���줮')               : [15], Protect;
    OborCfg.sRep[1]
          #3'�����'               ('����� � ���������')  : [15], Protect;
    If(OborCfg.wFilter[2]=0,'','V')
          #3'��'                   ('�뢮���� ��� � ������������ �஢�� ��㯯�஢�� � �⮣��')
                                                            :  [2], Protect;
end; // scrCfgSelect
Screen scrCfgSelectGroup
  Show at(81,,,9)
  Fields
    GetOneGroup(OborCfg.wFilter[6])  : Protect, Skip;
    GetOneGroup(OborCfg.wFilter[7])  : Protect, Skip;
    GetOneGroup(OborCfg.wFilter[8])  : Protect, Skip;
    GetOneGroup(OborCfg.wFilter[9])  : Protect, Skip;
    GetOneGroup(OborCfg.wFilter[10]) : Protect, Skip;
  Buttons
    cmEdit;
<<

  ��㯯�஢�� ����:
  1 .@@@@@@@@@@@@@@@@@@@@
  2 .@@@@@@@@@@@@@@@@@@@@
  3 .@@@@@@@@@@@@@@@@@@@@
  4 .@@@@@@@@@@@@@@@@@@@@
  5 .@@@@@@@@@@@@@@@@@@@@
   <. ����ந�� 蠡��� .>
>>
end; // scrCfgSelectGroup
HandleEvent
  cmSetDefault:
  {
    if getlast OborCfg where ((256==OborCfg.vRep and 0<<OborCfg.nRep))=tsOk
      w:=OborCfg.nRep+1;
    else
      w:=1;
    ClearBuffer(#OborCfg);
    OborCfg.nRec:=GetNextNrec(#OborCfg,0);
    OborCfg.vRep:=256;
    OborCfg.nRep:=w;
    OborCfg.RepName:='�������� 蠡����';
    OborCfg.sRep[1]:=' ';

    OborCfg.Column:='';
    OborCfg.wFilter[15]:=0;
    OborCfg.wFilter[16]:=0;

    insert current OborCfg;
    RunWindowModal(winCfgEdit);
    RescanPanel(#OborCfg);
    RescanPanel(#OborCfgCol);
  }
  cmDeleteRecord:
  {
    If Pos(' '+sDescr+' ',' '+Trim(OborCfg.sRep[1])+' ')=0 and
       Pos(' '+sDesgr+' ',' '+Trim(OborCfg.sRep[1])+' ')=0 and
       Trim(OborCfg.sRep[1])<>''
    {
      Message('�� �� ����� �ࠢ �� 㤠����� �⮣� 蠡����!',Error);
      Abort;
    }
    else
      If Message('���७�, �� ��� 㤠���� 蠡��� "'+Trim(OborCfg.RepName)+'" ?',Warning+YesNo)=cmYes
      {
        delete from OborCfgCol where ((OborCfg.nRec==OborCfgCol.cOborCfg));
        delete current OborCfg;
        If getfirst OborCfg=tsOk
        { }
        RescanPanel(#OborCfg);
      }
  }
end; // HandleEvent panel panCfgSelect
end; // panCfgSelect
Panel panCfgSelectCol
  Table OborCfgCol;
Browse scrCfgSelectCol
  Show at (,10,,)
  Fields
    OborCfgCol.nCol
          #3'�'                ('� �/�')                         :  [5], Protect;
    OborCfgCol.Name
          #3'����� � �������' ('����� � �������')              : [35], Protect;
    OborCfgCol.NameGroup
          #3'��������� 1'      ('��������� �������. 1 ��ப�')   : [22], Protect;
    OborCfgCol.SortName
          #3'��������� 2'      ('��������� �������. 2 ��ப�')   : [22], Protect;
    OborCfgCol.Format
          #3'��ଠ�'           ('��ଠ� ������� ��� Excel')      : [15], Protect;
    OborCfgCol.Attr[2]
          #3'��ਭ�'           ('��ਭ� ������� ��� Excel')      :  [8], Protect;
    If(OborCfgCol.Attr[3]=0,'','V')
          #3'�⮣'             ('�⮣ �� �������')               :  [5], Protect;
end; // scrCfgReportCol
HandleEvent
end; // HandleEvent panel panCfgSelectCol
end; // panCfgSelectCol
HandleEvent
  cmInit:
  {
    sDescr := sGetTune('User.Descr');
    sDesgr := sGetTune('User.DesGr');
  }
  cmDefault:
  {
  }
  cmEdit:
  {
    If Pos(' '+sDescr+' ',' '+Trim(OborCfg.sRep[1])+' ')=0 and
       Pos(' '+sDesgr+' ',' '+Trim(OborCfg.sRep[1])+' ')=0 and
       Trim(OborCfg.sRep[1])<>''
    {
      Message('�� �� ����� �ࠢ �� ।���஢���� �⮣� 蠡����!',Error);
      Abort;
    }
    else
    {
      RunWindowModal(winCfgEdit);
      RescanPanel(#OborCfg);
      RescanPanel(#OborCfgCol);
    }
  }
end; // HandleEvent window winCfgSelect
end; // winCfgSelect
