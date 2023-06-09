@ECHO OFF

REM questo bat realizza uno switch in grado di consentire l'avvio di Linux
REM o l'avvio di Win.x

cls

echo.
echo.
echo "S per effettuare il boot di Linux"
echo "N per effettuare il boot di Windows"
echo. 
choice /C:sn 
if errorlevel 2 goto End
C:\loadlin\loadlin c:\loadlin\vmlinuz root=/dev/sda1 ro
:End