::::::::::::::::::::::::::::::::::::
::      SSH Connector Script      ::
::    Programmiert von CODEALI    ::
::::::::::::::::::::::::::::::::::::

::Festlegungen
@echo off
title SSH Connector
set /p connection=<"C:\Users\%USERNAME%\Documents\connection.conf"
::Festlegungen ENDE

::Setup Menu
:setup
IF EXIST "C:\Users\%USERNAME%\Documents\connection.conf" (
    cls
    IF EXIST "C:\Users\%USERNAME%\Documents\autossh.conf" (
        goto asshconnect
    ) ELSE (
        goto main
    )
) ELSE (
    cls
    echo.
    echo    Hello %USERNAME%, Wellcome to the Setup
    echo    Please enter your user connection destination. (Example: user@127.0.0.1)
    echo.
    set /P INPUT="> "
    echo %INPUT%>"C:\Users\%USERNAME%\Documents\connection.conf"
    echo %INPUT% wurde als verbindungsziel gespeichert.
    echo Du kannst dich nun mit "ssh connect" verbinden
)
::Setup Menu ENDE

::Main Menu
:main
cls
echo.
echo    Hello %USERNAME%
echo    For connect type "ssh"
echo    For help type "help"
echo.
:mainfromhelp
set /P CMD="> "
IF %CMD%==help GOTO help
IF %CMD%==Help GOTO help
IF %CMD%==ssh GOTO sshconnect
IF %CMD%==setup GOTO newsetup
IF %CMD%==autossh GOTO autossh
cls
goto setup
::Main Menu ENDE

:newsetup
del "C:\Users\%USERNAME%\Documents\connection.conf"
goto setup

:autossh
echo true>"C:\Users\%USERNAME%\Documents\autossh.conf"
echo.
echo AutoSSH was setet!
echo Please restart the Skript!
echo.
TIMEOUT 5 /NOBREAK >NUL
cls
exit

::Help Menu
:help
echo.
echo    ssh - Connect to the Server
echo    setup - Open the Setup to change the Connection
echo    autossh - Once you do that, you can't undo it! This command ensures that when the script is opened, you are logged in.
echo    help - Open this Menu
echo    You Connection: %connection%
echo.
goto mainfromhelp
::Help Menu ENDE

::SSH
:sshconnect
echo.
:asshconnect
echo Connection to %connection%
TIMEOUT 3 /NOBREAK >NUL
ssh %connection%
TIMEOUT 5 /NOBREAK >NUL
goto setup
::SSH ENDE