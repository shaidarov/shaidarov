!
! Листинг макрокомпилятора.
! Создан 11/05/2010 в 19:21:24 программой "VipER".
! Исходный файл: "INC\NalFunc.vip".
!

INC\NALFUNC.VIH 1: //------------------------------------------------------------------------------
INC\NALFUNC.VIH 2: //                                                      (c) Корпорация ГАЛАКТИКА
INC\NALFUNC.VIH 3: //------------------------------------------------------------------------------
INC\NALFUNC.VIH 4: // Галактика 8.10
INC\NALFUNC.VIH 5: // Обьектный интерфейс "Вспомогательные функции для налоговых регистров"
INC\NALFUNC.VIH 6: //------------------------------------------------------------------------------
D:\WORK\!GALAXY\WORK_WP\SRC\COMPSRC\F\F_BUHREP\VIP\PICKBUH\PICKBUH.VIH 1: //------------------------------------------------------------------------------
D:\WORK\!GALAXY\WORK_WP\SRC\COMPSRC\F\F_BUHREP\VIP\PICKBUH\PICKBUH.VIH 2: //                                                      (c) Корпорация ГАЛАКТИКА
D:\WORK\!GALAXY\WORK_WP\SRC\COMPSRC\F\F_BUHREP\VIP\PICKBUH\PICKBUH.VIH 3: //------------------------------------------------------------------------------
D:\WORK\!GALAXY\WORK_WP\SRC\COMPSRC\F\F_BUHREP\VIP\PICKBUH\PICKBUH.VIH 4: // Галактика 5.8
D:\WORK\!GALAXY\WORK_WP\SRC\COMPSRC\F\F_BUHREP\VIP\PICKBUH\PICKBUH.VIH 5: // Обьектный интерфес работы с таблицей PickBuh
D:\WORK\!GALAXY\WORK_WP\SRC\COMPSRC\F\F_BUHREP\VIP\PICKBUH\PICKBUH.VIH 6: //------------------------------------------------------------------------------
D:\WORK\!GALAXY\WORK_WP\SRC\COMPSRC\F\F_BUHREP\VIP\PICKBUH\PICKBUH.VIH 7: 
D:\WORK\!GALAXY\WORK_WP\SRC\COMPSRC\F\F_BUHREP\VIP\PICKBUH\PICKBUH.VIH 10: 
D:\WORK\!GALAXY\WORK_WP\SRC\COMPSRC\F\F_BUHREP\VIP\PICKBUH\PICKBUH.VIH 12: #Component "F_BuhRep"
D:\WORK\!GALAXY\WORK_WP\SRC\COMPSRC\F\F_BUHREP\VIP\PICKBUH\PICKBUH.VIH 14: 
D:\WORK\!GALAXY\WORK_WP\SRC\COMPSRC\F\F_BUHREP\VIP\PICKBUH\PICKBUH.VIH 17: Table struct PickBuh
D:\WORK\!GALAXY\WORK_WP\SRC\COMPSRC\F\F_BUHREP\VIP\PICKBUH\PICKBUH.VIH 18: (
D:\WORK\!GALAXY\WORK_WP\SRC\COMPSRC\F\F_BUHREP\VIP\PICKBUH\PICKBUH.VIH 19:    KodTable : word      "таблица"
D:\WORK\!GALAXY\WORK_WP\SRC\COMPSRC\F\F_BUHREP\VIP\PICKBUH\PICKBUH.VIH 20:   ,PickRec  : tNRec     "номер элемента в списке"
D:\WORK\!GALAXY\WORK_WP\SRC\COMPSRC\F\F_BUHREP\VIP\PICKBUH\PICKBUH.VIH 21:   ,PickKod  : tSchet3   "код или NRec элемента"
D:\WORK\!GALAXY\WORK_WP\SRC\COMPSRC\F\F_BUHREP\VIP\PICKBUH\PICKBUH.VIH 22:   ,Schet    : tSchet3   "бухг.счет"
D:\WORK\!GALAXY\WORK_WP\SRC\COMPSRC\F\F_BUHREP\VIP\PICKBUH\PICKBUH.VIH 23:   ,SubKau   : tSchet3   "субсчет/КАУ"
D:\WORK\!GALAXY\WORK_WP\SRC\COMPSRC\F\F_BUHREP\VIP\PICKBUH\PICKBUH.VIH 24:   ,Name     : tName     "имя фильтра"
D:\WORK\!GALAXY\WORK_WP\SRC\COMPSRC\F\F_BUHREP\VIP\PICKBUH\PICKBUH.VIH 25:   ,Pick     : integer   "порядок выбора"
D:\WORK\!GALAXY\WORK_WP\SRC\COMPSRC\F\F_BUHREP\VIP\PICKBUH\PICKBUH.VIH 26:   ,PickKol  : double    "количество"
D:\WORK\!GALAXY\WORK_WP\SRC\COMPSRC\F\F_BUHREP\VIP\PICKBUH\PICKBUH.VIH 27: )
D:\WORK\!GALAXY\WORK_WP\SRC\COMPSRC\F\F_BUHREP\VIP\PICKBUH\PICKBUH.VIH 28: with index
D:\WORK\!GALAXY\WORK_WP\SRC\COMPSRC\F\F_BUHREP\VIP\PICKBUH\PICKBUH.VIH 29: (
D:\WORK\!GALAXY\WORK_WP\SRC\COMPSRC\F\F_BUHREP\VIP\PICKBUH\PICKBUH.VIH 30:    PickBuhRec = KodTable + PickRec
D:\WORK\!GALAXY\WORK_WP\SRC\COMPSRC\F\F_BUHREP\VIP\PICKBUH\PICKBUH.VIH 31:   ,PickBuhKod = KodTable + PickKod
D:\WORK\!GALAXY\WORK_WP\SRC\COMPSRC\F\F_BUHREP\VIP\PICKBUH\PICKBUH.VIH 32:   ,PickBuhSch = KodTable + Schet + PickKod
D:\WORK\!GALAXY\WORK_WP\SRC\COMPSRC\F\F_BUHREP\VIP\PICKBUH\PICKBUH.VIH 33:   ,PickBuhPck = KodTable + Pick
D:\WORK\!GALAXY\WORK_WP\SRC\COMPSRC\F\F_BUHREP\VIP\PICKBUH\PICKBUH.VIH 34: );
D:\WORK\!GALAXY\WORK_WP\SRC\COMPSRC\F\F_BUHREP\VIP\PICKBUH\PICKBUH.VIH 37: 
D:\WORK\!GALAXY\WORK_WP\SRC\COMPSRC\F\F_BUHREP\VIP\PICKBUH\PICKBUH.VIH 42: ObjInterface ObjPickBuh;
D:\WORK\!GALAXY\WORK_WP\SRC\COMPSRC\F\F_BUHREP\VIP\PICKBUH\PICKBUH.VIH 47:   function GetCountItem      (wTab : word)                  : word;
D:\WORK\!GALAXY\WORK_WP\SRC\COMPSRC\F\F_BUHREP\VIP\PICKBUH\PICKBUH.VIH 52:   function FoundInPick       (wTab : word)                  : boolean;
D:\WORK\!GALAXY\WORK_WP\SRC\COMPSRC\F\F_BUHREP\VIP\PICKBUH\PICKBUH.VIH 57:   function FoundInPick_GetRec
D:\WORK\!GALAXY\WORK_WP\SRC\COMPSRC\F\F_BUHREP\VIP\PICKBUH\PICKBUH.VIH 58:                              (wTab : word)                  : comp;
D:\WORK\!GALAXY\WORK_WP\SRC\COMPSRC\F\F_BUHREP\VIP\PICKBUH\PICKBUH.VIH 63:   function FoundInPick_GetKod
D:\WORK\!GALAXY\WORK_WP\SRC\COMPSRC\F\F_BUHREP\VIP\PICKBUH\PICKBUH.VIH 64:                              (wTab : word)                  : tSchet3;
D:\WORK\!GALAXY\WORK_WP\SRC\COMPSRC\F\F_BUHREP\VIP\PICKBUH\PICKBUH.VIH 69:   function FoundInPick_GetSchet(wTab : word)                  : tSchet3;
D:\WORK\!GALAXY\WORK_WP\SRC\COMPSRC\F\F_BUHREP\VIP\PICKBUH\PICKBUH.VIH 74:   function FoundInPickByKod  (wTab : word; sKod : tSchet3)  : boolean;
D:\WORK\!GALAXY\WORK_WP\SRC\COMPSRC\F\F_BUHREP\VIP\PICKBUH\PICKBUH.VIH 79:   function FoundInPickByRec  (wTab : word; cRec : comp)     : boolean;
D:\WORK\!GALAXY\WORK_WP\SRC\COMPSRC\F\F_BUHREP\VIP\PICKBUH\PICKBUH.VIH 81:   // приходится искать _Loop - ом, надо это дело как то грохать
D:\WORK\!GALAXY\WORK_WP\SRC\COMPSRC\F\F_BUHREP\VIP\PICKBUH\PICKBUH.VIH 85:   function FoundSubSch       (Sch : tSchet3; Sub : tSubSch) : boolean;
D:\WORK\!GALAXY\WORK_WP\SRC\COMPSRC\F\F_BUHREP\VIP\PICKBUH\PICKBUH.VIH 90:   function FoundFirstSub     (var Sch : tSchet3;
D:\WORK\!GALAXY\WORK_WP\SRC\COMPSRC\F\F_BUHREP\VIP\PICKBUH\PICKBUH.VIH 91:                               var Sub : tSubSch)            : boolean;
D:\WORK\!GALAXY\WORK_WP\SRC\COMPSRC\F\F_BUHREP\VIP\PICKBUH\PICKBUH.VIH 96:   function FoundSubForSchet  (Sch : tSchet3)                : boolean;
D:\WORK\!GALAXY\WORK_WP\SRC\COMPSRC\F\F_BUHREP\VIP\PICKBUH\PICKBUH.VIH 101:   function DeletePickBuh                                    : boolean;
D:\WORK\!GALAXY\WORK_WP\SRC\COMPSRC\F\F_BUHREP\VIP\PICKBUH\PICKBUH.VIH 106:   function DeleteItem        (wTbl : word)                  : boolean;
D:\WORK\!GALAXY\WORK_WP\SRC\COMPSRC\F\F_BUHREP\VIP\PICKBUH\PICKBUH.VIH 111:   function DeleteItemByRec   (wTab : word; cRec : comp)     : boolean;
D:\WORK\!GALAXY\WORK_WP\SRC\COMPSRC\F\F_BUHREP\VIP\PICKBUH\PICKBUH.VIH 116:   function DeleteItemBySchet (wTab : word; Sch : tSchet3)   : boolean;
D:\WORK\!GALAXY\WORK_WP\SRC\COMPSRC\F\F_BUHREP\VIP\PICKBUH\PICKBUH.VIH 121:   function CopyItem          (wOld, wNew : word)            : word;
D:\WORK\!GALAXY\WORK_WP\SRC\COMPSRC\F\F_BUHREP\VIP\PICKBUH\PICKBUH.VIH 126:   function MoveItem          (wOld, wNew : word)            : word;
D:\WORK\!GALAXY\WORK_WP\SRC\COMPSRC\F\F_BUHREP\VIP\PICKBUH\PICKBUH.VIH 131:   function InsertFullRecord  (wTbl : word;
D:\WORK\!GALAXY\WORK_WP\SRC\COMPSRC\F\F_BUHREP\VIP\PICKBUH\PICKBUH.VIH 132:                               cRec : comp;
D:\WORK\!GALAXY\WORK_WP\SRC\COMPSRC\F\F_BUHREP\VIP\PICKBUH\PICKBUH.VIH 133:                               sKod, sSch, sSub, sName : string;
D:\WORK\!GALAXY\WORK_WP\SRC\COMPSRC\F\F_BUHREP\VIP\PICKBUH\PICKBUH.VIH 134:                               iPick : integer;
D:\WORK\!GALAXY\WORK_WP\SRC\COMPSRC\F\F_BUHREP\VIP\PICKBUH\PICKBUH.VIH 135:                               dPick : double)               : boolean;
D:\WORK\!GALAXY\WORK_WP\SRC\COMPSRC\F\F_BUHREP\VIP\PICKBUH\PICKBUH.VIH 140:   function InsertAnRecord    (wTbl : word;
D:\WORK\!GALAXY\WORK_WP\SRC\COMPSRC\F\F_BUHREP\VIP\PICKBUH\PICKBUH.VIH 141:                               cRec : comp;
D:\WORK\!GALAXY\WORK_WP\SRC\COMPSRC\F\F_BUHREP\VIP\PICKBUH\PICKBUH.VIH 142:                               sKod, sName : string;
D:\WORK\!GALAXY\WORK_WP\SRC\COMPSRC\F\F_BUHREP\VIP\PICKBUH\PICKBUH.VIH 143:                               iPick : integer)              : boolean;
D:\WORK\!GALAXY\WORK_WP\SRC\COMPSRC\F\F_BUHREP\VIP\PICKBUH\PICKBUH.VIH 145: end;
D:\WORK\!GALAXY\WORK_WP\SRC\COMPSRC\F\F_BUHREP\VIP\PICKBUH\PICKBUH.VIH 147: VipInterface PickBuh implements ObjPickBuh Licensed(Free);
INC\NALFUNC.VIH 14: 
INC\NALFUNC.VIH 16: #Component "For_24X"
INC\NALFUNC.VIH 18: 
INC\NALFUNC.VIH 19: ObjInterface ObjNalFunc;
INC\NALFUNC.VIH 21:   function GetOrgInfo(var OrgName: string; var INN: string): boolean;
INC\NALFUNC.VIH 22:   function RunTune(var dBeg: date; var dEnd: date): boolean;
INC\NALFUNC.VIH 23:   function RunTuneWKatOS(tidk: word): tNrec;
INC\NALFUNC.VIH 24:   function MyShowKau(wKau: word; cKau: tNRec): string;
INC\NALFUNC.VIH 25:   function GetSRefin(dRefin: date):double;
INC\NALFUNC.VIH 26:   function GetDays(d1, d2: date): date;
INC\NALFUNC.VIH 27:   function CheckOborotCO(KodSpo: tNRec): boolean;
INC\NALFUNC.VIH 28:   function CheckCO(CO: tNRec): boolean;
INC\NALFUNC.VIH 29:   function CheckKatOs(cRec: tNRec): boolean;
INC\NALFUNC.VIH 30:   procedure WriteDate(Row, Column: word; d: date);
INC\NALFUNC.VIH 31:   procedure WriteNum(Row, Column: word; sum: double);
INC\NALFUNC.VIH 32:   procedure WriteSum(Row, Column: word; sum: double);
INC\NALFUNC.VIH 33: 
INC\NALFUNC.VIH 34: end;
INC\NALFUNC.VIH 36: VipInterface NalFunc_For_24X implements ObjNalFunc Licensed(Free);
D:\WORK\!GALAXY\WORK_WP\SRC\COMPSRC\F\F_GETAN\VIP\GETKAU.VIH 1: //------------------------------------------------------------------------------
D:\WORK\!GALAXY\WORK_WP\SRC\COMPSRC\F\F_GETAN\VIP\GETKAU.VIH 2: //                                                      (c) Корпорация ГАЛАКТИКА
D:\WORK\!GALAXY\WORK_WP\SRC\COMPSRC\F\F_GETAN\VIP\GETKAU.VIH 3: //------------------------------------------------------------------------------
D:\WORK\!GALAXY\WORK_WP\SRC\COMPSRC\F\F_GETAN\VIP\GETKAU.VIH 4: // Галактика 5.8 - Бухгалтерский контур
D:\WORK\!GALAXY\WORK_WP\SRC\COMPSRC\F\F_GETAN\VIP\GETKAU.VIH 5: // Обьектный интерфес выбора КАУ
D:\WORK\!GALAXY\WORK_WP\SRC\COMPSRC\F\F_GETAN\VIP\GETKAU.VIH 6: //------------------------------------------------------------------------------
D:\WORK\!GALAXY\WORK_WP\SRC\COMPSRC\F\F_GETAN\VIP\GETKAU.VIH 7: 
D:\WORK\!GALAXY\WORK_WP\SRC\COMPSRC\F\F_GETAN\VIP\GETKAU.VIH 10: 
D:\WORK\!GALAXY\WORK_WP\SRC\COMPSRC\F\F_GETAN\VIP\GETKAU.VIH 12: #Component "F_GetAn"
D:\WORK\!GALAXY\WORK_WP\SRC\COMPSRC\F\F_GETAN\VIP\GETKAU.VIH 14: 
D:\WORK\!GALAXY\WORK_WP\SRC\COMPSRC\F\F_GETAN\VIP\GETKAU.VIH 19: ObjInterface ObjGetKau;
D:\WORK\!GALAXY\WORK_WP\SRC\COMPSRC\F\F_GETAN\VIP\GETKAU.VIH 24:   function GetMarkerName
D:\WORK\!GALAXY\WORK_WP\SRC\COMPSRC\F\F_GETAN\VIP\GETKAU.VIH 25:           (     wKau     : word  // код КАУ (таблица КАУ)
D:\WORK\!GALAXY\WORK_WP\SRC\COMPSRC\F\F_GETAN\VIP\GETKAU.VIH 26:           ) : string;
D:\WORK\!GALAXY\WORK_WP\SRC\COMPSRC\F\F_GETAN\VIP\GETKAU.VIH 27: 
D:\WORK\!GALAXY\WORK_WP\SRC\COMPSRC\F\F_GETAN\VIP\GETKAU.VIH 33:   //<b>wIntMode</b> режим выбора (см.GloConst.inc)<br>
D:\WORK\!GALAXY\WORK_WP\SRC\COMPSRC\F\F_GETAN\VIP\GETKAU.VIH 34:   //<b>wKau</b> код КАУ (таблица КАУ) (см. KauConst.inc).
D:\WORK\!GALAXY\WORK_WP\SRC\COMPSRC\F\F_GETAN\VIP\GETKAU.VIH 35:   //Возвращает код <b>элементарной</b> аналитики для <b>Наборов</b> и <b>Обобщенных аналитик</b>
D:\WORK\!GALAXY\WORK_WP\SRC\COMPSRC\F\F_GETAN\VIP\GETKAU.VIH 36:   //(для остальных возвращается как был на входе)<br>
D:\WORK\!GALAXY\WORK_WP\SRC\COMPSRC\F\F_GETAN\VIP\GETKAU.VIH 37:   //<b>cKau</b> выбранное значение (NRec) <b>элементарной</b> аналитики<br>
D:\WORK\!GALAXY\WORK_WP\SRC\COMPSRC\F\F_GETAN\VIP\GETKAU.VIH 38:   function GetCodeKau
D:\WORK\!GALAXY\WORK_WP\SRC\COMPSRC\F\F_GETAN\VIP\GETKAU.VIH 39:           (     wIntMode : word; // режим выбора          (см.GloConst.inc)
D:\WORK\!GALAXY\WORK_WP\SRC\COMPSRC\F\F_GETAN\VIP\GETKAU.VIH 40:             var wKau     : word; // код КАУ (таблица КАУ) (см. KauConst.inc).
D:\WORK\!GALAXY\WORK_WP\SRC\COMPSRC\F\F_GETAN\VIP\GETKAU.VIH 41:                                  // Возвращает код ЭЛЕМЕНТАРНОЙ Аналитики для
D:\WORK\!GALAXY\WORK_WP\SRC\COMPSRC\F\F_GETAN\VIP\GETKAU.VIH 42:                                  // Наборов и Обобщенных (для остальных
D:\WORK\!GALAXY\WORK_WP\SRC\COMPSRC\F\F_GETAN\VIP\GETKAU.VIH 43:                                  // возвращается как был на входе)
D:\WORK\!GALAXY\WORK_WP\SRC\COMPSRC\F\F_GETAN\VIP\GETKAU.VIH 44:             var cKau     : comp  // выбранный NRec ЭЛЕМЕНТАРНОЙ Аналитики
D:\WORK\!GALAXY\WORK_WP\SRC\COMPSRC\F\F_GETAN\VIP\GETKAU.VIH 45:           ) : longint;           // возвращает количество выбранных записей
D:\WORK\!GALAXY\WORK_WP\SRC\COMPSRC\F\F_GETAN\VIP\GETKAU.VIH 46: 
D:\WORK\!GALAXY\WORK_WP\SRC\COMPSRC\F\F_GETAN\VIP\GETKAU.VIH 51:   procedure ClearFilter;
D:\WORK\!GALAXY\WORK_WP\SRC\COMPSRC\F\F_GETAN\VIP\GETKAU.VIH 56:   //<b>wKau</b> код КАУ (таблица КАУ)<br>
D:\WORK\!GALAXY\WORK_WP\SRC\COMPSRC\F\F_GETAN\VIP\GETKAU.VIH 57:   //<b>cKau</b> NRec КАУ
D:\WORK\!GALAXY\WORK_WP\SRC\COMPSRC\F\F_GETAN\VIP\GETKAU.VIH 58:   procedure SetFilter
D:\WORK\!GALAXY\WORK_WP\SRC\COMPSRC\F\F_GETAN\VIP\GETKAU.VIH 59:           (     wKau     : word; // код КАУ (таблица КАУ)
D:\WORK\!GALAXY\WORK_WP\SRC\COMPSRC\F\F_GETAN\VIP\GETKAU.VIH 60:                 cKau     : comp  // NRec КАУ
D:\WORK\!GALAXY\WORK_WP\SRC\COMPSRC\F\F_GETAN\VIP\GETKAU.VIH 61:           );
D:\WORK\!GALAXY\WORK_WP\SRC\COMPSRC\F\F_GETAN\VIP\GETKAU.VIH 63: end;
D:\WORK\!GALAXY\WORK_WP\SRC\COMPSRC\F\F_GETAN\VIP\GETKAU.VIH 65: VipInterface GetKau implements ObjGetKau Licensed(Free);
INC\NalFunc.vip 3: Interface NalFunc_For_24X;
INC\NalFunc.vip 4: table Struct PodrFilter
INC\NalFunc.vip 5: (
INC\NalFunc.vip 6:   cPodr:tNrec,
INC\NalFunc.vip 7:   sName: string
INC\NalFunc.vip 8: )
INC\NalFunc.vip 9: with index(
INC\NalFunc.vip 10:   PF01=cPodr
INC\NalFunc.vip 11: );
INC\NalFunc.vip 12: 
INC\NalFunc.vip 13: var
INC\NalFunc.vip 14:   OrgName, INN:string;
INC\NalFunc.vip 15:   dFrom
INC\NalFunc.vip 16:  ,dTo: date;
INC\NalFunc.vip 17: 
INC\NalFunc.vip 18:  Filter_CO: tNRec;
INC\NalFunc.vip 19:  mFilter_CO: word;
INC\NalFunc.vip 20:  Filter_tidk: word;
INC\NalFunc.vip 21:  Filter_OS: tNrec;
INC\NalFunc.vip 22:  mFilter_OS: word;
INC\NalFunc.vip 23: 
D:\WORK\!GALAXY\WORK_WP\SRC\COMPSRC\F\F_GETAN\VIP\GETKAU.VAR 1: //******************************************************************************
D:\WORK\!GALAXY\WORK_WP\SRC\COMPSRC\F\F_GETAN\VIP\GETKAU.VAR 2: //                                                      (c) корпорация Галактика
D:\WORK\!GALAXY\WORK_WP\SRC\COMPSRC\F\F_GETAN\VIP\GETKAU.VAR 3: // Галактика 7.12 - Финансы
D:\WORK\!GALAXY\WORK_WP\SRC\COMPSRC\F\F_GETAN\VIP\GETKAU.VAR 4: // Объявление переменной типа интерфейс GetKau
D:\WORK\!GALAXY\WORK_WP\SRC\COMPSRC\F\F_GETAN\VIP\GETKAU.VAR 5: //******************************************************************************
D:\WORK\!GALAXY\WORK_WP\SRC\COMPSRC\F\F_GETAN\VIP\GETKAU.VAR 6: 
D:\WORK\!GALAXY\WORK_WP\SRC\COMPSRC\F\F_GETAN\VIP\GETKAU.VAR 11: 
D:\WORK\!GALAXY\WORK_WP\SRC\COMPSRC\F\F_GETAN\VIP\GETKAU.VAR 15: 
D:\WORK\!GALAXY\WORK_WP\SRC\COMPSRC\F\F_GETAN\VIP\GETKAU.VAR 16: var iGetKau: GetKau;
D:\WORK\!GALAXY\WORK_WP\SRC\COMPSRC\F\F_GETAN\VIP\GETKAU.VAR 17: 
D:\WORK\!GALAXY\WORK_WP\SRC\COMPSRC\F\F_BUHREP\VIP\PICKBUH\PICKBUH.VAR 1: 
D:\WORK\!GALAXY\WORK_WP\SRC\COMPSRC\F\F_BUHREP\VIP\PICKBUH\PICKBUH.VAR 2: // Переменная типа интерфейс PickBuh
D:\WORK\!GALAXY\WORK_WP\SRC\COMPSRC\F\F_BUHREP\VIP\PICKBUH\PICKBUH.VAR 3: var iPickBuh : PickBuh;
D:\WORK\!GALAXY\WORK_WP\SRC\COMPSRC\F\F_BUHREP\VIP\PICKBUH\PICKBUH.VAR 4: 
INC\NalFunc.vip 26: 
INC\NalFunc.vip 27: const
INC\NalFunc.vip 28:   MultiStr           = 'множественный выбор';
INC\NalFunc.vip 29:   numCol=11;
INC\NalFunc.vip 30: end;
INC\NalFunc.vip 31: 
INC\NalFunc.vip 32: 
INC\NalFunc.vip 39: 
INC\NalFunc.vip 40: 
INC\NalFunc.vip 41: create view
INC\NalFunc.vip 42: as select
INC\NalFunc.vip 43 (MultiKauShow 1):     if (mFilter_CO = 0, '',
INC\NalFunc.vip 43 (MultiKauShow 2):     if (mFilter_CO = 1, if (GetAnyKAU(cgAkNoDef,  cgKau_FpCO,  Filter_CO),
INC\NalFunc.vip 43 (MultiKauShow 3):       GivenAnName(1), ''),
INC\NalFunc.vip 43:       MultiStr + ' (' + string(mFilter_CO) + ')')) (FieldName = DlgCO)
INC\NalFunc.vip 44 (MultiKauShow 1):   ,  if (mFilter_OS = 0, '',
INC\NalFunc.vip 44 (MultiKauShow 2):     if (mFilter_OS = 1, if (GetAnyKAU(cgAkNoDef,  Filter_tidk,  Filter_OS),
INC\NalFunc.vip 44 (MultiKauShow 3):       GivenAnName(1), ''),
INC\NalFunc.vip 44:       MultiStr + ' (' + string(mFilter_OS) + ')')) (FieldName = DlgOS)
INC\NalFunc.vip 45:   ,if(Filter_tidk = cgKau_OS, 'Основные средства',
INC\NalFunc.vip 46:      if(Filter_tidk = cgKau_NMA, 'Нематериальные активы','')) (FieldName = DlgKatOSName)
INC\NalFunc.vip 47:   ,PickBuh.*
INC\NalFunc.vip 48:   ,KatPodr.*
INC\NalFunc.vip 49:   ,Refin.*
INC\NalFunc.vip 50:   ,KatOrg.*
INC\NalFunc.vip 51: from
INC\NalFunc.vip 52:   PodrFilter
INC\NalFunc.vip 53:   ,KatOS
INC\NalFunc.vip 54:   ,SpKatOS
INC\NalFunc.vip 55:   ,PickBuh
INC\NalFunc.vip 56:   ,KatPodr
INC\NalFunc.vip 57:   ,Refin
INC\NalFunc.vip 58:   ,KatOrg
INC\NalFunc.vip 59: where
INC\NalFunc.vip 60: ((
INC\NalFunc.vip 61:   Filter_tidk == KatOS.Tidk
INC\NalFunc.vip 62:   and KatOS.Nrec==SpKatOS.cKatOS
INC\NalFunc.vip 63: ))
INC\NalFunc.vip 64: bounds ByKatOSCO = Filter_CO == KatOS.cCO(NoIndex)
INC\NalFunc.vip 65: //where
INC\NalFunc.vip 66: //((
INC\NalFunc.vip 67: 
INC\NalFunc.vip 68: //))
INC\NalFunc.vip 69: ;
INC\NalFunc.vip 73: function GetOrgInfo(var OrgName: string; var INN: string): boolean;
INC\NalFunc.vip 74: {
INC\NalFunc.vip 75:   OrgName:='';
INC\NalFunc.vip 76:   INN:='';
INC\NalFunc.vip 77: 
INC\NalFunc.vip 78:   if (GetFirst  KatOrg where ((coGetTune('MYORG')==KatOrg.Nrec)) = tsOk)
INC\NalFunc.vip 79:   {
INC\NalFunc.vip 80:     OrgName:=KatOrg.Name;
INC\NalFunc.vip 81:     INN:=KatOrg.Unn;
INC\NalFunc.vip 82:   }
INC\NalFunc.vip 83: }
INC\NalFunc.vip 87: function MyShowKau(wKau: word; cKau: tNRec): string;
INC\NalFunc.vip 88: {
INC\NalFunc.vip 89:   Result := if(GetAnyKAU(cgAkNoDef, wKau, cKau), GivenAnName(1),'');
INC\NalFunc.vip 90: }
INC\NalFunc.vip 94: function MyShowKauCode(wKau: word; cKau: tNRec): string;
INC\NalFunc.vip 95: {
INC\NalFunc.vip 96:   Result := if(GetAnyKAU(cgAkNoDef, wKau, cKau), GivenAnName(cgAnCode),'');
INC\NalFunc.vip 97: }
INC\NalFunc.vip 101: function GetBackColor(FieldNum: integer): integer;
INC\NalFunc.vip 102: {
INC\NalFunc.vip 103:   Result := 0;
INC\NalFunc.vip 104:   case FieldNum of
INC\NalFunc.vip 105:     #dFrom  : Result := if (longint(dFrom ) = 0, ColorNeed, 0);
INC\NalFunc.vip 106:     #dTo    : Result := if (longint(dTo) = 0, ColorNeed, 0);
INC\NalFunc.vip 107:   end; // case
INC\NalFunc.vip 108: }
INC\NalFunc.vip 112: window wTuneKatOS doAccept,cyan;
INC\NalFunc.vip 113: show at (1,1,90,24);
INC\NalFunc.vip 114:  browse brKatOS ;
INC\NalFunc.vip 115:  table KATOS;
INC\NalFunc.vip 116:      fields
INC\NalFunc.vip 117:        KATOS.INNUM 'инв №' ('инв №') : [15], Protect;
INC\NalFunc.vip 118:        KATOS.NAMEOS 'наименование' ('наименование') : [35], Protect;
INC\NalFunc.vip 119:        KATOS.DATEK 'дата' ('дата') : [10], Protect;
INC\NalFunc.vip 120:        SPKATOS.STOIM 'стоимость' ('стоимость') : [20, '[|-]366`666`666`666`666.88'], Protect;
INC\NalFunc.vip 121:   end;
INC\NalFunc.vip 122: 
INC\NalFunc.vip 123:   HandleEvent
INC\NalFunc.vip 124:     cmInit:
INC\NalFunc.vip 125:       DisableCommand(cmValue1);
INC\NalFunc.vip 126:     cmDefault:
INC\NalFunc.vip 127:        Filter_OS := KatOS.Nrec;
INC\NalFunc.vip 128:     cmHotkeys:
INC\NalFunc.vip 129:       PutHotCommand(RunMenu('katos_HotKeys'));
INC\NalFunc.vip 130:     cmFilterSave:
INC\NalFunc.vip 131:     {
INC\NalFunc.vip 132:       if iGetKau.GetCodeKau(cgiPick, cgKau_FpCO, Filter_CO) <> 0
INC\NalFunc.vip 133:       {
INC\NalFunc.vip 134:         set Filter_CO := Filter_CO;
INC\NalFunc.vip 135:         if (not BoundActive(tbByKatOSCO))
INC\NalFunc.vip 136:         {
INC\NalFunc.vip 137:           AddBounds(tbByKatOSCO);
INC\NalFunc.vip 138:           EnableCommand(cmValue1);
INC\NalFunc.vip 139:         }
INC\NalFunc.vip 140:       }
INC\NalFunc.vip 141:       ReReadRecord;
INC\NalFunc.vip 142:     }
INC\NalFunc.vip 143:     cmValue1:
INC\NalFunc.vip 144:     {
INC\NalFunc.vip 145:       if (BoundActive(tbByKatOSCO))
INC\NalFunc.vip 146:       {
INC\NalFunc.vip 147:         SubBounds(tbByKatOSCO);
INC\NalFunc.vip 148:         DisableCommand(cmValue1);
INC\NalFunc.vip 149:       }
INC\NalFunc.vip 150:       ReReadRecord;
INC\NalFunc.vip 151:     }
INC\NalFunc.vip 152:   end;
INC\NalFunc.vip 153: /*screen scTune ('',,sci13EnEsc)
INC\NalFunc.vip 154: fields
INC\NalFunc.vip 155:   DlgKatOSName: Skip;
INC\NalFunc.vip 156:   DlgOS : Protect, PickButton;
INC\NalFunc.vip 157: buttons
INC\NalFunc.vip 158:   cmOk,Default,,'Обработка данных',hcAllBOk,sci1Esc;
INC\NalFunc.vip 159:   cmCancel,,,'Отмена',hcAllBCancel,sci1Esc;
INC\NalFunc.vip 160: <<
INC\NalFunc.vip 161:  .@@@@@@@@@@@@@@@@@@@@@.@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
INC\NalFunc.vip 162: 
INC\NalFunc.vip 163:           <.Сформировать.> <.   Отмена   .>
INC\NalFunc.vip 164: >>
INC\NalFunc.vip 165: end;
INC\NalFunc.vip 166: HandleEvent
INC\NalFunc.vip 167: cmInit:
INC\NalFunc.vip 168: {
INC\NalFunc.vip 169:   dFrom := date(1, 01, year(cur_date));
INC\NalFunc.vip 170:   dTo := cur_date;
INC\NalFunc.vip 171: }
INC\NalFunc.vip 172: cmOk:
INC\NalFunc.vip 173:   PutCommand(cmDefault);
INC\NalFunc.vip 174: cmPick:
INC\NalFunc.vip 175: {
INC\NalFunc.vip 176:   case CurField of
INC\NalFunc.vip 177:     #DlgCO:
INC\NalFunc.vip 178:     {
INC\NalFunc.vip 179:       mFilter_CO := iGetKau.GetCodeKau(cgiPickMult or if (mFilter_CO>0, cgiNotClear, 0), cgKau_FpCO, Filter_CO);
INC\NalFunc.vip 180:     }
INC\NalFunc.vip 181:     #DlgOS:
INC\NalFunc.vip 182:     {
INC\NalFunc.vip 183:    //   mFilter_OS := iGetKau.GetCodeKau(cgiPickMult or if (mFilter_OS>0, cgiNotClear, 0), Filter_tidk, Filter_OS);
INC\NalFunc.vip 184:       mFilter_OS := iGetKau.GetCodeKau(cgiPick, Filter_tidk, Filter_OS);
INC\NalFunc.vip 185: 
INC\NalFunc.vip 186:     }
INC\NalFunc.vip 187:   end;
INC\NalFunc.vip 188:   RereadRecord;
INC\NalFunc.vip 189: }
INC\NalFunc.vip 190: end;          */
INC\NalFunc.vip 191: 
INC\NalFunc.vip 192: end; //window
INC\NalFunc.vip 193: 
INC\NalFunc.vip 194: 
INC\NalFunc.vip 198: window wTune doAccept ;
INC\NalFunc.vip 199: show at(,,65,5);
INC\NalFunc.vip 201: screen scTune ('',,sci13EnEsc)
INC\NalFunc.vip 202: fields
INC\NalFunc.vip 203:   dFrom : ['DD/MM/YYYY'], NoProtect,{Font = {Bold = true; Color = if (dFrom > dTo, ColorError, 0); BackColor = GetBackColor(#dFrom)}};
INC\NalFunc.vip 204:   dTo : ['DD/MM/YYYY'], NoProtect,{Font = {Bold = true; BackColor = GetBackColor(#dTo)}};
INC\NalFunc.vip 205:   DlgCO : Protect, PickButton;
INC\NalFunc.vip 206: buttons
INC\NalFunc.vip 207:   cmOk,Default,,'Обработка данных',hcAllBOk,sci1Esc;
INC\NalFunc.vip 208:   cmCancel,,,'Отмена',hcAllBCancel,sci1Esc;
INC\NalFunc.vip 209: <<
INC\NalFunc.vip 210: `За период`        &с  .@@@@@@@@@@ `по`.@@@@@@@@@@
INC\NalFunc.vip 211: `Центр ответственности`.@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
INC\NalFunc.vip 212: 
INC\NalFunc.vip 213:           <.Сформировать.> <.   Отмена   .>
INC\NalFunc.vip 214: >>
INC\NalFunc.vip 215: end;
INC\NalFunc.vip 216: HandleEvent
INC\NalFunc.vip 217: cmInit:
INC\NalFunc.vip 218: {
INC\NalFunc.vip 219:   dFrom := date(1, 01, year(cur_date));
INC\NalFunc.vip 220:   dTo := cur_date;
INC\NalFunc.vip 221: }
INC\NalFunc.vip 222: cmOk:
INC\NalFunc.vip 223:   PutCommand(cmDefault);
INC\NalFunc.vip 224: cmPick:
INC\NalFunc.vip 225: {
INC\NalFunc.vip 226:   case CurField of
INC\NalFunc.vip 227:     #DlgCO:
INC\NalFunc.vip 228:     {
INC\NalFunc.vip 229:       mFilter_CO := iGetKau.GetCodeKau(cgiPickMult or if (mFilter_CO>0, cgiNotClear, 0), cgKau_FpCO, Filter_CO);
INC\NalFunc.vip 230:     }
INC\NalFunc.vip 231:   end;
INC\NalFunc.vip 232:   RereadRecord;
INC\NalFunc.vip 233: }
INC\NalFunc.vip 234: end;
INC\NalFunc.vip 235: 
INC\NalFunc.vip 236: end; //window
INC\NalFunc.vip 240: procedure CreatePodrFilter;
INC\NalFunc.vip 241: var
INC\NalFunc.vip 242:   KodSpo: string;
INC\NalFunc.vip 243: {
INC\NalFunc.vip 244:   delete all PodrFilter;
INC\NalFunc.vip 245:   _loop PickBuh where ((cgKau_FpCO == PickBuh.KodTable ))
INC\NalFunc.vip 246:   {
INC\NalFunc.vip 247:     KodSpo := SubStr(PickBuh.PickKod,5, 2);
INC\NalFunc.vip 248:     _loop KatPodr where (KodSpo = SubStr(KatPodr.Kod,1,2))
INC\NalFunc.vip 249:     {
INC\NalFunc.vip 250:       ClearBuffer(#PodrFilter);
INC\NalFunc.vip 251:       PodrFilter.cPodr := KatPodr.NRec;
INC\NalFunc.vip 252:       PodrFilter.sName := KatPodr.Name;
INC\NalFunc.vip 253:       insert current PodrFilter;
INC\NalFunc.vip 254:       //update PickBuh set PickBuh.PickKod := SubStr(PickBuh.PickKod,5,2);
INC\NalFunc.vip 255:     }
INC\NalFunc.vip 256:   }
INC\NalFunc.vip 257: }
INC\NalFunc.vip 261: function RunTune(var dBeg: date; var dEnd: date): boolean;
INC\NalFunc.vip 262: {
INC\NalFunc.vip 263: 
INC\NalFunc.vip 264:   if RunWindowModal(wTune)  <> cmCancel
INC\NalFunc.vip 265:   {
INC\NalFunc.vip 266:     CreatePodrFilter;
INC\NalFunc.vip 267:     dBeg := dFrom;
INC\NalFunc.vip 268:     dEnd := dTo;
INC\NalFunc.vip 269:     Result :=true;
INC\NalFunc.vip 270:   }
INC\NalFunc.vip 271: }
INC\NalFunc.vip 275: function RunTuneWKatOS(tidk: word): tNrec;
INC\NalFunc.vip 276: {
INC\NalFunc.vip 277:   Result := 0;
INC\NalFunc.vip 278:   Filter_tidk := tidk;
INC\NalFunc.vip 279:   if RunWindowModal(wTuneKatOS) <> cmCancel
INC\NalFunc.vip 280:     Result := Filter_OS;
INC\NalFunc.vip 281: }
INC\NalFunc.vip 285: procedure WriteDate(Row, Column: word; d: date);
INC\NalFunc.vip 286: {
INC\NalFunc.vip 287:   if (d != date(0,0,0))
INC\NalFunc.vip 288:     xlSTWriteToMatrix(Row, Column, ' '+DateToStr(d,'DD/MM/YYYY'));
INC\NalFunc.vip 289: }
INC\NalFunc.vip 293: procedure WriteNum(Row, Column: word; sum: double);
INC\NalFunc.vip 294: {
INC\NalFunc.vip 295:   xlSetNumberFormat('# ##0', Row, Column, Row, Column);
INC\NalFunc.vip 296:   xlSTWriteToMatrix(Row, Column, sum);
INC\NalFunc.vip 297: }
INC\NalFunc.vip 301: procedure WriteSum(Row, Column: word; sum: double);
INC\NalFunc.vip 302: {
INC\NalFunc.vip 303:   xlSetNumberFormat('# ##0,00', Row, Column, Row, Column);
INC\NalFunc.vip 304:   xlSTWriteToMatrix(Row, Column, sum);
INC\NalFunc.vip 305: }
INC\NalFunc.vip 309: function GetSRefin(dRefin: date):double;
INC\NalFunc.vip 310: {
INC\NalFunc.vip 311:   Result := 0;
INC\NalFunc.vip 312:   if (GetFirst Refin where ((dRefin >>= Refin.DATREC)) = tsOk)
INC\NalFunc.vip 313:     Result := Refin.Proc;
INC\NalFunc.vip 314: }
INC\NalFunc.vip 318: function GetDays(d1, d2: date): date;
INC\NalFunc.vip 319: {
INC\NalFunc.vip 320:   Result := 0;
INC\NalFunc.vip 321:   if( (d1 != date(0,0,0)) and (d2 != date(0,0,0)) )
INC\NalFunc.vip 322:     Result := CalcDaysBetweenDates(d1, d2, FALSE);
INC\NalFunc.vip 323: }
INC\NalFunc.vip 327: function CheckOborotCO(KodSpo: tNRec): boolean;
INC\NalFunc.vip 328: {
INC\NalFunc.vip 329:   if (mFilter_CO > 0)
INC\NalFunc.vip 330:     Result := RecordExists PodrFilter where ((KodSpo == PodrFilter.cPodr)) = tsOk;
INC\NalFunc.vip 331:   else
INC\NalFunc.vip 332:     Result := true;
INC\NalFunc.vip 333: }
INC\NalFunc.vip 337: function CheckCO(CO: tNRec): boolean;
INC\NalFunc.vip 338: {
INC\NalFunc.vip 339:   if (mFilter_CO > 0)
INC\NalFunc.vip 340:     Result := iPickBuh.FoundInPickByRec(cgKau_FpCO, CO);
INC\NalFunc.vip 341:   else
INC\NalFunc.vip 342:     Result := true;
INC\NalFunc.vip 343: }
INC\NalFunc.vip 347: function CheckKatOs(cRec: tNRec): boolean;
INC\NalFunc.vip 348: {
INC\NalFunc.vip 349:   if (mFilter_OS > 0)
INC\NalFunc.vip 350:     Result := iPickBuh.FoundInPickByRec(Filter_tidk, cRec);
INC\NalFunc.vip 351:   else
INC\NalFunc.vip 352:     Result := true;
INC\NalFunc.vip 353: }
INC\NalFunc.vip 354: end.
INC\NalFunc.vip 355: 
INC\NalFunc.vip 356: katos_HotKeys Menu
INC\NalFunc.vip 357: {
INC\NalFunc.vip 358: - 'Установка ограничений по центру ответственности',cmFilterSave,'Установка ограничений по центру ответственности.',hcOsVFiltr,'Alt-B',kbAltB,sci1Esc;
INC\NalFunc.vip 359: - 'Снятие ограничений по центру ответственности',cmValue1,'Снятие ограничений по центру ответственности.',hcOsVFiltr,'Alt-B',kbAltB,sci1Esc;
INC\NalFunc.vip 360: }

