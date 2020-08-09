@echo off
title Instalador do Cmdoska 9
goto install

:finishinsta
echo Finalizando a instalacao...
rmdir /s /q tmp > nul
attrib +h sys
attrib +h etc
attrib +h usr
goto instacomplete

:instacomplete
echo Instalacao completa, cmdoska ira entrar no seu cmdoska...
start cmdoska.bat
start cmd /c echo Apagando instalador em 3 segundos... ^&^& timeout /t 3 /nobreak ^> nul ^&^& del /s /q %0
exit /b 0

::Instalação do Cmdoska 9
:install

echo Bem-vindo ao instalador do cmdoska, primeiro iremos verifica a conexao com a internet
ping -n 2 -w 700 8.8.8.8 | find "bytes=" > nul
echo.
if %errorlevel% EQU 0 goto caninstall

cls
:uhoh
cls
echo Nao conectado a internet, instalador nao pode prosseguir
timeout /t 1 /nobreak > nul
goto uhoh

:caninstall
echo Existe uma conexao com a internet, prosseguindo...
echo Criando pasta temporaria...
mkdir tmp > nul

echo.

echo Baixando Echor ^(Modulo do Instalador^) de Insituito de Scripts...
bitsadmin /transfer echor /download /priority FOREGROUND http://new-sillyvision.glitch.me/echor.bat "%cd%\tmp\echor.bat" > nul

echo.

echo Criando pastas do importantes...
mkdir sys
mkdir etc
cd etc
mkdir services
mkdir sservices
cd ..

echo.

echo Fazendo arquivos...
cd sys
nul > autoexec.bat
echo Nao ligue nesse acesso negado, era so nul ^> autoexec.bat ^(Batch de gera arquivo^)
cd ..
cls

echo Preparando Arquivos...
mkdir usr
cd usr
mkdir bin
mkdir lib
cd ..
copy tmp\echor.bat usr\bin > nul

echo Baixando logo do boot...
bitsadmin /transfer echor /download /priority FOREGROUND http://new-sillyvision.glitch.me/cmdoska/boot_logo.txt "%cd%\boot_logo.txt" > nul

echo Baixando e Instalando GOPC... ^(1^/2^)

cls
echo Baixando e Instalando GPC... ^(2^/2^)

cls

echo Base do Cmdoska 9 instalado!

echo.
echo Deseja instalar a pasta home? ^(Pasta de usuarios^)
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo ^(1^/2^) ^[S^/N^]
choice /c "12" /n /m "->"
if %errorlevel%==1 (
	cls
	echo Preparando pra baixar Cmdoska 9 com suporte a usuarios...
	mkdir home
	cd home
	mkdir Default
	cd ..
	cls
	echo Baixando Cmdoska 9 com suporte a usuarios
	bitsadmin /transfer echor /download /priority FOREGROUND http://new-sillyvision.glitch.me/cmdoska/home "%cd%\cmdoska.bat" > nul
	goto finishinsta
)

if %errorlevel%==2 (
	cls
	echo Baixando Cmdoska 9...
	bitsadmin /transfer echor /download /priority FOREGROUND http://new-sillyvision.glitch.me/cmdoska/no "%cd%\cmdoska.bat" > nul
	goto finish insta
)
