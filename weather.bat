@echo off

IF "%~1"=="/?" (
    :HELP
    REM  ECHO Exemplo 2: "%~NX0" LSERVER P4ssw0rd
    ECHO.
    ECHO Exibe a previsao do tempo.
    ECHO A fonte de consulta e o: http://wttr.in 
    ECHO.
    ECHO OBS: A maquina deve possuir conexao com a Internet 
    ECHO.
    ECHO Como Usar: weather [parametro]
    ECHO.

    ECHO -----------------------------------------------------

    ECHO Para previsao do tempo detalhada: 
    ECHO.
    ECHO Exemplo: hotspot -c
    ECHO          ou
    ECHO          hotspot --complete
    ECHO.

    ECHO -----------------------------------------------------

    ECHO Para previsao do tempo resumida:
    ECHO.
    ECHO Exemplo: hotspot -r
    ECHO          ou
    ECHO          hotspot --resumed    
    ECHO.

    ECHO -----------------------------------------------------
    
    EXIT /B

) ELSE ( 
    IF "%~1"=="-h" (
        goto HELP
    )
    
    IF "%~1"=="--help" (
        goto HELP
    )

    IF "%~1"=="-c" (  
	@powershell "$(Invoke-WebRequest http://wttr.in/Embu ).ParsedHtml.body.outerText
        GOTO eof
    )
    
    IF "%~1"=="--complete" (
	@powershell "$(Invoke-WebRequest http://wttr.in/Embu ).ParsedHtml.body.outerText
        GOTO eof
    )

    IF "%~1"=="-r" (
	@powershell "$(Invoke-WebRequest http://wttr.in/Embu ).ParsedHtml.body.outerText | Format-Table" | head -7	
        GOTO eof
    )

    IF "%~1"=="--resumed" (
	@powershell "$(Invoke-WebRequest http://wttr.in/Embu ).ParsedHtml.body.outerText | Format-Table" | head -7	
        GOTO eof
    )
	
    ECHO.
    powershell "Write-Host -ForegroundColor Red" Voce precisa passar um parametro
    powershell "Write-Host -ForegroundColor Red" Digite "/?" para verificar os parametros disponiveis
    ECHO.
)

:eof

