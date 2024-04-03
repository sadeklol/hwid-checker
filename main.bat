@echo off
:loop
echo Starting Print.  
title Hwid checker by sadeklol
mode con: cols=180 lines=62
color 6
echo.
echo [97m===============================[93m
echo [91m       Disk Number (HDD/SSD)
echo [97m===============================[93m
wmic diskdrive get serialnumber
echo [95m===============================[93m
echo [91m      Motherboard (Base Board)
echo [95m===============================[93m
wmic   baseboard get serialnumber
echo [92m===============================[93m
echo [91m        SMBios
echo [92m===============================[93m
wmic path win32_computersystemproduct get uuid
echo [94m===============================[93m
echo [91m         GPU (Graphics Card)
echo [94m===============================[93m
wmic PATH Win32_VideoController GET Description,PNPDeviceID
echo [95m===============================[93m
echo [91m         RAM (Random Access Memory)
echo [95m===============================[93m
wmic memorychip get partnumber, serialnumber
echo [96m===============================[93m
echo [91m         BIOS
echo [96m===============================[93m
wmic csproduct get uuid
echo [92m===============================[93m
echo [91m         CPU (Processor)
echo [92m===============================[93m
wmic cpu get processorid
echo [97m===============================[93m
echo [91m         Mac Address
echo [97m===============================[93m
getmac
echo [97m===============================[93m
echo [91m         System UUID
echo [97m===============================[93m
wmic path win32_computersystemproduct get uuid
wmic OS GET Caption,SerialNumber,CSName
pause
goto loop

:setESC
for /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & echo on & for %%b in (1) do rem"') do (
  set ESC=%%b
  exit /B 0
)
exit /B 0