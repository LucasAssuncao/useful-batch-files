@echo off

set _SCRIPT_PATH=%~p0
set _SCRIPT_DRIVE=%~d0
set _SCRIPT_OUTFILE=%_SCRIPT_DRIVE%%_SCRIPT_PATH%TXT\GetWinKey.log

echo =====================================================>>%_SCRIPT_OUTFILE%
hostname>>%_SCRIPT_OUTFILE%
wmic path softwarelicensingservice get OA3xOriginalProductKey | tr -d "\r\n\b" | findrepl "         " " ">>%_SCRIPT_OUTFILE%
echo.>>%_SCRIPT_OUTFILE%