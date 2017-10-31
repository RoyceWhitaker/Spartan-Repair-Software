@echo off
Title *SRS Multi Antivirus Removal Tool*
setlocal ENABLEDELAYEDEXPANSION & set "_FilePath=%~1"
  if NOT EXIST "!_FilePath!" (echo/Starting AdminElevation)
  set "_FN=_%~ns1" & echo/%TEMP%| findstr /C:"(" >nul && (echo/ERROR: %%TEMP%% path can not contain parenthesis &pause &endlocal &fc;: 2>nul & goto:eof)
  set _FN=%_FN:(=%
  set _vbspath="%temp:~%\%_FN:)=%.vbs" & set "_batpath=%temp:~%\%_FN:)=%.bat"
  >nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
  if "%errorlevel%" NEQ "0" goto :_getElevation
  (if exist %_vbspath% ( del %_vbspath% )) & (if exist %_batpath% ( del %_batpath% )) 
  endlocal & CD /D "%~dp1" & ver >nul & goto:eof
  :_getElevation
  echo/Requesting elevation...
  echo/Set UAC = CreateObject^("Shell.Application"^) > %_vbspath% || (echo/&echo/Unable to create %_vbspath% & endlocal &md; 2>nul &goto:eof) 
  echo/UAC.ShellExecute "%_batpath%", "", "", "runas", 1 >> %_vbspath% & echo/wscript.Quit(1)>> %_vbspath%
  echo/@%* > "%_batpath%" || (echo/&echo/Unable to create %_batpath% & endlocal &md; 2>nul &goto:eof)
  echo/@if %%errorlevel%%==9009 (echo/Admin user could not read the batch file. If running from a mapped drive or UNC path, check if Admin user can read it.) ^& @if %%errorlevel%% NEQ 0 pause >> "%_batpath%"
  %_vbspath% && (echo/&echo/Failed to run VBscript %_vbspath% &endlocal &md; 2>nul & goto:Ask)
  echo/&echo/Elevation was requested on a new CMD window &endlocal &fc;: 2>nul & goto:Ask
:Ask
cls
echo                      SRS Multi Antivirus Removal Tool
echo [-----------------------------------------------------------------------------]
echo [                                                                             ]
echo [ Copyright (c) 2017 Associated Student - San Jose State University           ]
echo [                                                                             ]
echo [-----------------------------------------------------------------------------]
echo.
set INPUT=
set /P INPUT= Ready? (Y/N): %=%
If /I "%INPUT%"=="y" goto yes 
If /I "%INPUT%"=="n" goto no
If /I "%INPUT%"=="Y" goto yes 
If /I "%INPUT%"=="N" goto no
echo Incorrect input & goto Ask
:yes
Cls
md SRS
cd SRS
echo %time% Please Wait Downloading Required Program Files
echo [                  ]
cd ahk
AutoHotkey_1.1.26.01_setup.exe /S
cd../
rem powershell -Command "(New-Object Net.WebClient).DownloadFile('https://dl.surfright.nl/HitmanPro_x64.exe', 'HitmanPro_64.exe')"
cls
echo %time% Please Wait Program Downloading Required Files
echo [##################]


cls
title *SRS* Associated Students
::------Create and switch to folder------




::------Return To Menu------
SET RETURN=Return
:Return
::------Return To Menu------



::===============================Main Menu==========================================
title *SRS* By: Associated Students
cls
echo                             Main Menu
echo *******************************************************************************
echo *                                                                             *
echo *  Enter 1 For Antivirus Removal Tools                                        *
echo *                                                                             *
echo *  Enter 9 To Exit                                                            *
echo *                                                                             *
echo *******************************************************************************
set input=
set /p input= Enter Option %=%
if %input%==1 goto a
if %input%==9 goto z
echo Incorrect input & goto %RETURN%




:a
title SRS Antivirus Removal Tools
cls 
::-------------------------------Malware Cleanup------------------------------------
echo                         Antivirus Removal Tools
echo *******************************************************************************
echo *                                                                             *
echo *  Enter 1 For HitmanPRo                                                      *
echo *                                                                             *
echo *  Enter 2 For MalwareBytes                                                                           *
echo *                                                                             *
echo *                                                                             *
echo *                                                                             *
echo *                                                                             *
echo *                                                                             *
echo *                                                                             *
echo *                                                                             *
echo *                                                                             *
echo *                                                                             *
echo *                                                                             *
echo *  Enter 8 To Go Back                                                         *
echo *                                                                             *
echo *  Enter 9 To End                                                             *
echo *                                                                             *
echo *******************************************************************************

set input=
set /p input= Enter Option %=%
if %input%==1 goto hitmanpro
if %input%==2 goto malwarebytes
if %input%==8 goto %RETURN%
if %input%==9 goto z
echo Incorrect input & goto a


:hitmanpro
cls
:CheckOS
IF EXIST "%PROGRAMFILES(X86)%" (GOTO 64BIT) ELSE (GOTO 32BIT)

:32BIT 
echo %time% Download HitmanPro
powershell -Command "(New-Object Net.WebClient).DownloadFile('https://drive.google.com/uc?export=download&id=0B2gUNgdOrfL7cHdjSmVVZDdkaFE', 'HitmanPro.exe')"
cls
echo %time% Done :D
echo %time% Running HitmanPro
call HitmanPro.exe
GOTO a
:64BIT
echo %time% Downloading HitmanPro_x64
powershell -Command "(New-Object Net.WebClient).DownloadFile('https://drive.google.com/uc?export=download&id=0B2gUNgdOrfL7cHdjSmVVZDdkaFE', 'HitmanPro_x64.exe')"
cls
echo %time% Done :D
echo %time% Running HitmanPro
call HitmanPro_x64.exe
GOTO a

:malwarebytes
cls
echo %time% Loading MalwareBytes
TIMEOUT /T 2
goto malwarebytesInstall

:malwarebytesInstall
cd ahk
dir
cls
call script.exe
cd ../
goto malwarebytesConfirmUninstall


:malwarebytesConfirmUninstall
cls

title *SRS* By: Associated Students
cls
echo                             Uninstall Malwarebytes
echo *******************************************************************************
echo *                                                                             *
echo *  Enter 1 For Yes                                                            *
echo *                                                                             *
echo *  Enter 2 To No                                                              *
echo *                                                                             *
echo *******************************************************************************
set input=
set /p input= Enter Option %=%
if %input%==1 goto malwarebytesUninstall
if %input%==2 goto a
echo Incorrect input & goto malwarebytesConfirmUninstall

:malwarebytesUninstall
cd ahk
start malwarebytesUninstall.exe
cd../
GOTO a

:z
cls
echo                            Closing Application
echo *******************************************************************************


echo %time% Cleaning up temporary files...
rem RD /s /q SRS/
TIMEOUT /T 3
echo Done!
echo *******************************************************************************
echo %time% Uninstalling AutoHotKey
cd ahk
call ahkUninstall.exe
TIMEOUT /T 3
echo HitmanPro Uninstalled.
echo *******************************************************************************
echo %time% Uninstalling HitmanPRO
TIMEOUT /T 3
echo HitmanPro Uninstalled.
echo *******************************************************************************
echo %time% Uninstalling Malwarebytes
TIMEOUT /T 3
echo Uninstalled HitmanPro
echo *******************************************************************************
echo %time% Completed!
TIMEOUT /T 3



:no
exit