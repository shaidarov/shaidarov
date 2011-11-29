//------------------------------------------------------------------------------
//                                                      (c) корпорация Галактика
// Галактика 5.84 - ФРО и Налоговый учет
// Обработчик панели документа
//------------------------------------------------------------------------------

//------------------------------------------------------------------------------
// Установка защиты на документ
Procedure SetProtectDoc(TecTbl : integer);
{
  ProtectRecord(TecTbl, False);
  SetCurrentProtected(TecTbl, NalRegDc.DesGr, NalRegDc.Descr); // По дескриптору
}

//------------------------------------------------------------------------------
Function GetTiDkFormat : longint;
{
  GetTiDkFormat := 0;

  case (pTiDk) of

    cgDoc_1050:
      GetTiDkFormat := scAmortUbyt;

    cgDoc_1051:
      GetTiDkFormat := scUstDoUbyt;

    cgDoc_1052:
      GetTiDkFormat := scUstPoUbyt;

    cgDoc_1053:
      GetTiDkFormat := scProshUbyt;

    cgDoc_1054:
      GetTiDkFormat := scStrahRash;

    cgDoc_1055:
      GetTiDkFormat := scSmnDlgRez;

    cgDoc_1056:
      GetTiDkFormat := scProchOper;

    cgDoc_1058:
      GetTiDkFormat := scRashFutur;

  end;
}

//------------------------------------------------------------------------------
Function GetNameField : string;
{
  GetNameField := '';

  case (pTiDk) of

    cgDoc_1050:
      GetNameField := 'i_scAmortUbyt_NalRegDc.DopDat1';

    cgDoc_1051:
      GetNameField := 'i_scUstDoUbyt_NalRegDc.DopDat1';

    cgDoc_1052:
      GetNameField := 'i_scUstPoUbyt_NalRegDc.DopDat1';

    cgDoc_1053:
      GetNameField := 'i_scProshUbyt_NalRegDc.DopDat1';

    cgDoc_1054:
      GetNameField := 'i_scStrahRash_NalRegDc.DopDat1';

    cgDoc_1055:
      GetNameField := 'i_scSmnDlgRez_NalRegDc.DopDat1';

    cgDoc_1056:
      GetNameField := 'i_scProchOper_NalRegDc.DopDat1';

    cgDoc_1058:
      GetNameField := 'i_scRashFutur_NalRegDc.DatEnd';

  end;
}

//------------------------------------------------------------------------------
Procedure SetDateOfTip(dDate : date);
{
  if (pTiDk = cgDoc_1058)
    set NalRegDc.DatEnd  := dDate; // Дата окончания расчетного периода во ФРО
  else
    set NalRegDc.DopDat1 := dDate; // Дата окончания расчетного периода в Налоговом учете
}

//------------------------------------------------------------------------------
Procedure InitRaspMode;
{
  case (NalRegDc.RasprMode) of

    nrRasprByPerc:
    {
      NalRegDc.Kol      := 50;             // Процентов
      NalRegDc.RasprVal := 45;             // Дней
    }

    nrRasprByMonth, nrRasprByMnDt:
    {
      NalRegDc.Kol      := nrRasprDefSrok; // 12 Месяцев
      NalRegDc.RasprVal := 0;              // С текущего месяца (RaspCur)
    }

    nrRasprByKvart, nrRasprByKvDt:
    {
      NalRegDc.Kol      := 4;              // Квартала
      NalRegDc.RasprVal := 0;              // С текущего квартала (RaspCur)
    }

    nrRasprByYear:
    {
      NalRegDc.Kol      := 3;              // Лет
      NalRegDc.RasprVal := 0;              // С текущего года (RaspCur)
    }

    nrRasprByDay:
    {
      SetDateOfTip(0);                     // Дата окончания расчетного периода
      NalRegDc.Kol       := 0;             // Дней
      NalRegDc.RasprVal  := 0;             // С текущего месяца (RaspCur)
    }

  end;

  NalRegDc.DopWrd2 := 0;
}

//------------------------------------------------------------------------------
Procedure CheckSelectable;
{
  if (NalRegDc.Kol >= 99.999)
  {
    ClearFieldState(#NalRegDc.RasprVal, sfVisible);
    NalRegDc.RasprVal := 0;
  }
  else
    SetFieldState(#NalRegDc.RasprVal, sfVisible);
}

//------------------------------------------------------------------------------
Procedure CheckViewRasprByDay;
{
  if (pTiDk = cgDoc_1058)
  {
    HideLabel4Field(#NalRegDc.DatEnd);
    ClearFieldState(#NalRegDc.DatEnd, sfVisible);
  }
  else
  {
    HideLabel4Field(#NalRegDc.DopDat1);
    ClearFieldState(#NalRegDc.DopDat1, sfVisible);
  }
}

//------------------------------------------------------------------------------
Procedure ResetScr;
{
  var IsState : boolean;

  SetFieldState(#NalRegDc.DopWrd2, sfVisible);

  case (NalRegDc.RasprMode) of

    nrRasprByPerc:
    {
      CheckViewRasprByDay;
      ClearFieldState(#RaspCur, sfVisible);
      SetFieldState(#NalRegDc.RasprVal, sfVisible);
      SetInternalHelpLine(GetTiDkFormat, #NalRegDc.Kol, 'Какой процент принятой суммы распределить на дату формирования регистра');
      CheckSelectable;
    }

    nrRasprByMnDt, nrRasprByKvDt:
    {
      CheckViewRasprByDay;
      ClearFieldState(#RaspCur, sfVisible);
      ClearFieldState(#NalRegDc.RasprVal, sfVisible);
      SetInternalHelpLine(GetTiDkFormat, #NalRegDc.Kol, GetTiDkKolName(pTiDk));
    }

    nrRasprByDay:
    {
      RaspCur := NalRegDc.RasprVal;

      if (CurWindow = NalRegWin)
      {
        cfsGetProp(GetNameField, 'Visible', IsState);

        if (pTiDk = cgDoc_1058)
        {
          if (not IsState)
            SetFieldState(#NalRegDc.DatEnd, sfVisible);

          ShowLabel4Field(#NalRegDc.DatEnd);
        }
        else
        {
          if (not IsState)
            SetFieldState(#NalRegDc.DopDat1, sfVisible);

          ShowLabel4Field(#NalRegDc.DopDat1);
        }
      }

      ClearFieldState(#NalRegDc.RasprVal, sfVisible);
      ClearFieldState(#RaspCur, sfVisible);
      ClearFieldState(#NalRegDc.DopWrd2, sfVisible);
      SetInternalHelpLine(GetTiDkFormat, #NalRegDc.Kol, GetTiDkKolName(pTiDk));
    }

  else
  {
    RaspCur := NalRegDc.RasprVal;

    CheckViewRasprByDay;
    ClearFieldState(#NalRegDc.RasprVal, sfVisible);
    SetFieldState(#RaspCur, sfVisible);
    SetInternalHelpLine(GetTiDkFormat, #NalRegDc.Kol, GetTiDkKolName(pTiDk));
  }

  end;
}

//------------------------------------------------------------------------------
Function CheckDatDoc : boolean;
{
  CheckDatDoc := False;

  if (longint(NalRegDc.DatDoc) = 0)
  {
    Message('Не указана дата формирования документа.', Warning);
    Abort;
    Exit;
  }

  CheckDatDoc := True;
}

//------------------------------------------------------------------------------
Function CheckRasprVal : boolean;
{
  CheckRasprVal := False;

  case (NalRegDc.RasprMode) of

    nrRasprByPerc:
    {
      if ((NalRegDc.Kol < 0) or (NalRegDc.Kol > 100))
      {
        Message('Указано некорректное значение процента.', Warning);
        Abort;
        Exit;
      }
    }

  else
  {
    set NalRegDc.Kol := integer(NalRegDc.Kol);

    if (NalRegDc.Kol = 0)
    {
      Message('Не задано количество периодов.', Warning);
      Abort;
      Exit;
    }
  }

  end;

  CheckRasprVal := True;
}

//------------------------------------------------------------------------------
Function CntTimeKol(DatEnd : date) : word;
{
  CntTimeKol := 0;

  var difDate : date;

  difDate := Sub_Date(DatEnd, NalRegDc.DopDat2);

  case (NalRegDc.RasprMode) of

    nrRasprByMonth, nrRasprByMnDt:
      CntTimeKol := Month(difDate);

    nrRasprByKvart, nrRasprByKvDt:
      CntTimeKol := Month(difDate) div 3;

    nrRasprByYear:
      CntTimeKol := Year(difDate);

    nrRasprByPerc:
      CntTimeKol := Day(difDate);

    nrRasprByDay:
      CntTimeKol := To_Days(difDate) + 1;

  end;
}

//------------------------------------------------------------------------------
Function CntDatEnd(pKol : double) : date;
{
  CntDatEnd := NalRegDc.DopDat2;

  case (NalRegDc.RasprMode) of

    nrRasprByMonth:
      CntDatEnd := Add_Months(NalRegDc.DopDat2, integer(pKol) + NalRegDc.RasprVal);

    nrRasprByMnDt:
      CntDatEnd := Add_Months(NalRegDc.DopDat2, integer(pKol));

    nrRasprByKvart:
      CntDatEnd := Add_Months(NalRegDc.DopDat2, 3 * (integer(pKol) + NalRegDc.RasprVal));

    nrRasprByKvDt:
      CntDatEnd := Add_Months(NalRegDc.DopDat2, 3 *  integer(pKol));

    nrRasprByYear:
      CntDatEnd := Add_Months(NalRegDc.DopDat2, 12* (integer(pKol) + NalRegDc.RasprVal));

    nrRasprByPerc:
      CntDatEnd := Add_Day(NalRegDc.DopDat2, NalRegDc.RasprVal);

    nrRasprByDay:
      CntDatEnd := Add_Day(NalRegDc.DopDat2, integer(pKol));

  end;
}

//------------------------------------------------------------------------------
Procedure CheckFieldDate(dDatEndRaspr : date; bDateBeginEnd : boolean);
{
  if (NalRegDc.RasprMode = nrRasprByDay)
  {
    if (longint(dDatEndRaspr) <> 0)
    {
      if (NalRegDc.DopDat2 <= dDatEndRaspr)
        set NalRegDc.Kol := CntTimeKol(dDatEndRaspr);
      else
      {
        if (bDateBeginEnd)
        {
          Message('Дата окончания расчетного периода меньше даты начала.', Warning);
          Abort;
          Exit;
        }
        else
        {
          Message('Дата начала расчетного периода больше даты окончания.', Warning);
          set NalRegDc.Kol := 0;
          Exit;
        }
      }
    }
    else
    {
      if (bDateBeginEnd)
        set NalRegDc.Kol := 0;
    }
  }
}

//------------------------------------------------------------------------------
Procedure SaveNalRegDc;
{
  if (UpdateTable and (NalRegDc.NRec > 0))
  {
    SavedRecord := NalRegDc.Buffer;

    Message('Запомнен документ с номером'#13 +
            '"' + NalRegDc.NoDoc + '"', OkButton + Information);
  }
  else
    Message('Не удалось запомнить документ.'#13 +
            'Наверное он еще не заполнен.', OkButton + Warning);
}

//------------------------------------------------------------------------------
Procedure RestoreNalRegDc;
{
  var NewNoDoc : string;

  if (CurTable <> #NalRegDc)
  {
    Message('Документ копируется только из верхней панели.', Information);
    SelectPanel(#NalRegDc);
    Exit;
  }

  if (isModified)
  {
    if (not UpdateTable)
    {
      Message('Перед копированием нового документа необходимо заполнить текущий.', Information);
      Exit;
    }
  }

  if (SavedRecord.NRec = 0)
  {
    Message('Нет сохраненных документов.'#13 +
            'Запомните сначала документ'#13 +
            'при помощи Ctrl-F2.', Information);
    Exit;
  }

  if (ProcessCommand(cmInsert))
  {

    if (RecordExists NalRegDc where ((SavedRecord.NRec == NalRegDc.NRec)) <> tsOk)
    {
      Message('Кто-то уже успел удалить'#13 +
              'запомненный Вами документ,'#13 +
              'поэтому создаем новый...', OkButton + Warning);
      Exit;
    }

    NewNoDoc         := NalRegDc.NoDoc;
    NalRegDc.Buffer  := type$NalRegDc(SavedRecord);
    NalRegDc.NRec    := 0;
    NalRegDc.TiDk    := pTiDk;
    NalRegDc.DesGr   := sGetTune('User.DesGr');
    NalRegDc.DesCr   := sGetTune('User.DesCr');
    NalRegDc.NoDoc   := NewNoDoc;
    NalRegDc.DatDoc  := Cur_Date;

    SetModified(True);

    if (UpdateTable)
    {
      // Копирование Внешних атрибутов
      if (GetFirst AttrVal = tsOk)
        piExtAttr.CopyAllAttr(coNalRegDc, SavedRecord.NRec, NalRegDc.NRec);

      // Копирование Внешней классификации
      if (GetFirst ExClassVal = tsOk)
        piExtClass.CopyAllClassVal(coNalRegDc, SavedRecord.NRec, NalRegDc.NRec);
    }

    ResetScr;
    ReScanPanel(#NalRegDc);
    SelectField(#NalRegDc.NoDoc);
  }
}

//------------------------------------------------------------------------------
Panel pnlNalRegDc;
  Table NalRegDc;
HandleEvent
cmSetDefault:
{
  var tNalReg : TNalRegDoc;

  ClearAdvRecord(tNalReg);

  tNalReg.TiDk := pTiDk;

  // Позиционирование
  iNalogReg.PosByNRec(tNalReg.NRec);
  iNalogReg.SetDeflts(tNalReg);

  ClearBuffer(#NalRegDc);

  NalRegDc.Buffer   := type$NalRegDc(tNalReg);

  if (GetFirst KatSopr where ((pSopr == KatSopr.nRec)) = tsOK) {
    NalRegDc.cSoprDoc := pSopr;                                         // igor

    if ( KatSopr.VhodNal = 1 ) {                                        // Налоги входят
    NalRegDc.SumPr    := KatSopr.Summa - KatSopr.sNalogs;               // igor
    } else {
    NalRegDc.SumPr    := KatSopr.Summa;
      }

    }

  RaspCur           := NalRegDc.RasprVal;

  ResetScr;
  ClearBuffer(#SoprHoz); // Перерисовка ТХО

  // Чтобы не циклилось при удалении последней записи.
  // После инициализации чтобы не пропустить в БД неинициализированную запись.
  if (winAborted)
    Exit;

  winAborted := True;

  PutCommand(cmEdit);
}

cmAbortInsert:
  DelLastNumD(pTiDk, NalRegDc.NoDoc);

cmCheckField:
{
  case (CurField) of

    #NalRegDc.RasprMode:
    {
      InitRaspMode;  // Сброс к значениям по умолчанию
      ResetScr;      // Переключение форматов

      if (NalRegDc.RasprMode = nrRasprByDay)
      {
        if (pTiDk = cgDoc_1058)
          SelectField(#NalRegDc.DatEnd);
        else
          SelectField(#NalRegDc.DopDat1);
      }

      ReDrawPanel(#NalRegDc);
    }

    #RaspCur:
      set NalRegDc.RasprVal := RaspCur;

    #NalRegDc.DatDoc: // Зависимое поле в расходах будущих периодов
    {
      if (not CheckDatDoc)
        Exit;
    }

    #NalRegDc.DopDat2:
    {
      if (longint(NalRegDc.DopDat2) = 0)
        set NalRegDc.DopDat2 := NalRegDc.DatDoc;

      if (pTiDk = cgDoc_1058)
        CheckFieldDate(NalRegDc.DatEnd, False);
      else
        CheckFieldDate(NalRegDc.DopDat1, False);
    }

    #NalRegDc.DatEnd: // Зависимые поля в уступках требования и в расходах будущих периодов
    {
      if (pTiDk = cgDoc_1058)
        CheckFieldDate(NalRegDc.DatEnd, True);
    }

    #NalRegDc.DopDat1:
    {
      if (pTiDk <> cgDoc_1058)
        CheckFieldDate(NalRegDc.DopDat1, True);
    }

    #NalRegDc.Kol:
    {
      if (not CheckRasprVal)
        Exit;

      if (NalRegDc.RasprMode = nrRasprByPerc)
        CheckSelectable;

      if (NalRegDc.RasprMode = nrRasprByDay)
      {
        if (NalRegDc.Kol < 0)
        {
          set NalRegDc.Kol := 0;
          SetDateOfTip(0);
        }
        else
          SetDateOfTip(CntDatEnd(NalRegDc.Kol - 1));
      }
    }

  end;
}

// Вызывается и перед Insert и перед Update
// Если объединить проверку здесь может быть путаница
// неверного позиционирования и вставки новой записи
cmCheckRecord: {};

cmInsertRecord:
{
  // Позиционирование
  iNalogReg.PosByNRec(NalRegDc.NRec);

  if (not iNalogReg.CanInsert(TNalRegDoc(NalRegDc.Buffer)))
  {
    Abort;
    Exit;
  }

  var tNRec : comp;

  tNRec := iNalogReg.InsertRec(TNalRegDoc(NalRegDc.Buffer));

  if (GetFirst NalRegDc where ((tNRec == NalRegDc.NRec)) = tsOk) {};

  ReReadRecord(#NalRegDc);

  if (CurWindow = NalRegWin)
    iEditOborot.ShowContent;
}

cmUpdateRecord:
{
  // Позиционирование
  iNalogReg.PosByNRec(NalRegDc.NRec);

  // Вынес из блока _try чтобы не попасть в _finally, не перечитать буфер
  // и не потерять введенные пользователем данные
  if (not iNalogReg.CanUpdate(TNalRegDoc(NalRegDc.Buffer)))
  {
    Abort;
    Exit;
  }

  iNalogReg.UpdateRec(TNalRegDoc(NalRegDc.Buffer));
  ReReadRecord(#NalRegDc);

  if (CurWindow = NalRegWin)
    iEditOborot.ShowContent;
}

cmDeleteRecord:
{
  if (Message('Вы уверены в том что хотите'#13 +
              'удалить данный документ?', Confirmation + YesNo) <> cmYes)
    Exit;

  // Позиционирование
  iNalogReg.PosByNRec(NalRegDc.NRec);

  if (not iNalogReg.CanDelete)
  {
    Abort;
    Exit;
  }

  iNalogReg.DeleteRec;
  ReReadRecord(#NalRegDc);

  if (CurWindow = NalRegWin)
    iEditOborot.ShowContent;
}

cmPick:
{
  case (CurField) of

    #NalRegDc.Descr:
    {
      if (PickNewDescriptor(NalRegDc.DesGr, NalRegDc.Descr))
      {
        set NalRegDc.DesGr := NalRegDc.DesGr;
        set NalRegDc.Descr := NalRegDc.Descr;
      }
    }

    #NalRegDc.DesGr:
    {
      if (PickNewGrDescr(NalRegDc.DesGr, NalRegDc.Descr))
      {
        set NalRegDc.DesGr := NalRegDc.DesGr;
        set NalRegDc.Descr := NalRegDc.Descr;
      }
    }

    #InFutureStr:
      set NalRegDc.RsSyn := if (NalRegDc.RsSyn = 0, 1, 0);

    #KatKlass.Name:
      RunInterface('KatKlass', cgDoc_1050, word(0), NalRegDc.cVid, word(0), True, comp(0));

    #KatKlProch.Name:
    {
      case (pTiDk) of

        cgDoc_1058:
          RunInterface('KatKlass', cgDoc_1058, word(0), NalRegDc.cSoprDoc, word(0), True, comp(0));

      else
        RunInterface('KatKlass', cgDoc_1056, word(0), NalRegDc.cSoprDoc, word(0), True, comp(0));

      end;
    }

    #OSAlg.Name:
      RunInterface('GetAlgAmort', NalRegDc.cAlgoritm, GetRegTypeName(pTiDk, word(1)), pTiDk, word(0), 0);

    #KatOS.InNum, #KatOS.NameOS:
    {
      if (NalRegDc.cSoprDoc = 0)
        Message('Создать налоговый регистр, связанный'#13 +
                'с операцией выбытия ОС, можно только'#13 +
                'из интерфейса операции ОС.', Warning);
      else
        RunInterface('MoveOs', 4, SpMoveOs.TipDoc, SpMoveOs.cKatOs, SpMoveOs.cMoveOs, True);
    }

    #BaseDoc.NoDoc, #BaseDoc.dDoc:
    {
      if (NalRegDc.cSoprDoc = 0)
      {
        Message('Создать налоговый регистр, связанный'#13 +
                'с договором цессии, можно только'#13 +
                'из интерфейса цессии.', Warning);
        Abort;
      }
      else // GetDBase(); фильтр по договорам продажи долга 90
      {
        if (GetFirst SpStep where ((NalRegDc.cSoprDoc == SpStep.Nrec)) = tsOk)
          if (GetFirst StepDoc where ((SpStep.cStepDoc == StepDoc.Nrec)) = tsOk)
            if (GetFirst BaseDoc where ((StepDoc.cBaseDoc == BaseDoc.Nrec)) = tsOk)
              RunInterface('Cessia', BaseDoc.VidDoc, BaseDoc.NRec);
      }
    }

    #NalRegTt.Name:
    {
      var cTmpl : comp;

      cTmpl := NalRegDc.cRegTmpl;

      if (RunInterface('NalogRegShabl', pTiDk, NalRegDc.cRegTmpl) = cmDefault)
      {
        if (cTmpl <> 0)
        {
          if (Message('Заменить установленные в регистре параметры'#13 +
                      'их значениями из выбранного шаблона?', Confirmation + YesNo) <> cmYes)
          {
            ReScanPanel(#NalRegDc);
            Exit;
          }
        }

        ReScanPanel(#NalRegDc);

        NalRegDc.RasprMode  := NalRegTt.RasprMode;
        NalRegDc.RasprVal   := NalRegTt.RasprVal;
        NalRegDc.Kol        := NalRegTt.RasprPerc;
        RaspCur             := NalRegDc.RasprVal;
        set NalRegDc.DatEnd := CntDatEnd(NalRegDc.Kol);
        NalRegDc.cAlgoritm  := NalRegTt.cAlgoritm;
        NalRegDc.cVid       := NalRegTt.cVid;

        ResetScr;
      }
    }

  end;

  ReScanPanel(#NalRegDc); // Пир 102.29075 - не обновляется
  ReDrawPanel(#NalRegDc);
}

cmDelOnProtect:
{
  if (IsProtected(#NalRegDc))
  {
    Message(StrMesProtected(NalRegDc.DesGr, NalRegDc.Descr), CancelButton);
    Exit;
  }

  case (CurField) of

    #KatOS.InNum, #KatOS.NameOS, #BaseDoc.NoDoc, #BaseDoc.dDoc, #Refin.Proc:
      Stop;

  else
  {
    case (CurField) of

      #NalRegTt.Name:
      {
        if (NalRegDc.cRegTmpl = 0)
          Exit;
      }

      #OSAlg.Name:
      {
        if (NalRegDc.cAlgoritm = 0)
          Exit;
      }

      #KatKlass.Name:
      {
        if (NalRegDc.cVid = 0)
          Exit;
      }

      #KatKlProch.Name:
      {
        if (NalRegDc.cSoprDoc = 0)
          Exit;
      }

    else
      Exit;

    end;

    if (Message('Вы уверены в том что хотите'#13 +
                'отменить данную связь?', Confirmation + YesNo) <> cmYes)
      Stop;
  }

  end;
}

cmPositionChanged:
{
  ResetScr;
  winAborted := False;
  SetProtectDoc(#NalRegDc);
}

cmProtectedInput:
{
  if (IsProtected(#NalRegDc))
  {
    Message(StrMesProtected(NalRegDc.DesGr, NalRegDc.Descr), CancelButton);
    Stop;
  }
}
end; // HandleEvent Panel pnlNalRegDc
end; // Panel pnlNalRegDc

//------------------------------------------------------------------------------
Panel pnlNalRegSp;
  Table NalRegSp;
HandleEvent
cmSetDefault:
{
  if (IsProtected(#NalRegDc))
  {
    if (not IsProtected(#NalRegSp))
      ProtectRecord(#NalRegSp, True);

    Message('Документ "' + GetRegTypeName(pTiDk, word(0)) + '" защищен от ввода.'#13 +
            'Редактировать строки спецификации документа запрещено.', CancelButton);
    Abort;
    Exit;
  }

  ClearBuffer(#NalRegSp);

  NalRegSp.cNalRegDc := NalRegDc.NRec;
  NalRegSp.TiDk      := NalRegDc.TiDk;
  NalRegSp.RsSyn     := NalRegDc.RsSyn;
  NalRegSp.DatOb     := Cur_Date;
  NalRegSp.SumPr     := 0;

  ClearBuffer(#SoprHoz);
}

cmPick:
{
  case (CurField) of

    #HozOpName:
    {
      if (not UpdateTable)
      {
        ReReadRecord(#NalRegSp);
        Exit;
      }

      if (NalRegSp.NRec = 0)
      {
        ReReadRecord(#NalRegSp);
        Exit;
      }

      if (not isValid(#SoprHoz))
      {
        Message('Нет связанной записи хозоперации.', Warning);
        Exit;
      }

      if (GetMarkerCount(Marker) = 0)
        rTXOPick.PickTXO(word(1), cPlansSch, SoprHoz.BufferP);
      else
      {
        var cNRec : comp;
        var i     : integer;

        PushPos(#NalRegSp);

        for (i := 0; i < GetMarkerCount(Marker); i := i + 1)
        {
          if (GetMarker(Marker, i, cNRec))
            if (GetFirst NalRegSp where ((cNRec == NalRegSp.NRec)) = tsOk)
              UpDateMarker(Marker, i, SoprHoz.NRec)
        }

        PopPos(#NalRegSp);

        rTXOPick.PickTXOMulti(word(1), Marker, cPlansSch);
        ClearMarker(Marker);
      }

      ReReadRecord(#NalRegSp);

      if (CurWindow = NalRegWin)
        iEditOborot.ShowContent;
    }

  end;
}

cmInsertRecord:
{
  var tNRec : comp;

  // Позиционирование
  iNalogReg.PosByNRec(NalRegDc.NRec);

  tNRec := iNalogReg.InsertSpecRow(NalRegSp.DatOb, NalRegSp.SumPr);

  GetFirst NalRegSp where ((tNRec == NalRegSp.NRec));

  ReReadRecord(#NalRegSp);
  ReReadRecord(#NalRegDc);

  if (CurWindow = NalRegWin)
    iEditOborot.ShowContent;
}

cmUpdateRecord:
{
  // Позиционирование
  iNalogReg.PosByNRec(NalRegDc.NRec);
  iNalogReg.UpdateSpecRow(NalRegSp.DatOb, NalRegSp.SumPr, NalRegSp.NRec);

  ReReadRecord(#NalRegSp);

  if (CurWindow = NalRegWin)
    iEditOborot.ShowContent;
}

cmDeleteRecord:
{
  var ExFlag, IsPrRec : boolean;

  ExFlag  := False;
  IsPrRec := False;

  // Проверяет дату записи на попадание в закрытый период и выдает свое сообщение
  if (iNalogReg.IsChekRecCloseBuhPeriod(NalRegSp.NRec, Marker, IsPrRec))
    Exit;

  if (not IsPrRec)
  {
    if (GetMarkerCount(Marker) = 0)
      ExFlag := (Message('Вы уверены в том что хотите удалить'#13 +
                         'текущую строку спецификации документа ?', Confirmation + YesNo) <> cmYes)
    else
      ExFlag := (Message('Вы уверены в том что хотите удалить все'#13 +
                         'ПОМЕЧЕННЫЕ строки спецификации документа ?', Confirmation + YesNo) <> cmYes)
  }

  if (ExFlag)
  {
    Abort;
    Exit;
  }

  // Позиционирование
  iNalogReg.PosByNRec(NalRegDc.NRec);

  if (GetMarkerCount(Marker) = 0)
    iNalogReg.DeleteSpecRow(NalRegSp.NRec);
  else
  {
    var cNRec : comp;
    var i     : integer;

    for (i := 0; i < GetMarkerCount(Marker); i := i + 1)
    {
      if (GetMarker(Marker, i, cNRec))
        iNalogReg.DeleteSpecRow(cNRec);
    }
  }

  ClearMarker(Marker);
  ReReadRecord(#NalRegDc);
}

cmDelOnProtect:
{
  if (IsProtected(#NalRegSp))
  {
    Message(StrMesProtected(NalRegDc.DesGr, NalRegDc.Descr), CancelButton);
    Exit;
  }

  Stop;

  if (CurField <> #HozOpName)
    Exit;

  if (GetMarkerCount(Marker) = 0)
  {
    if (HozOpName = '')
      Exit;

    if (Message('Вы уверены в том, что хотите разорвать'#13 +
                'связь данной операции с ТХО?', Confirmation + YesNo) <> cmYes)
      Exit;

    rTXOPick.DelTXO(word(1), cPlansSch, SoprHoz.BufferP);
  }
  else
  {
    if (Message('Вы уверены в том, что хотите разорвать связи всех'#13 +
                'ПОМЕЧЕННЫХ строк спецификации с ТХО?', Confirmation + YesNo) <> cmYes)
      Exit;

    var cNRec : comp;
    var i     : integer;

    PushPos(#NalRegSp);

    for (i := 0; i < GetMarkerCount(Marker); i := i + 1)
    {
      if (GetMarker(Marker, i, cNRec))
        if (GetFirst NalRegSp where ((cNRec == NalRegSp.NRec)) = tsOk)
          if (HozOpName <> '')
            rTXOPick.DelTXO(word(1), cPlansSch, SoprHoz.BufferP);
    }

    PopPos(#NalRegSp);
    ClearMarker(Marker);
  }

  ReReadRecord(#NalRegSp);

  if (CurWindow = NalRegWin)
    iEditOborot.ShowContent;
}

cmPositionChanged:
{
  SetProtectDoc(#NalRegSp);
  if (CurWindow = NalRegWin)
    iEditOborot.ShowContent;
}

cmProtectedInput:
{
  if (IsProtected(#NalRegSp))
  {
    Message(StrMesProtected(NalRegDc.DesGr, NalRegDc.Descr), CancelButton);
    Stop;
  }
}
end; // HandleEvent Panel pnlNalRegSp
end; // Panel pnlNalRegSp
