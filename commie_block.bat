@echo off
set hostspath=%windir%\System32\drivers\etc\hosts

# Check Admin
:: BatchGotAdmin
:-------------------------------------
REM  --> Check for permissions
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"

REM --> If error flag set, we do not have admin.
if '%errorlevel%' NEQ '0' (
    echo Requesting administrative privileges...
    goto UACPrompt
) else ( goto gotAdmin )

:UACPrompt
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    echo UAC.ShellExecute "%~s0", "", "", "runas", 1 >> "%temp%\getadmin.vbs"

    "%temp%\getadmin.vbs"
    exit /B

:gotAdmin
    if exist "%temp%\getadmin.vbs" ( del "%temp%\getadmin.vbs" )
    pushd "%CD%"
    CD /D "%~dp0"

# IPv4
echo 0.0.0.0 thewire.in >> %hostspath%
echo 0.0.0.0 scroll.in >> %hostspath%
echo 0.0.0.0 scoopwhoop.com >> %hostspath%
echo 0.0.0.0 www.scoopwhoop.com >> %hostspath%
echo 0.0.0.0 milligazette.com >> %hostspath%
echo 0.0.0.0 www.milligazette.com >> %hostspath%
echo 0.0.0.0 thequint.com >> %hostspath%
echo 0.0.0.0 www.thequint.com >> %hostspath%
echo 0.0.0.0 cm.marketgid.com >> %hostspath%
echo 0.0.0.0 imgg.marketgid.com >> %hostspath%
echo 0.0.0.0 hc2.humanclick.com >> %hostspath%
echo 0.0.0.0 humanclick.com >> %hostspath%

# IPv6
echo :: thewire.in >> %hostspath%
echo :: scroll.in >> %hostspath%
echo :: scoopwhoop.com >> %hostspath%
echo :: www.scoopwhoop.com >> %hostspath%
echo :: milligazette.com >> %hostspath%
echo :: www.milligazette.com >> %hostspath%
echo :: thequint.com >> %hostspath%
echo :: www.thequint.com >> %hostspath%
echo :: cm.marketgid.com >> %hostspath%
echo :: imgg.marketgid.com >> %hostspath%
echo :: hc2.humanclick.com >> %hostspath%
echo :: humanclick.com >> %hostspath%

ipconfig /flushdns
exit
