@echo off
:: Date: 08/06/2017
:: Author: Lucas Assunção da Silva

IF "%~1" == "" (
	ECHO.
	out C "You need to pass a parameter\n"
	out C "Example: iren filename\n"
	ECHO.
	GOTO eof
)

for /F "tokens=1,2,3 delims=/ " %%A in ('Date /t') do @(
    set dia=%%A
    set mes=%%B
    set ano=%%C
)

for /F "tokens=1,2 delims=: " %%D in ('Time /t') do @(
    set hora=%%D
    set minuto=%%E
)

ren "%1" "%~n1-%dia%-%mes%-%ano%_%hora%%minuto%%~x1"

:eof