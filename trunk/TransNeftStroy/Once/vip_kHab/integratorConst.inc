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
  // название внешнего атрибута, в котором будет храниться значение статуса
  cg_StatusIntegrator = 'Состояние интеграции';
  cg_StatusReason = 'Причина возврата';

  cg_RunAuto            = 0;
  cg_RunManual          = 1;

  cg_DBAgent            = 0;
  cg_DBPrincipal        = 1;
  cg_cnDBAgent          = 'БД Агента';
  cg_cnDBPrincipal      = 'БД Принципала';

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
  //файлы содержащие документы с ошибками
  cg_sErrorFile         = 1;
end;

#endif
