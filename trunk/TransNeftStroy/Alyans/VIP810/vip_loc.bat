@set DB=%1
@set PR=%2
@set DOPINC=%3
@rem �� ���-�����-���� YYYYMMDD ��� WINXP
@set DD=%DATE:~6,4%%DATE:~3,2%%DATE:~0,2%
echo %DOPINC%
rem pause


@if .%PR%.== .. @set pr=all
@if .%DB%.  == .. goto WARN1
@if not exist %DB%\%PR%\%PR%.prj goto WARN2

@echo.
@echo ���������� �஥�� %DB%\%PR%\%PR%.PRJ � ����� %PR%.res
@echo.
call sets.bat
del atlantis.res
del %TPU%\%PR%.res
"%GalPath%vip.EXE" %DB%\%PR%\%PR%.prj  /c:vip.cfg /i:'%1'  /r:%TPU%\%PR%.res /b
copy vip_res.log _log\!%PR%.log
@echo ��������� �����襭�! ����!
@goto END

:WARN1
@echo.
@echo ++++++++++++++++++++++++++++++++++++++++++++++
@echo  �㦥� ��ࠬ��� - ��� �஥�� ��� �������樨!
@echo ++++++++++++++++++++++++++++++++++++++++++++++
@goto END

:WARN2
@echo ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
@echo  ��� ⠪��� �஥�� "%1\%PR%.prj"! ��� �� �� ᮤ�ন� 䠩��� �஥�� - PRJ!
@echo ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
@goto END

:END

rem @pause
rem @exit
