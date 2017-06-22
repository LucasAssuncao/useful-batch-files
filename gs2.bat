@echo off

set _SCRIPT_PATH=%~p0
set _SCRIPT_DRIVE=%~d0
set _SCRIPT_OUTFILE=%_SCRIPT_DRIVE%%_SCRIPT_PATH%TXT\pass.log


IF "%~1" == "--help" (
	echo Uso: gs2 [OPTION]
	echo Gera senhas aleatorias com letras e numeros

	echo Argumentos disponiveis para utilizacao:
	echo --help,  /? 			Exibe este texto de ajuda
	echo -all  ,  --show-all-passwords	Exibe a lista de todas as senhas geradas
	echo -last ,  --show-last-password	Exibe a ultima senha gerada
	goto eof
)

IF "%~1" == "/?" (
	echo Uso: gs2 [OPTION]
	echo Gera senhas aleatorias com letras e numeros

	echo Argumentos disponiveis para utilizacao:
	echo --help,  /? 			Exibe este texto de ajuda
	echo -all  ,  --show-all-passwords	Exibe a lista de todas as senhas geradas
	echo -last ,  --show-last-password	Exibe a ultima senha gerada
	goto eof
)

IF "%~1" == "--show-all-passwords" (
	type %_SCRIPT_OUTFILE% | more
	goto eof
)

IF "%~1" == "-all" (
	type %_SCRIPT_OUTFILE% | more
	goto eof
)

IF "%~1" == "--show-last-password" (
	tail -n 7 %_SCRIPT_OUTFILE%
	goto eof
)

IF "%~1" == "-last" (
	tail -n 7 %_SCRIPT_OUTFILE%
	goto eof
)

IF "%~1" == "" (
	goto init
)

:init
	cls

	echo +----------------------------------------------------+
	echo ^|     OBS: A Senha sera copiada automaticamente      ^|
	echo ^|            para a Area de Transferencia            ^|
	echo ^|                                                    ^|
	echo ^|  Caso haja duvidas, digite 'gs --help' ou 'gs /?'  ^|
	echo +----------------------------------------------------+
	echo.
	echo.
	echo +-----------------------------------+
	echo ^|  1) Gerar senha de 06 caracteres  ^|
	echo ^|  2) Gerar senha de 10 caracteres  ^|
	echo ^|  3) Gerar senha de 14 caracteres  ^|
	echo ^|  4) Quero escolher a quantidade   ^|
	echo +-----------------------------------+
	echo.

	set /p input= "Digite uma opcao: "

	if %input% equ 1 goto A else goto init
	if %input% equ 2 goto B else goto init
	if %input% equ 3 goto C else goto init
	if %input% equ 4 goto D else goto init

	:A
	set /a c = 6
	goto gerar

	:B
	set /a c = 10
	goto gerar

	:C
	set /a c = 14
	goto gerar

	:D
	set /p c= "Informe a quantidade de caracteres: "
	goto gerar

	:gerar
	set pass=
	set s=abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890
	set m=0
	goto loop

	:loop
	set /a n=%random% %% 62
	call set pass=%pass%%%s:~%n%,1%%
	set /a m=m+1
	if %m% neq %c% goto loop else goto ending

	:ending

	:: ======================================================
	For /F "tokens=1,2,3 delims=/ " %%A in ('Date /t') do @(
	    Set dia=%%A
	    Set mes=%%B
	    Set ano=%%C
	)

	for /F "tokens=1,2 delims=: " %%D in ('Time /t') do @(
	    set hora=%%D
	    set minuto=%%E
	)
	:: ======================================================

	echo =====================================>>%_SCRIPT_OUTFILE%
	echo.>>%_SCRIPT_OUTFILE%
	echo Senha gerada em: %dia%/%mes%/%ano% as %hora%:%minuto%>>%_SCRIPT_OUTFILE%
	echo Forca da senha: %c% caracteres>>%_SCRIPT_OUTFILE%
	echo Senha: %pass%>>%_SCRIPT_OUTFILE%
	echo.>>%_SCRIPT_OUTFILE%
	echo =====================================>>%_SCRIPT_OUTFILE%

	echo %pass%|clip
	echo Senha copiada para Area de Transferencia
	echo A senha tambem pode ser consultada no arquivo: %_SCRIPT_OUTFILE%
	goto eof

:eof