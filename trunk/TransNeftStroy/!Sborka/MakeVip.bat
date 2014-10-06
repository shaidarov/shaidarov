
if exist atlantis.res del atlantis.res
@echo off
REM
REM ********************************************************************************
REM                                             (c) В.Володько, корпорация Галактика
REM  Галактика 8.1 - сборка
REM  Создание конфигурационного файла vip.cfg
REM ********************************************************************************
REM
call sets.bat

@echo off
if exist vip.cfg del vip.cfg
echo Создание конфигурационного файла vip.cfg...

rem echo Forms.OldSlkCompile=Off >> vip.cfg

echo [database] >>vip.cfg
echo   databasename=%DATABASE%     >>vip.cfg
echo   DataBaseDriver=%DATADRIVER% >>vip.cfg

echo [SQLDriver] >>vip.cfg
echo   SQLServer=%SQLSERVER% >>vip.cfg
echo   FullLoginName=%FULLNAMEON% >>vip.cfg

echo /U:%GALUSERNAME% >>vip.cfg
echo /P:%GALPWD% >>vip.cfg

echo ! Тип визуализации по умолчанию (NUMERIC, INDICATOR или ROTATE)>> vip.cfg
echo System.VisualType=NUMERIC>> vip.cfg
echo ! Сжимать ресурсы (быстрое сжатие отключаем)>> vip.cfg
echo System.ResourceFastCompress=Off>> vip.cfg
echo ! Путь на каталог, где будут храниться отчеты и другие выходные данные >> vip.cfg
echo Files.OutputFilesDirectory=IncVipLo >>vip.cfg
echo ! Путь на каталог где ведутся временные файлы (например, C:\TMP)>> vip.cfg
echo Files.TmpFilesDirectory=%TMPFILESDIR% >> vip.cfg
echo.>> vip.cfg

echo [Compilers] >>vip.cfg
echo ! Уровень выдачи диагностики (0-только Error, 1-Warning и Error, 2-все : Warning, Info, Error)>> vip.cfg
echo   ErrorLevel=2 >> vip.cfg
echo ! Режим минимизации выдачи информации о процессе компиляции с целью ее ускорения >>vip.cfg
echo  MinVisual=On  >>vip.cfg
echo ! Формировать Include-файлы для паскаля в результате компиляции>> vip.cfg
echo   WriteIncludes=Off >> vip.cfg
echo ! Служебный ресурс >>vip.cfg
echo   SubServientResource='atlantis.res' >>vip.cfg
echo ! При задании файлов по маске, искать также файлы в поддиректориях >>vip.cfg
echo   SubDir=OFF >> vip.cfg
echo ! Результат компиляции сохранять в ресурсе>> vip.cfg
echo   WriteToResource=On >> vip.cfg
echo ! Формировать листинги в результате компиляции>> vip.cfg
echo   WriteListing=ON >> vip.cfg
echo ! Короткий формат вывода ошибок  >> vip.cfg
echo  ShortMessages=OFF >> vip.cfg

echo ! Назначение : Компилировать все заданные файлы, а не до первой ошибки >>vip.cfg
echo  Full=ON >>vip.cfg
echo ! Для выявления нелицензированных интерфейсов при компиляции  >>vip.cfg
echo  DisableIfcLicWarnings = false >>vip.cfg
echo ! Предпочтение константам при компиляции  >>vip.cfg
echo  ConstantPreference=off >>vip.cfg
echo.>> vip.cfg
echo ! вместо компиляции выдает на консоль список измененных файлов >> vip.cfg
echo CheckModifyOnly=OFF >> vip.cfg
echo ! Сохранять информацию о наследовании интерфейсов >> vip.cfg
echo InhSaveLevel=3 >> vip.cfg

echo [Vip] >> vip.cfg
echo ! Маска предупреждения при приведении типов: 0-нет; 1-к целочисленным типам; >> vip.cfg
echo ! 2-к вещественным типам; 4-к строковым типам; 8-к типам дата-время; >> vip.cfg
echo BaseTypesWarning=14                                        >> vip.cfg
echo ! В 8.1 используется некомпонентный словарь >> vip.cfg
echo NoTablesInComponent=On                      >> vip.cfg
echo ! Запрещено включать параметры Debug и LocalDebug при сборке версии  >>vip.cfg
echo Debug=1 >>vip.cfg
echo LocalDebug=1 >>vip.cfg
echo.>> vip.cfg


rem echo ! Путь на каталог сервера аппаратного ключа >> vip.cfg
echo HardWareKey.SharedPath=%HWKEYDIR% >>vip.cfg
echo LicParam.LicFileName=%LicFile% >>vip.cfg
echo.>> vip.cfg
rem ----------------

echo ! Ресурсы, автоматически открывающиеся при старте программы >> vip.cfg
echo ! (например, внешние ресурсы пользователя)>> vip.cfg
echo /resources:%tpum%ExtFun.res;>> vip.cfg
echo /resources:%tpum%C_StatLine.res;>> vip.cfg
echo /resources:%tpum%DictCache.res;>> vip.cfg

echo /resources:%tpum%Z_Service.RES;>> vip.cfg
echo /resources:%tpum%Z_STAFFRECRUITING.RES;>> vip.cfg
echo /resources:%tpum%Z_StaffPensioner.RES;>> vip.cfg
echo /resources:%tpum%Z_CALC.RES;>> vip.cfg
echo /resources:%tpum%Z_MP.RES;>> vip.cfg
echo /resources:%tpum%Z_PAYREP.RES;>> vip.cfg
echo /resources:%tpum%Z_STAFFREPORTS.RES;>> vip.cfg
echo /resources:%tpum%Z_StaffOrders.Res;>> vip.cfg
echo /resources:%tpum%Z_STATIS.RES;>> vip.cfg
echo /resources:%tpum%Z_NDFL.RES;>> vip.cfg
echo /resources:%tpum%Z_FOT.RES;>> vip.cfg
echo /resources:%tpum%Z_SREDN.RES;>> vip.cfg
echo /resources:%tpum%Z_ZAR.RES;>> vip.cfg
echo /resources:%tpum%Z_WT.RES;>> vip.cfg
echo /resources:%tpum%Z_TARSTAV.RES;>> vip.cfg
echo /resources:%tpum%Z_STAFFTEST.RES;>> vip.cfg
echo /resources:%tpum%Z_STAFFCAT.RES;>> vip.cfg
echo /resources:%tpum%Z_STAFF.RES;>> vip.cfg
echo /resources:%tpum%Z_PFREP.RES;>> vip.cfg
echo /resources:%tpum%Z_MGTS.RES;>> vip.cfg
echo /resources:%tpum%Z_LSCHET.RES;>> vip.cfg
echo /resources:%tpum%Z_KATPODR.RES;>> vip.cfg
echo /resources:%tpum%Z_CALENDAR.RES;>> vip.cfg
echo /resources:%tpum%Z_Rlist.res;>> vip.cfg
echo /resources:%tpum%M_UP.RES;>> vip.cfg
echo /resources:%tpum%M_TRANSP.RES;>> vip.cfg
echo /resources:%tpum%M_TPP.RES;>> vip.cfg
echo /resources:%tpum%M_SKLPLAN.RES;>> vip.cfg
echo /resources:%tpum%M_SERV.RES;>> vip.cfg
echo /resources:%tpum%M_SCRIPTS.RES;>> vip.cfg
echo /resources:%tpum%M_QUALITY.RES;>> vip.cfg
echo /resources:%tpum%M_MNPLAN.RES;>> vip.cfg
echo /resources:%tpum%M_DVS.RES;>> vip.cfg
echo /resources:%tpum%M_GETPOTR.RES;>> vip.cfg
echo /resources:%tpum%M_EIXML.RES;>> vip.cfg
echo /resources:%tpum%M_CONTROL.RES;>> vip.cfg
echo /resources:%tpum%F_XLSREP.RES;>> vip.cfg
echo /resources:%tpum%F_VEKS.RES;>> vip.cfg
echo /resources:%tpum%F_VEDOM.RES;>> vip.cfg
echo /resources:%tpum%F_VALUTDOC.RES;>> vip.cfg
echo /resources:%tpum%F_UTILS.RES;>> vip.cfg
echo /resources:%tpum%F_USERREPORT.RES;>> vip.cfg
echo /resources:%tpum%F_TXOAPI.RES;>> vip.cfg
echo /resources:%tpum%F_TXO.RES;>> vip.cfg
echo /resources:%tpum%F_TREENEW.RES;>> vip.cfg
echo /resources:%tpum%F_TEMPLATE.RES;>> vip.cfg
echo /resources:%tpum%F_TAXES.RES;>> vip.cfg
echo /resources:%tpum%F_SOPRHOZ.RES;>> vip.cfg
echo /resources:%tpum%F_SHTRAF.RES;>> vip.cfg
echo /resources:%tpum%F_SFO.RES;>> vip.cfg
echo /resources:%tpum%F_SALDO.RES;>> vip.cfg
echo /resources:%tpum%F_RTXO.RES;>> vip.cfg
echo /resources:%tpum%F_POST.RES;>> vip.cfg
echo /resources:%tpum%F_PODOT.RES;>> vip.cfg
echo /resources:%tpum%F_PLPOR.RES;>> vip.cfg
echo /resources:%tpum%F_PlPorRep.res;>> vip.cfg
echo /resources:%tpum%F_Avizo.res;>> vip.cfg
echo /resources:%tpum%F_PLANSSCH.RES;>> vip.cfg
echo /resources:%tpum%F_PAT.RES;>> vip.cfg
echo /resources:%tpum%F_OSREP.RES;>> vip.cfg
echo /resources:%tpum%F_OSOPER.RES;>> vip.cfg
echo /resources:%tpum%F_OSINVCARD.RES;>> vip.cfg
echo /resources:%tpum%F_OS.RES;>> vip.cfg
echo /resources:%tpum%F_OFP.RES;>> vip.cfg
echo /resources:%tpum%F_OBOROT.RES;>> vip.cfg
echo /resources:%tpum%F_NALOGREG.RES;>> vip.cfg
echo /resources:%tpum%F_MBPPUB.RES;>> vip.cfg
echo /resources:%tpum%F_MBP.RES;>> vip.cfg
echo /resources:%tpum%F_KATKOD.RES;>> vip.cfg
echo /resources:%tpum%F_KATDOC.RES;>> vip.cfg
echo /resources:%tpum%F_ISKI.RES;>> vip.cfg
echo /resources:%tpum%F_GETAN.RES;>> vip.cfg
echo /resources:%tpum%F_FPOBOROT.RES;>> vip.cfg
echo /resources:%tpum%F_FPKATH.RES;>> vip.cfg
echo /resources:%tpum%F_FPHASHAN.RES;>> vip.cfg
echo /resources:%tpum%F_FPCATALOG.RES;>> vip.cfg
echo /resources:%tpum%F_FPBUDGET.RES;>> vip.cfg
echo /resources:%tpum%F_FPADDFLD.RES;>> vip.cfg
echo /resources:%tpum%F_FILIAL.RES;>> vip.cfg
echo /resources:%tpum%F_FA.RES;>> vip.cfg
echo /resources:%tpum%F_EXTAN.RES;>> vip.cfg
echo /resources:%tpum%F_DRAGM.RES;>> vip.cfg
echo /resources:%tpum%F_DOCOB.RES;>> vip.cfg
echo /resources:%tpum%F_DISTPL.RES;>> vip.cfg
echo /resources:%tpum%F_DIFFRATE.RES;>> vip.cfg
echo /resources:%tpum%F_CONSOL.RES;>> vip.cfg
echo /resources:%tpum%F_COMMON.RES;>> vip.cfg
echo /resources:%tpum%F_CLOSCH.RES;>> vip.cfg
echo /resources:%tpum%F_CASHBANK.RES;>> vip.cfg
echo /resources:%tpum%F_BUHSCHET.RES;>> vip.cfg
echo /resources:%tpum%F_BUHREP.RES;>> vip.cfg
echo /resources:%tpum%F_BANKDOCF.RES;>> vip.cfg
echo /resources:%tpum%F_BACKLOG.RES;>> vip.cfg
echo /resources:%tpum%F_APLAN.RES;>> vip.cfg
echo /resources:%tpum%F_AN.RES;>> vip.cfg
echo /resources:%tpum%F_ALG.RES;>> vip.cfg
echo /resources:%tpum%F_VZachet;>> vip.cfg
echo /resources:%tpum%L_VPR.RES;>> vip.cfg
echo /resources:%tpum%L_VAL.RES;>> vip.cfg
echo /resources:%tpum%L_UKSPLANS.RES;>> vip.cfg
echo /resources:%tpum%L_UKS.RES;>> vip.cfg
echo /resources:%tpum%L_TTNDOC.RES;>> vip.cfg
echo /resources:%tpum%L_SPEXCH.RES;>> vip.cfg
echo /resources:%tpum%L_SOPRDOC.RES;>> vip.cfg
echo /resources:%tpum%L_SMETA.RES;>> vip.cfg
echo /resources:%tpum%L_SKLAD.RES;>> vip.cfg
echo /resources:%tpum%L_SKID.RES;>> vip.cfg
echo /resources:%tpum%L_SF.RES;>> vip.cfg
echo /resources:%tpum%L_SERIALN.RES;>> vip.cfg
echo /resources:%tpum%L_SALDOMTR.RES;>> vip.cfg
echo /resources:%tpum%L_ROZN.RES;>> vip.cfg
echo /resources:%tpum%L_RETTARA.RES;>> vip.cfg
echo /resources:%tpum%L_RESERVE.RES;>> vip.cfg
echo /resources:%tpum%L_REPOPER.RES;>> vip.cfg
echo /resources:%tpum%L_REPBASEDOC.RES;>> vip.cfg
echo /resources:%tpum%L_REMONT.RES;>> vip.cfg
echo /resources:%tpum%L_REALTING.RES;>> vip.cfg
echo /resources:%tpum%L_PRNSOPR.RES;>> vip.cfg
echo /resources:%tpum%L_PRICES.RES;>> vip.cfg
echo /resources:%tpum%L_PLANPR.RES;>> vip.cfg
echo /resources:%tpum%L_PHONECARD.RES;>> vip.cfg
echo /resources:%tpum%L_OSTATKI.RES;>> vip.cfg
echo /resources:%tpum%L_NALNAKL.RES;>> vip.cfg
echo /resources:%tpum%L_NALOG.RES;>> vip.cfg
echo /resources:%tpum%L_MOVECELL.RES;>> vip.cfg
echo /resources:%tpum%L_MOL.RES;>> vip.cfg
echo /resources:%tpum%L_MCU.RES;>> vip.cfg
echo /resources:%tpum%L_MARKET.RES;>> vip.cfg
echo /resources:%tpum%L_MAKENAKL.RES;>> vip.cfg
echo /resources:%tpum%L_MAKEDO.RES;>> vip.cfg
echo /resources:%tpum%L_KONTRBAL.RES;>> vip.cfg
echo /resources:%tpum%L_KATPARTY.RES;>> vip.cfg
echo /resources:%tpum%L_KATORG.RES;>> vip.cfg
echo /resources:%tpum%L_KATNAZNA.RES;>> vip.cfg
echo /resources:%tpum%L_KASSA.RES;>> vip.cfg
echo /resources:%tpum%L_GRSOPR.RES;>> vip.cfg
echo /resources:%tpum%L_GRSCH.RES;>> vip.cfg
echo /resources:%tpum%L_GRPLAT.RES;>> vip.cfg
echo /resources:%tpum%L_DOVER.RES;>> vip.cfg
echo /resources:%tpum%L_DOGOVOR.RES;>> vip.cfg
echo /resources:%tpum%L_CRM.RES;>> vip.cfg
echo /resources:%tpum%L_CONSIG.RES;>> vip.cfg
echo /resources:%tpum%L_COMMON.RES;>> vip.cfg
echo /resources:%tpum%L_CESSIA.RES;>> vip.cfg
echo /resources:%tpum%L_CALCUSL.RES;>> vip.cfg
echo /resources:%tpum%L_BOX.RES;>> vip.cfg
echo /resources:%tpum%L_BASEDOC.RES;>> vip.cfg
echo /resources:%tpum%L_ADVREP.RES;>> vip.cfg
echo /resources:%tpum%C_WEBSERVICES.RES;>> vip.cfg
echo /resources:%tpum%C_USERMANUAL.RES;>> vip.cfg
echo /resources:%tpum%C_TREETUNE.RES;>> vip.cfg
echo /resources:%tpum%C_TREE.RES;>> vip.cfg
echo /resources:%tpum%C_STATLINE.RES;>> vip.cfg
echo /resources:%tpum%C_PARTNER.RES;>> vip.cfg
echo /resources:%tpum%C_OLAP.RES;>> vip.cfg
echo /resources:%tpum%C_MAILER.RES;>> vip.cfg
echo /resources:%tpum%C_JOIN.RES;>> vip.cfg
echo /resources:%tpum%C_EXPIMP.RES;>> vip.cfg
echo /resources:%tpum%C_CHECKOPER.RES;>> vip.cfg
echo /resources:%tpum%C_CHECKKBU.RES;>> vip.cfg
echo /resources:%tpum%C_EXTCLASS.RES;>> vip.cfg
echo /resources:%tpum%C_TUNE.RES;>> vip.cfg
echo /resources:%tpum%C_COMMON.RES;>> vip.cfg

rem ----------------
echo.>> vip.cfg

echo ! Пути для поиска Include-файлов>> vip.cfg
rem Каталог INC со всеми вложенными
for /r %PATHGALSRC%INC %%i in (.) do @echo /i:%%~fi;>> vip.cfg

rem Каталог INC со всеми вложенными
for /r %PATHGALSRC%ATL %%i in (.) do @echo /i:%%~fi;>> vip.cfg

rem Лицензирование
for /r %PATHGALSRC%Components\Lih %%i in (.) do @echo /i:%%~fi;>> vip.cfg

rem *.fnc файлы
for /r IncVipLo %%i in (.) do @echo /i:%%~fi;>> vip.cfg

rem Атлантис
echo /i:%Atlantis%Source;           >> vip.cfg
echo /i:%Atlantis%Source\SysObjIFC; >> vip.cfg
echo /i:%Atlantis%Gen;              >> vip.cfg

rem Описание интерфейсов при полной сборке идет перед COMPSRC
if NOT exist full.sbo GOTO NEXT
for /r %PATHGALSRC%Components\Vil %%i in (.) do @echo /i:%%~fi;>> vip.cfg

:NEXT
rem Пути поиска каталога CopmSrc со всеми вложенными
for /r %PATHGALSRC%COMPSRC %%i in (.) do @echo /i:%%~fi;>> vip.cfg

rem echo #param /linc:NoLic.vpp >> vip.cfg

