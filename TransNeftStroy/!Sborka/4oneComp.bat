call MakeVip.bat
@echo on
if exist stop.sbo goto ee

rem sets.bat

@echo off
if exist vip.cfg del vip.cfg
echo Создание конфигурационного файла vip.cfg...
echo #include VipDop.cfg

rem Каталог INC со всеми вложенными
for /r %PATHTNSSRC%%1 %%i in (.) do @echo /i:%%~fi;>> vip.cfg

set SboInExe=%PATHTNSSRC%
REM ********************************************************************************
REM                                             (c) В.Володько, корпорация Галактика
REM  Галактика 8.1 - сборка
REM  Сборка одной компоненты
REM  1й параметр - наименование компоненты
REM ********************************************************************************
echo Сборка %1_TNS > vip.sbo
set StartTime=%time%
@echo off
REM ********************************************************************************
if '%TPU%'=='' goto NOVAR
if '%SboInExe%'=='' goto NOVAR
if '%ATLANTIS%'=='' goto NOVAR
if '%DATABASE%'=='' goto NOVAR
REM
REM Достроим путь (Компонента лежит в подкаталоге)
REM

set CompPath=%PATHTNSSRC%%1
if NOT exist %CompPath%\%1_TNS.prj goto SboRTF
echo.
echo ###############################################################################
echo #
echo #  Сборка компоненты %1_TNS
echo #
echo.
if NOT exist full.sbo call makevip.bat
@rem Для компонентной сборки вот эта строка

%ATLANTIS%vip.exe %CompPath%\%1_TNS.prj /vip.componentname=%1 /r:%SboInExe%\Res\%1_TNS.res /f %2 %3
echo\

if exist %SboInExe%\%1.res echo Ресурс сборки компоненты %SboInExe%\%1.res
REM ********************************************************************************
if errorlevel 1 goto ERR
REM ********************************************************************************

:SboRTF
if NOT exist %CompPath%\fr3 Goto AfterFR3
REM  отчеты FastReport
echo.
echo #
echo #  Сборка отчетов FastReport3 компоненты %1
echo #
echo.
if exist %CompPath%\fr3 for /r %CompPath%\fr3 %%i in (.) do @%ATLANTIS%\frres.exe /to /r:%SboInExe%%1_TNS.res /source:%%~fi

REM ********************************************************************************
if errorlevel 1 goto ERR
goto AfterFR3
REM ********************************************************************************
:ERR
rem
echo   Ошибки при сборке 4oneComp. Компонента %1  > error.sbo
goto AfterFR3
REM ********************************************************************************
:NOVAR
@call novar.bat
REM ********************************************************************************
:AfterFR3
@if NOT exist incviplo md incviplo
@if exist %SboInExe%%1.fnc copy %SboInExe%%1.fnc incviplo\*.fnc>nul
@if exist %SboInExe%%1.fnc del  %SboInExe%%1.fnc
REM ********************************************************************************

@rem удалить следующие 2 строчки когда утилита научится искать логи в подкаталогах
if exist %Logs%\%1.log del %Logs%\%1.log
rem Копируем логи сборки
if exist vip_res.log echo Лог сборки компоненты %Logs%\%1.log
if exist vip_res.log copy vip_res.log %SboInExe%\Res\%1_TNS.log>nul

REM ********************************************************************************
:ee

del *.log
del *.dsk
del time.sbo
del error.sbo
del atlantis.res
del vip.sbo