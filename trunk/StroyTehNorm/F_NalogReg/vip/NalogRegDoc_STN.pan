//------------------------------------------------------------------------------
//                                                      (c) ��௮��� �����⨪�
// �����⨪� 5.84 - ��� � �������� ���
// ��ࠡ��稪 ������ ���㬥��
//------------------------------------------------------------------------------

//------------------------------------------------------------------------------
// ��⠭���� ����� �� ���㬥��
Procedure SetProtectDoc(TecTbl : integer);
{
  ProtectRecord(TecTbl, False);
  SetCurrentProtected(TecTbl, NalRegDc.DesGr, NalRegDc.Descr); // �� ���ਯ���
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
    set NalRegDc.DatEnd  := dDate; // ��� ����砭�� ���⭮�� ��ਮ�� �� ���
  else
    set NalRegDc.DopDat1 := dDate; // ��� ����砭�� ���⭮�� ��ਮ�� � ��������� ���
}

//------------------------------------------------------------------------------
Procedure InitRaspMode;
{
  case (NalRegDc.RasprMode) of

    nrRasprByPerc:
    {
      NalRegDc.Kol      := 50;             // ��業⮢
      NalRegDc.RasprVal := 45;             // ����
    }

    nrRasprByMonth, nrRasprByMnDt:
    {
      NalRegDc.Kol      := nrRasprDefSrok; // 12 ����楢
      NalRegDc.RasprVal := 0;              // � ⥪�饣� ����� (RaspCur)
    }

    nrRasprByKvart, nrRasprByKvDt:
    {
      NalRegDc.Kol      := 4;              // ����⠫�
      NalRegDc.RasprVal := 0;              // � ⥪�饣� ����⠫� (RaspCur)
    }

    nrRasprByYear:
    {
      NalRegDc.Kol      := 3;              // ���
      NalRegDc.RasprVal := 0;              // � ⥪�饣� ���� (RaspCur)
    }

    nrRasprByDay:
    {
      SetDateOfTip(0);                     // ��� ����砭�� ���⭮�� ��ਮ��
      NalRegDc.Kol       := 0;             // ����
      NalRegDc.RasprVal  := 0;             // � ⥪�饣� ����� (RaspCur)
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
      SetInternalHelpLine(GetTiDkFormat, #NalRegDc.Kol, '����� ��業� �ਭ�⮩ �㬬� ��।����� �� ���� �ନ஢���� ॣ����');
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
    Message('�� 㪠���� ��� �ନ஢���� ���㬥��.', Warning);
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
        Message('������� �����४⭮� ���祭�� ��業�.', Warning);
        Abort;
        Exit;
      }
    }

  else
  {
    set NalRegDc.Kol := integer(NalRegDc.Kol);

    if (NalRegDc.Kol = 0)
    {
      Message('�� ������ ������⢮ ��ਮ���.', Warning);
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
          Message('��� ����砭�� ���⭮�� ��ਮ�� ����� ���� ��砫�.', Warning);
          Abort;
          Exit;
        }
        else
        {
          Message('��� ��砫� ���⭮�� ��ਮ�� ����� ���� ����砭��.', Warning);
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

    Message('�������� ���㬥�� � ����஬'#13 +
            '"' + NalRegDc.NoDoc + '"', OkButton + Information);
  }
  else
    Message('�� 㤠���� ��������� ���㬥��.'#13 +
            '����୮� �� �� �� ��������.', OkButton + Warning);
}

//------------------------------------------------------------------------------
Procedure RestoreNalRegDc;
{
  var NewNoDoc : string;

  if (CurTable <> #NalRegDc)
  {
    Message('���㬥�� ��������� ⮫쪮 �� ���孥� ������.', Information);
    SelectPanel(#NalRegDc);
    Exit;
  }

  if (isModified)
  {
    if (not UpdateTable)
    {
      Message('��। ����஢����� ������ ���㬥�� ����室��� ��������� ⥪�騩.', Information);
      Exit;
    }
  }

  if (SavedRecord.NRec = 0)
  {
    Message('��� ��࠭����� ���㬥�⮢.'#13 +
            '�������� ᭠砫� ���㬥��'#13 +
            '�� ����� Ctrl-F2.', Information);
    Exit;
  }

  if (ProcessCommand(cmInsert))
  {

    if (RecordExists NalRegDc where ((SavedRecord.NRec == NalRegDc.NRec)) <> tsOk)
    {
      Message('��-� 㦥 �ᯥ� 㤠����'#13 +
              '���������� ���� ���㬥��,'#13 +
              '���⮬� ᮧ���� ����...', OkButton + Warning);
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
      // ����஢���� ���譨� ��ਡ�⮢
      if (GetFirst AttrVal = tsOk)
        piExtAttr.CopyAllAttr(coNalRegDc, SavedRecord.NRec, NalRegDc.NRec);

      // ����஢���� ���譥� �����䨪�樨
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

  // ����樮��஢����
  iNalogReg.PosByNRec(tNalReg.NRec);
  iNalogReg.SetDeflts(tNalReg);

  ClearBuffer(#NalRegDc);

  NalRegDc.Buffer   := type$NalRegDc(tNalReg);

  if (GetFirst KatSopr where ((pSopr == KatSopr.nRec)) = tsOK) {
    NalRegDc.cSoprDoc := pSopr;                                         // igor

    if ( KatSopr.VhodNal = 1 ) {                                        // ������ �室��
    NalRegDc.SumPr    := KatSopr.Summa - KatSopr.sNalogs;               // igor
    } else {
    NalRegDc.SumPr    := KatSopr.Summa;
      }

    }

  RaspCur           := NalRegDc.RasprVal;

  ResetScr;
  ClearBuffer(#SoprHoz); // ����ᮢ�� ���

  // �⮡� �� 横������ �� 㤠����� ��᫥���� �����.
  // ��᫥ ���樠����樨 �⮡� �� �ய����� � �� �����樠����஢����� ������.
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
      InitRaspMode;  // ���� � ���祭�� �� 㬮�砭��
      ResetScr;      // ��४��祭�� �ଠ⮢

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

    #NalRegDc.DatDoc: // ����ᨬ�� ���� � ��室�� ����� ��ਮ���
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

    #NalRegDc.DatEnd: // ����ᨬ� ���� � ���㯪�� �ॡ������ � � ��室�� ����� ��ਮ���
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

// ��뢠���� � ��। Insert � ��। Update
// �᫨ ��ꥤ����� �஢��� ����� ����� ���� ��⠭��
// ����୮�� ����樮��஢���� � ��⠢�� ����� �����
cmCheckRecord: {};

cmInsertRecord:
{
  // ����樮��஢����
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
  // ����樮��஢����
  iNalogReg.PosByNRec(NalRegDc.NRec);

  // �뭥� �� ����� _try �⮡� �� ������� � _finally, �� ������� ����
  // � �� ������� �������� ���짮��⥫�� �����
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
  if (Message('�� 㢥७� � ⮬ �� ���'#13 +
              '㤠���� ����� ���㬥��?', Confirmation + YesNo) <> cmYes)
    Exit;

  // ����樮��஢����
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
        Message('������� �������� ॣ����, �易���'#13 +
                '� ����樥� ����� ��, ����� ⮫쪮'#13 +
                '�� ����䥩� ����樨 ��.', Warning);
      else
        RunInterface('MoveOs', 4, SpMoveOs.TipDoc, SpMoveOs.cKatOs, SpMoveOs.cMoveOs, True);
    }

    #BaseDoc.NoDoc, #BaseDoc.dDoc:
    {
      if (NalRegDc.cSoprDoc = 0)
      {
        Message('������� �������� ॣ����, �易���'#13 +
                '� ������஬ ��ᨨ, ����� ⮫쪮'#13 +
                '�� ����䥩� ��ᨨ.', Warning);
        Abort;
      }
      else // GetDBase(); 䨫��� �� ������ࠬ �த��� ����� 90
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
          if (Message('�������� ��⠭������� � ॣ���� ��ࠬ����'#13 +
                      '�� ���祭�ﬨ �� ��࠭���� 蠡����?', Confirmation + YesNo) <> cmYes)
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

  ReScanPanel(#NalRegDc); // ��� 102.29075 - �� ����������
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

    if (Message('�� 㢥७� � ⮬ �� ���'#13 +
                '�⬥���� ������ ���?', Confirmation + YesNo) <> cmYes)
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

    Message('���㬥�� "' + GetRegTypeName(pTiDk, word(0)) + '" ���饭 �� �����.'#13 +
            '������஢��� ��ப� ᯥ�䨪�樨 ���㬥�� ����饭�.', CancelButton);
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
        Message('��� �易���� ����� 宧����樨.', Warning);
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

  // ����樮��஢����
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
  // ����樮��஢����
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

  // �஢���� ���� ����� �� ��������� � ������� ��ਮ� � �뤠�� ᢮� ᮮ�饭��
  if (iNalogReg.IsChekRecCloseBuhPeriod(NalRegSp.NRec, Marker, IsPrRec))
    Exit;

  if (not IsPrRec)
  {
    if (GetMarkerCount(Marker) = 0)
      ExFlag := (Message('�� 㢥७� � ⮬ �� ��� 㤠����'#13 +
                         '⥪���� ��ப� ᯥ�䨪�樨 ���㬥�� ?', Confirmation + YesNo) <> cmYes)
    else
      ExFlag := (Message('�� 㢥७� � ⮬ �� ��� 㤠���� ��'#13 +
                         '���������� ��ப� ᯥ�䨪�樨 ���㬥�� ?', Confirmation + YesNo) <> cmYes)
  }

  if (ExFlag)
  {
    Abort;
    Exit;
  }

  // ����樮��஢����
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

    if (Message('�� 㢥७� � ⮬, �� ��� ࠧ�ࢠ��'#13 +
                '��� ������ ����樨 � ���?', Confirmation + YesNo) <> cmYes)
      Exit;

    rTXOPick.DelTXO(word(1), cPlansSch, SoprHoz.BufferP);
  }
  else
  {
    if (Message('�� 㢥७� � ⮬, �� ��� ࠧ�ࢠ�� �裡 ���'#13 +
                '���������� ��ப ᯥ�䨪�樨 � ���?', Confirmation + YesNo) <> cmYes)
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
