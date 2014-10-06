@set DB=%1
@set PR=%2
@set DOPINC=%3
@rem это год-месяц-день YYYYMMDD для WINXP
@set DD=%DATE:~6,4%%DATE:~3,2%%DATE:~0,2%
echo %DOPINC%
rem pause


@if .%PR%.== .. @set pr=all
@if .%DB%.  == .. goto WARN1
@if not exist %DB%\%PR%\%PR%.prj goto WARN2

@echo.
@echo Компилирую проект %DB%\%PR%\%PR%.PRJ в ресурс %PR%.res
@echo.
call sets.bat
del atlantis.res
del %TPU%\%PR%.res
"%GalPath%vip.EXE" %DB%\%PR%\%PR%.prj  /c:vip.cfg /i:'%1'  /r:%TPU%\%PR%.res /b
copy vip_res.log _log\!%PR%.log
@echo Компиляция завершена! Удачи!
@goto END

:WARN1
@echo.
@echo ++++++++++++++++++++++++++++++++++++++++++++++
@echo  Нужен параметр - имя проекта для компиляции!
@echo ++++++++++++++++++++++++++++++++++++++++++++++
@goto END

:WARN2
@echo ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
@echo  Нет такого проекта "%1\%PR%.prj"! Или он не содержит файлов проекта - PRJ!
@echo ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
@goto END

:END

rem @pause
rem @exit
