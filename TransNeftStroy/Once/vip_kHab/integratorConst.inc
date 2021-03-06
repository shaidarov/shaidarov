#ifndef _BarKodConst_inc_INCLUDED_
#define _BarKodConst_inc_INCLUDED_

const
  cg_ExportSuccess      = 0;
  cg_ExportNoSuccess    = 1;
  cg_ExportCount        = 2;
  cg_ExportError        = 3;

  cg_ImportSuccess      = 4;
  cg_ImportNoSuccess    = 5;
  cg_ImportCount        = 6;
  cg_ImportError        = 7;

  cg_ExportNoSuccessReason = 8;
  // �������� ���譥�� ��ਡ��, � ���஬ �㤥� �࠭����� ���祭�� �����
  cg_StatusIntegrator = '����ﭨ� ��⥣�樨';
  cg_StatusReason = '��稭� ������';

  cg_RunAuto            = 0;
  cg_RunManual          = 1;

  cg_DBAgent            = 0;
  cg_DBPrincipal        = 1;
  cg_cnDBAgent          = '�� �����';
  cg_cnDBPrincipal      = '�� �ਭ樯���';

  cg_Exp                = 0;
  cg_Imp                = 1;

  lExpImpIntegrator  = 'ExpImpIntegrator';
  lOrderOnIntergator = 'OrderOnIntergator_';

  cg_NeverSend          = 0;
  cg_OnlySendError      = 1;
  cg_AllSend            = 2;

  NameExportSysLog      = 'export_integrator.log';
  NameImportSysLog      = 'import_integrator.log';

  cg_sSemaphoreExpPref      = 'SemaphoreExp';
  cg_sSemaphoreImpPref      = 'SemaphoreImp';

  cg_NeverSet           = 0;
  cg_OnlyDescr          = 1;
  cg_OnlyGrDescr        = 2;
  cg_AllSet             = 3;
  //䠩�� ᮤ�ঠ騥 ���㬥��� � �訡����
  cg_sErrorFile         = 1;
end;

#endif
