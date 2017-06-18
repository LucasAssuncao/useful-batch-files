@echo off
echo.
echo ================================= >> .\TXT\GetWinKey.log
hostname >> .\TXT\GetWinKey.log
wmic path softwarelicensingservice get OA3xOriginalProductKey | tr -d "\r\n\b" | findrepl "         " " " >> .\TXT\GetWinKey.log