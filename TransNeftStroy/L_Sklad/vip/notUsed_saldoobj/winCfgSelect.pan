Var
  sDescr, sDesgr : string;
!-------------------------------------------------------------------------------
Window winCfgEdit 'Шаблон отчета' Gray;
  Show at (5,2,,21)
Panel panCfgEdit
  Table OborCfg;
Screen scrCfgEdit
  Show at (,,,9)
  Fields
    OborCfg.nRep       ('№ шаблона')
      : NoProtect;
    OborCfg.RepName    ('Наименование шаблона')
      : NoProtect;
    OborCfg.wFilter[6] ('Группировка 1')
      : [ list 0 ''], Protect;
    OborCfg.wFilter[0] ('Тип отчета')
      : [ list 0 'Только сальдо',
               1 'Только приходы',
               2 'Только расходы',
               3 'Приходы и расходы',
               4 'Сальдо и движение',
               5 'Сальдо и движение с расшифровкой'
               // , 5 'Сравнение сальдо'
               ], Protect;
    OborCfg.wFilter[7] ('Группировка 2')
      : [ list 0 ''], Protect;
    OborCfg.wFilter[1] ('Тип сальдо')
      : [ list 0 'Рассчитать по документам',
               1 'Из остатков МТР'], skip,Protect;
    OborCfg.wFilter[8] ('Группировка 3')
      : [ list 0 ''], Protect;
    OborCfg.sRep[1]    ('Предоставить права на изменение/удаление')
      : NoProtect, PickButton;
    OborCfg.wFilter[9] ('Группировка 4')
      : [ list 0 ''], Protect;
    OborCfg.wFilter[2] ('В строку итогов выводить код и наименование уровня');
    OborCfg.wFilter[10] ('Группировка 5')
      : [ list 0 ''], Protect;
    OborCfg.Column    ('Шаблон Excel для вывода в отчет'): NoProtect, PickButton;
    OborCfg.wFilter[15] ('Номер колонки'): , NoProtect;
    OborCfg.wFilter[16] ('Номер строки '): , NoProtect;
<<

  Шаблон.@@@ Название.@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@   Группировка 1.@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
  Включать в отчет   .@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@   Группировка 2.@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
  Расчет сальдо      .@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@   Группировка 3.@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
  Изменение шаблона  .@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@   Группировка 4.@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
   [.] Выводить в итоги код и название уровня`              Группировка 5.@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
  Шаблон Excel отчета.@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@   Вывод:Номер колонки.@@@@@ Номер строки.@@@@@
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
      case (Message('Добавлять '#13+
                    'группу дескрипторов - "Да" '#13+
                    'дескриптор - "Нет"', YesNo)) of
        cmYes:
          if (RunInterface('C_COMMON::GetGrDescr', sDesgr, FALSE, FALSE, comp(0))<>cmCancel)
            if (Pos(' '+sDesgr+' ', OborCfg.sRep[1]) = 0)
              OborCfg.sRep[1]:=' '+trim(OborCfg.sRep[1]+' '+sDesgr)+' ';
            else
              Message('Группа дескрипторов "'+ sDesgr+'" была добавлена ранее', Information+Cancel);
        cmNo:
          if (RunInterface('C_COMMON::GetDescr', sDescr, sDesgr, word(0))<>cmCancel)
            if (Pos(' '+sDescr+' ', OborCfg.sRep[1]) = 0)
              OborCfg.sRep[1]:=' '+trim(OborCfg.sRep[1]+' '+sDescr)+' ';
            else
              Message('Дескриптор "'+sDescr+'" был добавлен ранее', Information+Cancel);
      end;
      sDescr:=sGetTune('User.Descr');
      sDesgr:=sGetTune('User.DesGr');
      update current OborCfg;
      RescanPanel(#OborCfg);
    }
    if CurField=#OborCfg.Column {
      set OborCfg.Column:=getfilename('*.xls','Укажите путь к файлу-шаблону Excel');
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
          #3'№'                ('№ п/п')                         :  [3], NoProtect;
    OborCfgCol.Name
          #3'Данные в колонке' ('Данные в колонке')              : [20], Protect;
    OborCfgCol.NameGroup
          #3'Заголовок 1'      ('Заголовок колонки. 1 строка')   : [15], NoProtect;
    OborCfgCol.SortName
          #3'Заголовок 2'      ('Заголовок колонки. 2 строка')   : [13], NoProtect;
    OborCfgCol.Format
          #3'Формат'           ('Формат колонки для Excel')      : [10], NoProtect;
    OborCfgCol.Attr[2]
          #3'Ширина'           ('Ширина колонки для Excel')      :  [6], NoProtect;
    OborCfgCol.Attr[3]
          #3'Итог'             ('Итоги по колонке')              :  [5], [List 0 'Нет', 1 'Да'];
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
          #3'Доступные колонки' ('Наименования доступных колонок') : [20], Protect;
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
      If Message('Такая колонка уже есть. Все равно добавить?',YesNo)=cmNo
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
    If Message('Вы уверены, что хотите удалить колонку?',YesNo)=cmYes
    {
      delete current OborCfgCol;
      if getfirst OborCfgCol=tsOk
      { }
      RescanPanel(#OborCfgCol);
    }
  cmDefault:
  {
    Message('Проверка значений!');
  }
end; //HandleEvent window winCfgEdit
end; //winCfgEdit
!-------------------------------------------------------------------------------
Window winCfgSelect 'Выбор шаблона отчета' Cyan, DoAccept;
  Show at (5,2,,23)
Panel panCfgSelect
  Table OborCfg;
Browse scrCfgSelect
  Show at (,,80,9)
  Fields
    OborCfg.nRep
          #3'№'                    ('№ шаблона п/п')        :  [5], Protect;
    OborCfg.RepName
          #3'Наименование шаблона' ('Наименование шаблона') : [30], Protect;
    GetTypeReport(OborCfg.wFilter[0])
          #3'Тип отчета'           ('Тип отчета')           : [15], Protect;
    GetTypeSaldo(OborCfg.wFilter[1])
          #3'Сальдо'               ('Сальдо')               : [15], Protect;
    OborCfg.sRep[1]
          #3'Доступ'               ('Доступ к изменениям')  : [15], Protect;
    If(OborCfg.wFilter[2]=0,'','V')
          #3'Гр'                   ('Выводить код и наименование уровня группировки в итогах')
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

  Группировка отчета:
  1 .@@@@@@@@@@@@@@@@@@@@
  2 .@@@@@@@@@@@@@@@@@@@@
  3 .@@@@@@@@@@@@@@@@@@@@
  4 .@@@@@@@@@@@@@@@@@@@@
  5 .@@@@@@@@@@@@@@@@@@@@
   <. Настроить шаблон .>
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
    OborCfg.RepName:='Название шаблона';
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
      Message('Вы не имеете прав на удаление этого шаблона!',Error);
      Abort;
    }
    else
      If Message('Уверены, что хотите удалить шаблон "'+Trim(OborCfg.RepName)+'" ?',Warning+YesNo)=cmYes
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
          #3'№'                ('№ п/п')                         :  [5], Protect;
    OborCfgCol.Name
          #3'Данные в колонке' ('Данные в колонке')              : [35], Protect;
    OborCfgCol.NameGroup
          #3'Заголовок 1'      ('Заголовок колонки. 1 строка')   : [22], Protect;
    OborCfgCol.SortName
          #3'Заголовок 2'      ('Заголовок колонки. 2 строка')   : [22], Protect;
    OborCfgCol.Format
          #3'Формат'           ('Формат колонки для Excel')      : [15], Protect;
    OborCfgCol.Attr[2]
          #3'Ширина'           ('Ширина колонки для Excel')      :  [8], Protect;
    If(OborCfgCol.Attr[3]=0,'','V')
          #3'Итог'             ('Итог по колонке')               :  [5], Protect;
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
      Message('Вы не имеете прав на редактирование этого шаблона!',Error);
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
