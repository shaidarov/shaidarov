.LinkForm 'MOVE_MBP_Smyv' Prototype is 'MOVE_MBP'
.Group 'Возврат из эксплуатации. Россия.'
.Group 'Возврат из эксплуатации. ВСМН.'
.Group 'Внутреннее перемещение. Россия.'
.Group 'Внутреннее перемещение. ВСМН.'
.Group 'Ввод в эксплуатацию. Россия.'
.Group 'Ввод в эксплуатацию. ВСМН.'
.Group 'Передача в МЦ. Россия.'
.Group 'Передача в МЦ. ВСМН.'
.NameInList 'СТН. Ведомость на выдачу смывающих, обеззараживающих и защищающих средств'
.f "NUL"
.declare
#include xlReport.Vih
.endDeclare
.var
  sXLTFileName
, sXLSFileName
, sGroupName
               : string;
  pxlrepsetup
               : xlrepsetup
  pXL
               : XLSRepBuilder  // объект формирования Excel-отчетов
  MasGroup
               : array[1..1] of comp
  MasItogSum
               : array[1..1] of double
  MasItogKol
               : array[1..1] of double
  GroupsCountInRep
, i, wNpp
, wGroupKol
               : word
  dCheckSum
               : double
  vbExists
               : boolean
.endvar
.create view t
 as select * from
  MBPmove
, MBPin
, KatMBP
, PersCard
, Persons
, tmpDataRep

, KatMOL
, synonym Persons           PersonsMOL
, synonym Appointments AppointmentsMOL
, synonym Catalogs         CatalogsMOL
 where (( DOCNREC           == MBPmove.nRec
      and MBPmove.nRec      == MBPin.cSopr
      and MBPin.cMBP        == KatMBP.nRec
      and MBPin.cPers       == PersCard.nRec
      and PersCard.cPersons == Persons.nRec
));
.{
.begin

  wNpp             := 0;
  wGroupKol        := 0;
  GroupsCountInRep := 5;

  Delete all tmpDataRep;

  t.GetFirst MBPmove where (( DOCNREC == MBPmove.nRec )) {}

  // нахождение всех возможных групп
  t._loop MBPin where (( MBPmove.nRec == MBPin.cSopr )) {
    _loop KatMBP where (( MBPin.cMBP  == KatMBP.nRec ))
    {
      vbExists := false;

      for (i := 1;i <= wGroupKol; i++)
      {
        if (MasGroup[i] = KatMBP.cGroupMc)
          vbExists := true;
      }

      if (not vbExists)
        MasGroup[++wGroupKol] := KatMBP.cGroupMc;
    }
  }

  t._loop MBPin where (( MBPmove.nRec == MBPin.cSopr )) {

            if (t.GetFirst PersCard where (( t.MBPin.cPers == PersCard.nRec)) != tsOk) {} // Может же быть выдача и на МОЛа - не будем отсекать такие случаи

            if (t.GetFirst tmpDataRep where (( PersCard.cPersons == tmpDataRep.cPersons)) != tsOk)
            {
              t.ClearBuffer(tnTmpDataRep);
              if (t.GetFirst KatMBP where (( MBPin.cMBP ==  KatMBP.nRec )) = tsOk)
                for(i := 1;i <= GroupsCountInRep;i++)
                {
                  if (MasGroup[i] = t.KatMBP.cGroupMc)
                  {
                    tmpDataRep.dKol[i] := t.MBPin.KolDoc;
                    tmpDataRep.dSum[i] := if (wGetTune('Fin.MBP.OstStoim') = 0, t.MBPIn.Summa, t.MBPIn.Summa - (t.MBPIn.SummaIsnP + t.MBPIn.SummaIsnN));
                    break;
                  }
                }

             if (t.GetFirst PersCard where (( MBPin.cPers == PersCard.nRec)) = tsOk)
              if (t.GetFirst Persons where (( PersCard.cPersons == Persons.nRec)) = tsOk)
              {
                tmpDataRep.sPersons := t.Persons.Fio;
                tmpDataRep.cPersons := t.Persons.nRec;

                if (t.GetFirst Appointments where ((Persons.AppointCur == Appointments.nRec)) = tsOk)
                  if (t.GetFirst Catalogs where ((Appointments.Post == Catalogs.nRec)) = tsOk)
                    tmpDataRep.sCatalog := t.Catalogs.Name;
              }

              t.Insert current tmpDataRep;
            }// if (GetFirst tmpDataRep where (( TTnDoc.cDoc2 == tmpDataRep.cPersons)) != tsOk)
            else {
              if (t.GetFirst KatMBP where (( MBPin.cMBP ==  KatMBP.nRec )) = tsOk)
                for(i := 1;i <= GroupsCountInRep;i++) {
                  if (MasGroup[i] = t.KatMBP.cGroupMc)
                  {
                    tmpDataRep.dKol[i] := tmpDataRep.dKol[i] + t.MBPin.KolDoc;
                    tmpDataRep.dSum[i] := tmpDataRep.dSum[i] + if (wGetTune('Fin.MBP.OstStoim') = 0, t.MBPIn.Summa, t.MBPIn.Summa - (t.MBPIn.SummaIsnP + t.MBPIn.SummaIsnN));
                    if (update current tmpDataRep = tsOk){}
                    break;
                  }
                 }
            }
  }

        _loop tmpDataRep
          for (i := 1; i <= GroupsCountInRep; i++) {
            MasItogKol[i] += tmpDataRep.dKol[i];
            MasItogSum[i] += tmpDataRep.dSum[i];
          }

          sXLTFileName := TranslatePath('%ClientStartPath%') + 'XLS\L_Sklad\Akt_Spis_Chemical.xlt';

          if (FileExist(sXLTFileName))// проверка на существование файла
          {
            // создаем отчет на основании существующего шаблона
            Set sXLSFileName := pXL.CreateReport(sXLTFileName, True);
          }
          else
          {
            sXLTFileName := '';
            sXLSFileName := pXL.CreateXLT(sXLTFileName, True); // создаем заготовку шаблона отчета
          }

          pXL.CreateVar(sXLSFileName);
          pXL.SetDateVar('DateRep', Cur_Date);
          pXL.SetStringVar('DateSoprText','за ' + DateToStr(t.MBPmove.dMove, 'month') + ' ' + DateToStr(t.MBPmove.dMove, 'YYYY')+'г.' );
          pXL.SetStringVar('KatPodr.Name', TOPODR );
          pXL.SetStringVar('KatMol.Name' , TOMOL  );



       if (t.GetFirst KatMOL where (( MBPmove.cMolT == KatMOL.nRec )) = tsOK)
        if (t.GetFirst PersonsMOL where (( KatMOL.cPersons == PersonsMOL.nRec )) = tsOK)
         if (t.GetFirst AppointmentsMOL where (( PersonsMOL.AppointCur  == AppointmentsMOL.nRec )) = tsOK)
          if (t.GetFirst CatalogsMOL where (( AppointmentsMOL.Post    == CatalogsMOL.nRec )) = tsOK)
           pXL.SetStringVar('Catalogs.Name', t.CatalogsMOL.Name)

          for(i := 1; i <= GroupsCountInRep; i++)
          {
            sGroupName := '';

            if (GetFirst GroupMc where ((MasGroup[i] == GroupMc.nRec)) = tsOk)
              sGroupName := GroupMc.Name;

            pXL.SetStringVar('Group'+string(i), sGroupName);
          }

          pXL.SetStringVar('MyOrg', NAMEORG);

          pXL.PublishVar;

          pXL.CreateTbls(sXLSFileName);
          pXL.CreateTbl('SpSopr');

          pXL.CreateTblFld('Npp');
          pXL.CreateTblFld('Fio');
          pXL.CreateTblFld('Signature');
          pXL.CreateTblFld('Dolznost');

          for(i := 1; i <= GroupsCountInRep; i++)
          {
            pXL.CreateTblFld('dkol'+string(i));
            pXL.CreateTblFld('dSum'+string(i))
          }


          _Loop tmpDataRep ordered by sPersons
          {
            // очистить буфер записи таблицы
            pXL.ClearTblBuffer;
            // заполнение значений полей
            dCheckSum := 0;

            for(i := 1;i <= GroupsCountInRep;i++)
              if (tmpDataRep.dKol[i] > 0.0000000001)
              {
                pXL.SetTblNumberFldValue('dKol'+string(i), tmpDataRep.dKol[i]);
                pXL.SetTblNumberFldValue('dSum'+string(i), tmpDataRep.dSum[i]);

                dCheckSum := dCheckSum + tmpDataRep.dkol[i];
              }

            if (dCheckSum < 0.0000000001)
              continue;

            pXL.SetTblStringFldValue('Npp', string(++wNpp));
            pXL.SetTblStringFldValue('Fio',tmpDataRep.sPersons);
            pXL.SetTblStringFldValue('Dolznost',tmpDataRep.sCatalog);

            pXL.InsTblRow;
          }
          //Итого
          pXL.ClearTblBuffer;

          for(i := 1;i <= GroupsCountInRep;i++)
          {
            pXL.SetTblStringFldValue('dKol'+string(i),MasItogKol[i]);
            if (MasItogSum[i] > 0.0000000001)
              pXL.SetTblNumberFldValue('dSum'+string(i), MasItogSum[i]);
          }

          pXL.SetTblStringFldValue('Npp', 'Итого:');
          pXL.InsTblRow;

          pXL.PublishTbl('SpSopr');
          pXL.LoadReport(sXLSFileName);
          pXL.DisConnectExcel;
end.
.{
.}
.}
.begin
 MOVE_MBP_Smyv.fExit;
end.
.endform
