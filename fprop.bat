@echo off
:: Date: 08/06/2017
:: Author: Lucas Assunção da Silva

IF "%~1" == "" (
	ECHO.
	out C "You need to pass a parameter\n"
	out C "Example: fprop filename\n"
	ECHO.
	out A "Try " C "fprop --help" A " or " C "fprop /?" A " for more information."
	GOTO eof
)

IF "%~1"=="/?" (
	ECHO.
	ECHO Utility to display file properties
	ECHO USAGE: fprop filename
	ECHO.
)

IF "%~1"=="--help" (
	ECHO.
	ECHO Utility to display file properties
	ECHO USAGE: fprop filename
	ECHO.
) ELSE (
	FOR %%? IN (%1) DO (
		ECHO File Name Only       : %%~n?
		ECHO File Extension       : %%~x?
		ECHO Name in 8.3 notation : %%~sn?
		ECHO File Attributes      : %%~a?
		ECHO Located on Drive     : %%~d?
		ECHO File Size            : %%~z?
		ECHO Last-Modified Date   : %%~t?
		ECHO Parent Folder        : %%~dp?
		ECHO Fully Qualified Path : %%~f?
		ECHO FQP in 8.3 notation  : %%~sf?
		ECHO Location in the PATH : %%~dp$PATH:?
	)
)

:eof