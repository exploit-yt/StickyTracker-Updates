@echo off
title StickyTrackerAI - Setup
color 0B
mode con: cols=80 lines=25

:: --------------------------------------------------------
:: AUTOMATIC ADMINISTRATOR ELEVATION
:: --------------------------------------------------------
net session >nul 2>&1
if %errorLevel% == 0 (
    goto :START_SETUP
) else (
    echo ========================================================
    echo             REQUESTING ADMINISTRATOR RIGHTS
    echo ========================================================
    echo.
    echo Please click "Yes" on the Windows prompt to continue...
    
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    echo UAC.ShellExecute "%~s0", "", "", "runas", 1 >> "%temp%\getadmin.vbs"
    "%temp%\getadmin.vbs"
    del "%temp%\getadmin.vbs"
    exit /B
)

:START_SETUP
cd /d "%~dp0"
set "PY_CMD=python"

:: --------------------------------------------------------
:: STEP 1: PYTHON
:: --------------------------------------------------------
cls
echo ========================================================
echo                 [1/4] CHECKING PYTHON
echo ========================================================
echo.

python --version >nul 2>&1
if %errorlevel% equ 0 (
    echo [+] Python is already installed! Moving to next step...
    timeout /t 2 >nul
    goto STEP2
)

color 0E
echo [*] Python 3.10 is required. Opening the installer...
echo.

set "PY_INSTALLER="
for %%f in ("utils\python-*.exe") do set "PY_INSTALLER=%%~ff"

if "%PY_INSTALLER%"=="" (
    color 0C
    echo [!] ERROR: Python installer not found in 'utils' folder.
    pause
    exit
)

echo PLEASE FOLLOW THESE STEPS CAREFULLY:
echo 1. The Python installer window is opening now...
echo 2. VERY IMPORTANT: Check the box "[X] Add Python 3.10 to PATH"
echo 3. Click "Install Now" and wait for it to finish.
echo 4. Close the installer window when it says "Successful".
echo.
echo [*] Waiting for you to finish...

timeout /t 2 >nul
start /wait "" "%PY_INSTALLER%"

echo.
echo [*] Verifying installation...
timeout /t 2 >nul

set "PATH=%ProgramFiles%\Python310;%ProgramFiles%\Python310\Scripts;%LocalAppData%\Programs\Python\Python310;%LocalAppData%\Programs\Python\Python310\Scripts;%PATH%"

python --version >nul 2>&1
if %errorlevel% equ 0 (
    set "PY_CMD=python"
    goto STEP2
)
if exist "%ProgramFiles%\Python310\python.exe" (
    set "PY_CMD="%ProgramFiles%\Python310\python.exe""
    goto STEP2
)
if exist "%LocalAppData%\Programs\Python\Python310\python.exe" (
    set "PY_CMD="%LocalAppData%\Programs\Python\Python310\python.exe""
    goto STEP2
)

color 0C
echo [!] PYTHON INSTALLATION FAILED. Did you check "Add to PATH"?
echo Please close this window and run the installer again.
pause
exit

:: --------------------------------------------------------
:: STEP 2: VIGEMBUS
:: --------------------------------------------------------
:STEP2
cls
color 0B
echo ========================================================
echo             [2/4] INSTALLING VIGEMBUS DRIVER
echo ========================================================
echo.

set "VIGEM_INSTALLER="
for %%f in ("utils\ViGEmBus*.exe") do set "VIGEM_INSTALLER=%%~ff"

if "%VIGEM_INSTALLER%"=="" (
    echo [!] WARNING: ViGEmBus installer not found. Skipping...
    timeout /t 3 >nul
    goto STEP3
)

echo [*] Opening ViGEmBus setup window...
echo [*] Please complete the installation normally.
echo [*] Waiting for you to finish...

timeout /t 2 >nul
start /wait "" "%VIGEM_INSTALLER%"

:: --------------------------------------------------------
:: STEP 3: PIP DEPENDENCIES
:: --------------------------------------------------------
:STEP3
cls
color 0B
echo ========================================================
echo             [3/4] INSTALLING DEPENDENCIES
echo ========================================================
echo.
echo [*] Updating PIP...
%PY_CMD% -m pip install --upgrade pip >nul 2>&1
echo.
echo [*] Installing Web Server ^& Core...
%PY_CMD% -m pip install fastapi uvicorn pydantic requests psutil
echo.
echo [*] Installing Capture ^& Controllers...
%PY_CMD% -m pip install dxcam vgamepad inputs pygame
echo.
echo [*] Installing AI Engine...
%PY_CMD% -m pip install opencv-python numpy onnxruntime-directml onnx onnxconverter-common onnxsim
echo.
timeout /t 2 >nul

:: --------------------------------------------------------
:: STEP 4: HIDHIDE
:: --------------------------------------------------------
:STEP4
cls
color 0B
echo ========================================================
echo             [4/4] INSTALLING HIDHIDE DRIVER
echo ========================================================
echo.

set "HIDHIDE_INSTALLER="
for %%f in ("utils\HidHide*.exe") do set "HIDHIDE_INSTALLER=%%~ff"

if "%HIDHIDE_INSTALLER%"=="" (
    echo [!] WARNING: HidHide installer not found. Skipping...
    timeout /t 3 >nul
    goto DONE
)

echo [*] Opening HidHide setup window...
echo [*] Please complete the installation normally.
echo [*] Waiting for you to finish...

timeout /t 2 >nul
start /wait "" "%HIDHIDE_INSTALLER%"

:: --------------------------------------------------------
:: FINISH
:: --------------------------------------------------------
:DONE
cls
color 0A
echo ========================================================
echo                INSTALLATION COMPLETED!
echo ========================================================
echo.
echo [+] Python dependencies successfully installed.
echo [+] Virtual drivers checked and installed.
echo.
echo [!] IMPORTANT: A system RESTART is highly recommended before
echo     running StickyTrackerAI for the first time, so Windows
echo     can load the new controller drivers correctly.
echo.
echo You can now close this window. Enjoy!
echo.
pause
exit