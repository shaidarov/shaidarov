@rem ******************************************************************************
@rem                                                       (c) корпорация Галактика
@rem  Галактика 8.1 - Логистика
@rem  Сборка компонент
@rem ******************************************************************************



goto ext
@call 4OneComp F_Alg      %1
@call 4OneComp F_BuhRep   %1
@call 4OneComp F_MBP      %1
@call 4OneComp F_OS       %1
@call 4OneComp F_OsOper   %1

@call 4OneComp F_OsRep    %1
@call 4OneComp F_PlPor    %1
@call 4OneComp F_PlPorRep %1
@call 4OneComp F_Podot    %1
@call 4OneComp F_SFO      %1
@call 4OneComp F_Template %1
@call 4OneComp F_TXO      %1
@call 4OneComp L_BaseDoc  %1
@call 4OneComp L_Dogovor  %1
@call 4OneComp L_KatOrg   %1
@call 4OneComp L_MCU      %1
@call 4OneComp L_MOL      %1
@call 4OneComp L_PrnSopr  %1
@call 4OneComp L_SaldoMTR %1
@call 4OneComp L_SF       %1
@call 4OneComp L_Sklad    %1
@call 4OneComp L_SoprDoc  %1
@call 4OneComp M_Transp   %1

@call 4OneComp Z_WT      %1

:ext