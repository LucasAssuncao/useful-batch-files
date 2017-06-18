@echo off
:Start2
cls
goto Start

:Start

echo OBS: A Senha sera copiada automaticamente
echo          para a Área de Transferência

echo.
echo +-----------------------------------+
echo ^|  1) Gerar senha de 06 Caracteres  ^|
echo ^|  2) Gerar senha de 10 Caracteres  ^|
echo ^|  3) Gerar senha de 14 Caracteres  ^|
echo +-----------------------------------+
echo.

set /p input= Digite uma opção:

if %input% equ 1 goto A else goto Start2
if %input% equ 2 goto B else goto Start2
if %input% equ 3 goto C else goto Start2

:A
set /a c = 6
goto gerar

:B
set /a c = 10
goto gerar

:C
set /a c = 14
goto gerar

:gerar
set pas=
set s=abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890
set m=0
:loop
set /a n=%random% %% 62
call set pas=%pas%%%s:~%n%,1%%
set /a m=m+1
if not %m%==%c% goto loop:

REM =====================================================
For /F "tokens=1,2,3 delims=/ " %%A in ('Date /t') do @(
    Set dia=%%A
    Set mes=%%B
    Set ano=%%C)
REM =====================================================

echo =================================== >> C:\batch\TXT\pass.txt
echo. >> C:\batch\TXT\pass.txt
echo Senha gerada em: %dia%/%mes%/%ano% >> C:\batch\TXT\pass.txt
echo Força da senha: %c% Caracteres >> C:\batch\TXT\pass.txt
echo Senha: %pas% >> C:\batch\TXT\pass.txt
echo. >> C:\batch\TXT\pass.txt
echo =================================== >> C:\batch\TXT\pass.txt

echo %pas% | clip
echo Senha copiada para Área de Transferência
echo A senha também pode ser consultada no arquivo: C:\batch\TXT\pass.txt