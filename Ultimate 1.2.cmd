@echo off  
:: BatchGotAdmin
:-------------------------------------
REM  --> Check for permissions
    IF "%PROCESSOR_ARCHITECTURE%" EQU "amd64" (
>nul 2>&1 "%SYSTEMROOT%\SysWOW64\cacls.exe" "%SYSTEMROOT%\SysWOW64\config\system"
) ELSE (
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
)

REM --> If error flag set, we do not have admin.
if '%errorlevel%' NEQ '0' (
    echo Requesting administrative privileges...
    goto UACPrompt
) else ( goto gotAdmin )

:UACPrompt
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    set params= %*
    echo UAC.ShellExecute "cmd.exe", "/c ""%~s0"" %params:"=""%", "", "runas", 1 >> "%temp%\getadmin.vbs"

    "%temp%\getadmin.vbs"
    del "%temp%\getadmin.vbs"
    exit /B

:gotAdmin
    pushd "%CD%"
    CD /D "%~dp0"

@echo off
title ULTIMATE Tool Suporte TI [Ver1.0] LuanSoftwares©
cls
:menu
mode con cols=75 lines=40
setlocal
call :setESC
color 07
cls
echo   %ESC%[93mULTIMATE Tool Suporte TI: [Versao 1.2] LuanSoftwares(c)©  %ESC%[0m
echo.
echo.
:::                   ___________________
:::                   | _______________ |               
:::                   | |XXXXmsdosXXXX| |
:::                   | |mount c c:\XX| |
:::                   | |c:XXXXXXXXXXX| |
:::                   | |c:cd d1mXXXXX| |
:::                   | |setupXXXXXXXX| |
:::                   |_________________|
:::                       _[_______]_
:::                   ___[___________]___
:::                  |         [_____] []|__
:::                  |         [_____] []|  \__
:::                  L___________________J     \ 
:::                   ___________________      /\
:::                  /###################\    (__)
:::
for /f "delims=: tokens=*" %%A in ('findstr /b ::: "%~f0"') do @echo(%%A
echo         %ESC%[36m1.%ESC%[0mAtivar e Colocar Senha Padrao do Administrador.
echo         %ESC%[36m2.%ESC%[0mDesativar o Perfil SESP.
echo         %ESC%[36m3.%ESC%[0mInstalar POP.
echo         %ESC%[36m4.%ESC%[0mLista de Programas do POP(Somente Leitura).
echo         %ESC%[36m5.%ESC%[0mIp Fixo SESP.
echo         %ESC%[36m6.%ESC%[0mIp Fixo SEJUDH.
echo         %ESC%[36m7.%ESC%[0mInstalar Aker(Somente SAJU,SEJUDH e FUNAC).
echo         %ESC%[36m8.%ESC%[0mLimpar pastas temporarias.
echo         %ESC%[36m9.%ESC%[0mVerificar CheckList de Formatacao(Somente Leitura).
echo         %ESC%[36m10.%ESC%[0mAtivar Windows 10(Somente Interno).
echo         %ESC%[36m11.%ESC%[0mVerificar Configuracoes e Informacoes do PC.
echo         %ESC%[36m12.%ESC%[0mVerificar Todos os Programas instalados no PC.
echo         %ESC%[36m13.%ESC%[0mInstalar Softwares pela internet(com chocolatey).
echo         %ESC%[36m14.%ESC%[0mFazer Pendrive Bootavel Windows 7 mini(quebrar senha).
echo         %ESC%[36m15.%ESC%[0mContato e Informacoes do Software.
echo.
echo        Computador: %computername%        Usuario: %username%
echo.
echo.     



set /p opcao= Escolha uma opcao: 
echo.
if %opcao% equ 1 goto opcao1
if %opcao% equ 2 goto opcao2
if %opcao% equ 3 goto opcao3
if %opcao% equ 4 goto opcao4
if %opcao% equ 5 goto opcao5
if %opcao% equ 6 goto opcao6
if %opcao% equ 7 goto opcao7
if %opcao% equ 8 goto opcao8
if %opcao% equ 9 goto opcao9
if %opcao% equ 10 goto opcao10
if %opcao% equ 11 goto opcao11
if %opcao% equ 12 goto opcao12
if %opcao% equ 13 goto opcao13
if %opcao% equ 14 goto opcao14
if %opcao% equ 15 goto opcao15
if %opcao% GEQ 16 goto opcao16



:opcao1
cls
echo.
echo    %ESC%[42mAtivando Perfil de Administrador%ESC%[0m
echo.
net user administrador /active:yes && goto erromsg5 || goto erromsg4
echo.
pause
goto menu


:erromsg5
echo  %ESC%[42mAtivado Perfil de Admin com sucesso%ESC%[0m
echo.
net user administrador * && goto erromsg3 || goto erromsg4
pause
goto menu

:erromsg3
echo  %ESC%[42mSenha Cadastrada com sucesso%ESC%[0m
echo.
pause
goto menu

:erromsg4
echo  %ESC%[41malguma coisa deu errado(contate o Desenvolvedor)%ESC%[0m
echo.
pause
goto menu


:opcao2
cls
echo.
SET /P PERFIL= Digite o nome do perfil ex(Sesp):
net user %PERFIL% /active:no && goto erromsg1 || goto erromsg2
echo.
pause 
goto menu

:erromsg1 
echo  %ESC%[42mPerfil Desativado Com Sucesso.%ESC%[0m
echo.
pause
goto menu

:erromsg2
echo  %ESC%[41mPerfil nao foi desativado (possivelmente nome perfil errado)%ESC%[0m
echo.
pause
goto menu


:opcao3
cls
echo.
echo.
echo.
echo         %ESC%[36m1.%ESC%[0mPOP SESP INTERNO
echo         %ESC%[36m2.%ESC%[0mPOP SESP SEM LibreOffice
echo         %ESC%[36m3.%ESC%[0mPOP SESP EXTERNO
echo         %ESC%[36m4.%ESC%[0mPOP POP INTERNO SEAP.    
echo                                                   5.Sair.
choice /C 12345 /N /M "Escolha:"
if errorlevel 5 goto :POPSAIR
if errorlevel 4 goto :POPSEAP
if errorlevel 3 goto :POPE
if errorlevel 2 goto :POPISL
if errorlevel 1 goto :POPI

:POPSAIR
goto menu


:POPI
cls
echo.
==================================================================
echo   Instalando Adobe Reader                (passo 1 de 9)
==================================================================
start /wait msiexec /i "%~dp0\adobe\AcroRead.msi" /qn 

echo.
==================================================================
echo   Instalando Google Chrome               (passo 2 de 9)
================================================================== 

start /wait msiexec /i "%~dp0\chrome\GoogleChromeStandaloneEnterprise64.msi" /qn

echo.
==================================================================
echo   Instalando Mozilla Firefox             (passo 3 de 9)
==================================================================

start /wait msiexec /i "%~dp0\firefox\Firefox Setup 73.0.1.msi" /qn 

echo.
==================================================================
echo   Instalando java 32 e 64bits            (passo 4 de 9)
==================================================================

start /wait %~dp0/java/jre-8u241-windows-x64.exe /s INSTALLDIR=C:\java\jre64
start /wait %~dp0/java/jre-8u241-windows-i586.exe /s INSTALLDIR=C:\java\jre86


echo.
==================================================================
echo   Instalando pdfsam-v3                   (passo 5 de 9)
==================================================================

start /wait msiexec /i "%~dp0\pdfsam\pdfsam-v3.3.0.msi" /qn 

echo.
==================================================================
echo   Instalando libreoffice com HelpPack    (passo 6 de 9)
==================================================================
If not exist C:\install\logs\ md C:\install\logs\
start /wait %~dp0\libreoffice\LibreOffice_6.3.5_Win_x64.msi /qn ALLUSERS=1 CREATEDESKTOPLINK=1 REGISTER_ALL_MSO_TYPES=0 REGISTER_NO_MSO_TYPES=1 ISCHECKFORPRODUCTUPDATES=0 QUICKSTART=0 ADDLOCAL=ALL UI_LANGS=pt_BR 
start /wait %~dp0\libreoffice\LibreOffice_6.3.5_Win_x64_helppack_pt-BR.msi /qn ALLUSERS=1 CREATEDESKTOPLINK=1 REGISTER_ALL_MSO_TYPES=0 REGISTER_NO_MSO_TYPES=1 ISCHECKFORPRODUCTUPDATES=0 QUICKSTART=0 ADDLOCAL=ALL UI_LANGS=pt_BR 

echo.
==================================================================
echo   Instalando 7-ZIP                       (passo 7 de 9)   
==================================================================
start /wait msiexec /i "%~dp0\7-zip\7z1900-x64.msi" /qn 

echo.
==================================================================
echo   Instalando TeamViewer10host            (passo 8 de 9)  
==================================================================
start /wait msiexec /i "%~dp0\teamviewer\TeamViewer_Host-idc2vgck97.msi" /qn 

regedit /s "%~dp0\teamviewer\TeamViewer_Settings.reg"


echo.
==================================================================
echo   instalando  Antivirus kaspersky        (passo 9 de 9)
==================================================================
"%~dp0\kaspersky\installer.exe"

echo.
==================================================================
echo   concluido
==================================================================

pause
goto menu


:POPE
cls
echo.
==================================================================
echo   Instalando Adobe Reader                 (passo 1 de 8)
==================================================================
start /wait msiexec /i "%~dp0\adobe\AcroRead.msi" /qn 

echo.
==================================================================
echo   Instalando Google Chrome               (passo 2 de 8)
================================================================== 

start /wait msiexec /i "%~dp0\chrome\GoogleChromeStandaloneEnterprise64.msi" /qn

echo.
==================================================================
echo   Instalando Mozilla Firefox             (passo 3 de 8)
==================================================================

start /wait msiexec /i "%~dp0\firefox\Firefox Setup 73.0.1.msi" /qn 

echo.
==================================================================
echo   Instalando java 32 e 64bits            (passo 4 de 9)
==================================================================

start /wait %~dp0/java/jre-8u241-windows-x64.exe /s INSTALLDIR=C:\java\jre64
start /wait %~dp0/java/jre-8u241-windows-i586.exe /s INSTALLDIR=C:\java\jre86

echo.
==================================================================
echo   Instalando pdfsam-v3                   (passo 5 de 8)
==================================================================

start /wait msiexec /i "%~dp0\pdfsam\pdfsam-v3.3.0.msi" /qn 

echo.
==================================================================
echo   Instalando libreoffice com HelpPack    (passo 6 de 9)
==================================================================
If not exist C:\install\logs\ md C:\install\logs\
start /wait %~dp0\libreoffice\LibreOffice_6.3.5_Win_x64.msi /qn ALLUSERS=1 CREATEDESKTOPLINK=1 REGISTER_ALL_MSO_TYPES=0 REGISTER_NO_MSO_TYPES=1 ISCHECKFORPRODUCTUPDATES=0 QUICKSTART=0 ADDLOCAL=ALL UI_LANGS=pt_BR 
start /wait %~dp0\libreoffice\LibreOffice_6.3.5_Win_x64_helppack_pt-BR.msi /qn ALLUSERS=1 CREATEDESKTOPLINK=1 REGISTER_ALL_MSO_TYPES=0 REGISTER_NO_MSO_TYPES=1 ISCHECKFORPRODUCTUPDATES=0 QUICKSTART=0 ADDLOCAL=ALL UI_LANGS=pt_BR 

echo.
==================================================================
echo   Instalando 7-ZIP                       (passo 7 de 8)   
==================================================================
start /wait msiexec /i "%~dp0\7-zip\7z1900-x64.msi" /qn 

echo.
==================================================================
echo   Instalando TeamViewer10host            (passo 8 de 8)   
==================================================================
start /wait msiexec /i "%~dp0\TeamviwerExterno\TeamViewer_Host-idc2vgck97.msi" /qn 

regedit /s "%~dp0\TeamviwerExterno\TeamViewer_Settings.reg" 

echo.
==================================================================
echo   Concluido!!! 
==================================================================
pause
goto menu


:POPISL
cls
echo.
==================================================================
echo   Instalando Adobe Reader             (passo 1 de 8)
==================================================================
start /wait msiexec /i "%~dp0\adobe\AcroRead.msi" /qn 

echo.
==================================================================
echo   Instalando Google Chrome            (passo 2 de 8)
================================================================== 

start /wait msiexec /i "%~dp0\chrome\GoogleChromeStandaloneEnterprise64.msi" /qn

echo.
==================================================================
echo   Instalando Mozilla Firefox          (passo 3 de 8)
==================================================================

start /wait msiexec /i "%~dp0\firefox\Firefox Setup 73.0.1.msi" /qn 

echo.
==================================================================
echo   Instalando java 32 e 64bits         (passo 4 de 8)
==================================================================

start /wait %~dp0/java/jre-8u241-windows-x64.exe /s INSTALLDIR=C:\java\jre64
start /wait %~dp0/java/jre-8u241-windows-i586.exe /s INSTALLDIR=C:\java\jre86

echo.
==================================================================
echo   Instalando pdfsam-v3                (passo 5 de 8)
==================================================================

start /wait msiexec /i "%~dp0\pdfsam\pdfsam-v3.3.0.msi" /qn 

echo.
==================================================================
echo   Instalando 7-ZIP                    (passo 6 de 8)   
==================================================================
start /wait msiexec /i "%~dp0\7-zip\7z1900-x64.msi" /qn 

echo.
==================================================================
echo   Instalando TeamViewer10host            (passo 7 de 8)  
==================================================================
start /wait msiexec /i "%~dp0\teamviewer\TeamViewer_Host-idc2vgck97.msi" /qn 

regedit /s "%~dp0\teamviewer\TeamViewer_Settings.reg"

echo.
==================================================================
echo   instalando  Antivirus kaspersky        (passo 8 de 8)
==================================================================
"%~dp0\kaspersky\installer.exe"

echo.
==================================================================
echo   Concluido!!! 
==================================================================
pause
goto menu

:POPSEAP
cls
echo.
==================================================================
echo   Instalando Adobe Reader              (passo 1 de 8)
==================================================================
start /wait msiexec /i "%~dp0\adobe\AcroRead.msi" /qn 

echo.
==================================================================
echo   Instalando Google Chrome             (passo 2 de 8)
================================================================== 

start /wait msiexec /i "%~dp0\chrome\GoogleChromeStandaloneEnterprise64.msi" /qn

echo.
==================================================================
echo   Instalando Mozilla Firefox           (passo 3 de 8)
==================================================================

start /wait msiexec /i "%~dp0\firefox\Firefox Setup 73.0.1.msi" /qn 

echo.
==================================================================
echo   Instalando java 32 e 64bits          (passo 4 de 9)
==================================================================

start /wait %~dp0/java/jre-8u66-windows-i586-SEAP.exe /s INSTALLDIR=C:\java\jre64
start /wait %~dp0/java/jre-8u66-windows-x64-SEAP.exe /s INSTALLDIR=C:\java\jre86

echo.
==================================================================
echo   Instalando pdfsam-v3                 (passo 5 de 8)
==================================================================

start /wait msiexec /i "%~dp0\pdfsam\pdfsam-v3.3.0.msi" /qn 

echo.
==================================================================
echo   Instalando libreoffice com HelpPack  (passo 6 de 9)
==================================================================
If not exist C:\install\logs\ md C:\install\logs\
start /wait %~dp0\libreoffice\LibreOffice_6.3.5_Win_x64.msi /qn ALLUSERS=1 CREATEDESKTOPLINK=1 REGISTER_ALL_MSO_TYPES=0 REGISTER_NO_MSO_TYPES=1 ISCHECKFORPRODUCTUPDATES=0 QUICKSTART=0 ADDLOCAL=ALL UI_LANGS=pt_BR 
start /wait %~dp0\libreoffice\LibreOffice_6.3.5_Win_x64_helppack_pt-BR.msi /qn ALLUSERS=1 CREATEDESKTOPLINK=1 REGISTER_ALL_MSO_TYPES=0 REGISTER_NO_MSO_TYPES=1 ISCHECKFORPRODUCTUPDATES=0 QUICKSTART=0 ADDLOCAL=ALL UI_LANGS=pt_BR 

echo.
==================================================================
echo   Instalando 7-ZIP                     (passo 7 de 8)   
==================================================================
start /wait msiexec /i "%~dp0\7-zip\7z1900-x64.msi" /qn 

echo.
==================================================================
echo   Instalando TeamViewer10host          (passo 8 de 9)  
==================================================================
start /wait msiexec /i "%~dp0\teamviewer\TeamViewer_Host-idc2vgck97.msi" /qn 

regedit /s "%~dp0\teamviewer\TeamViewer_Settings.reg"

echo.
==================================================================
echo   instalando  Antivirus kaspersky      (passo 9 de 9)
==================================================================
"%~dp0\kaspersky\installer.exe"

echo.
==================================================================
echo   Concluido!!! 
==================================================================
pause
goto menu


:opcao4
echo ----------------------------------------------
echo # Adobe Reader 11.0.23                       #
echo # Google Chrome Stand alone Enterprise       #
echo # Mozilla Firefox 73.0.1                     #
echo # jre-8u241-windows-x64                      #
echo # jre-8u241-windows-i586                     #
echo # jre-8u66-windows-x64-SEAP                  #
echo # jre-8u66-windows-i586-SEAP                 #
echo # 7-ZIP 19.00  (similar ao Winrar)           #
echo # LibreOffice_6.3.5 com help pack            #
echo # Team Viewer 10 host e Script               #
echo # Kaspersky (popsesp)                        #
echo ---------------------------------------------- 
pause
goto menu

:opcao5
@echo off
set INTERFACE=Ethernet
set IP=172.17.0.248
set MASCARA=255.255.252.0
set GATEWAY=172.17.0.1
set DNS=172.16.5.100
set DNS2=172.16.5.240
:CONFIRMAR
rem opções
choice /C FAC /M "Pressione: [F]ixo, [A]utomatico ou [C]ancelar"
IF errorlevel=3 goto FIM
IF errorlevel=2 goto AUTOMATICO
IF errorlevel=1 goto FIXO
goto CONFIRMAR
:FIXO
 netsh interface ip set address name="%INTERFACE%" static %IP% %MASCARA% %GATEWAY% 1
 netsh interface ip set dnsservers name="%INTERFACE%" static %DNS% primary no
 netsh intERFACE ip set dnsservers name="%INTERFACE%" static %DNS2% index=2 
 goto :FIM
:AUTOMATICO
 netsh interface ip set address name="%INTERFACE%" dhcp
 netsh interface ip set dnsservers name="%INTERFACE%" dhcp
 goto :FIM
:FIM
goto menu




:opcao6
@echo off
set INTERFACE=Ethernet
set IP=10.23.1.101
set MASCARA=255.255.0.0
set GATEWAY=10.23.9.11
set DNS=10.23.1.10
set DNS2=10.23.6.10
:CONFIRMAR
rem opções
choice /C FAC /M "Pressione: [F]ixo, [A]utomatico ou [C]ancelar"
IF errorlevel=3 goto FIM
IF errorlevel=2 goto AUTOMATICO
IF errorlevel=1 goto FIXO
goto CONFIRMAR
:FIXO
 netsh interface ip set address name="%INTERFACE%" static %IP% %MASCARA% %GATEWAY% 1
 netsh interface ip set dnsservers name="%INTERFACE%" static %DNS% primary no
 netsh intERFACE ip set dnsservers name="%INTERFACE%" static %DNS2% index=2 
 goto :FIM
:AUTOMATICO
 netsh interface ip set address name="%INTERFACE%" dhcp
 netsh interface ip set dnsservers name="%INTERFACE%" dhcp
 goto :FIM
:FIM
goto menu

:opcao7
msiexec /i "%~dp0\aker\akerclient-2.0.8-pt-win64-install-0005.msi"
goto menu



:opcao8
cls
cleanmgr.exe /sagerun:n && goto erromsg6 || goto erromsg9

:erromsg6
echo.
echo   %ESC%[42mLimpado Arquivos Temporarios da internet.%ESC%[0m
del /s /f /q C:\Windows\Temp\*.* && goto erromsg7 || goto erromsg9


:erromsg7
echo.
echo   %ESC%[42mLimpado Arquivos Temporarios do Sistema.%ESC%[0m
del /f /q C:\Users\%username%\AppData\Local\temp && goto erromsg8|| goto erromsg9


:erromsg8
echo.
echo   %ESC%[42mLimpado Arquivos Temporarios do Usuario.%ESC%[0m
pause
goto menu

:erromsg9
echo.
echo   ESC%[41m Deu Algo errado nao esta certo %ESC%[0m
pause
goto menu


:opcao9
mode 110,55
color 70
echo =====================================================================================
echo *
echo * 0 verificar o nome do computador antes de formatar 
echo *   e verificar se tem backup (EXTREMA IMPORTANCIA)
echo * 
echo * 1 ativar administrador e colocar a senha de Administrador
echo * 2 instalar programas padrao:
echo *   adobe reader e sua atualizacao
echo *   chrome(deixar navegador padrao)
echo *   java
echo *  
echo *   libreoffice
echo *   office(se tiver licenca)
echo *   teamviewer HOST (externo com script)
echo *   winrar
echo *
echo * 3 colocar nome da maquina e colocar maquina no dominio
echo *   atalho: windows+ pausebreak
echo *   dominio sesp: seguranca.local
echo *   e trocar nome da maquina
echo *
echo * 4 instalar programas que precisam da internet
echo *   firefox
echo *   instalar kaspersky mais atualizado
echo *
echo * 5 instalar drivers(precisa de internet)
echo *   usar programa DRIVER BOOSTER(desabilitar opcao de instalar o opera) ou
echo *   ir no gerenciador de dispositivos(atalho: windows + pausebreak) e atualizar os driver 
echo *
echo * 6 ativar o windows
echo *   abrir a pasta (Windows.10.Digital.Activation.CMD)
echo *   iniciar o arquivo (Windows_10_Digital_Activation)
echo *   clicar numero 1 para ativar.
echo *   clicar numero 2 para ver se ativou. verifica msg (A maquina esta ativada permanentemente.)
echo *
echo * 7 voltar o backup para o disco local (C);
echo *
echo *
echo *
echo *   obs: caso seja necessario fazer uma limpeza fisica.
echo *
echo *   como fazer mapeamento de pasta compartilhada:
echo *
echo *   1 abrir executar e digitar \\saens-nas
echo *   2 abrir o cmd e digitar start \\saens-nas
echo *   3 clica na pasta solicitada e com botao direito e seleciona conectar
echo *    
echo * 
echo *
echo *   como mapear impressora em rede: 
echo *
echo *   1 abrir executar e digitar \\ssp-srv-prt2
echo *   2 abrir o cmd e digitar start \\ssp-srv-prt2
echo *   3 clica na impressora  solicitada e com botao direito e seleciona conectar
echo *
echo ==============================================
pause
goto menu





:opcao10
@echo off
fltmc >nul 2>&1 || (
  echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\GetAdmin.vbs"
  echo UAC.ShellExecute "%~fs0", "", "", "runas", 1 >> "%temp%\GetAdmin.vbs"
  cmd /u /c type "%temp%\GetAdmin.vbs">"%temp%\GetAdminUnicode.vbs"
  cscript //nologo "%temp%\GetAdminUnicode.vbs"
  del /f /q "%temp%\GetAdmin.vbs" >nul 2>&1
  del /f /q "%temp%\GetAdminUnicode.vbs" >nul 2>&1
  exit
)
mode con cols=70 lines=37
color 
title Ativacao do Windows 10 (SESP)
::===========================================================================
setlocal enabledelayedexpansion
setlocal EnableExtensions
pushd "%~dp0"
cd /d "%~dp0"
:MAINMENU
echo.  :================================================================:
echo.
Echo.    [1] Ativar Windows 10 com Licenca Digital 
Echo.
Echo.    [2] Checar Status de Ativacao do Windows 
echo.    
Echo.    [3] Sair
echo.
echo.  :================================================================:
choice /C:123 /N /M "ESCOLHA : "
if errorlevel 3 goto :Sair
if errorlevel 2 goto :Check
if errorlevel 1 goto :HWIDActivate

::===========================================================================

:Sair
goto menu
::===========================================================================
:HWIDActivate
set slp=SoftwareLicensingProduct
set sps=SoftwareLicensingService
FOR /F "tokens=3" %%I IN ('reg query "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" ^| findstr CurrentVersion ^| findstr REG_SZ') DO (SET winver=%%I)
for /f "tokens=2* delims= " %%a in ('reg query "HKLM\System\CurrentControlSet\Control\Session Manager\Environment" /v "PROCESSOR_ARCHITECTURE"') do if "%%b"=="AMD64" (set vera=x64) else (set vera=x86)
for /f "tokens=2 delims== " %%A in ('"wmic path %slp% where (Name LIKE '%%Windows%%' and PartialProductKey is not null) get LicenseStatus /format:list"') do set status=%%A
for /f "tokens=2 delims=, " %%A in ('"wmic path %slp% where (Name LIKE '%%Windows%%' and LicenseStatus='%status%') get name /value"') do set osedition=%%A

if not exist "bin" md "bin"
set "gatherosstate=bin\%vera%\gatherosstate.exe"
set "slc=bin\%vera%\slc.dll"
::===============================================================================================================
:GenerateHWIDA
cd /d "%~dp0"
cls
call :Header "WINDOWS 10 DIGITAL LICENSE [Windows 10 %osedition% %vera%]"
echo:
if [%osedition%] == [Cloud] (
    set "edition=Cloud"
    set "key=V3WVW-N2PV2-CGWC3-34QGF-VMJ2C"
    set "sku=178"
    set "editionId=X21-32983"
    goto :parseAndPatch
)
if [%osedition%] == [CloudN] (
    set "edition=CloudN"
    set "key=NH9J3-68WK7-6FB93-4K3DF-DJ4F6"
    set "sku=179"
    set "editionId=X21-32987"
    goto :parseAndPatch
)
if [%osedition%] == [Core] (
    set "edition=Core"
    set "key=YTMG3-N6DKC-DKB77-7M9GH-8HVX7"
    set "sku=101"
    set "editionId=X19-98868"
    goto :parseAndPatch
)
if [%osedition%] == [CoreCountrySpecific] (
    set "edition=CoreCountrySpecific"
    set "key=N2434-X9D7W-8PF6X-8DV9T-8TYMD"
    set "sku=99"
    set "editionId=X19-99652"
    goto :parseAndPatch
)
if [%osedition%] == [CoreN] (
    set "edition=CoreN"
    set "key=4CPRK-NM3K3-X6XXQ-RXX86-WXCHW"
    set "sku=98"
    set "editionId=X19-98877"
    goto :parseAndPatch
)
if [%osedition%] == [CoreSingleLanguage] (
    set "edition=CoreSingleLanguage"
    set "key=BT79Q-G7N6G-PGBYW-4YWX6-6F4BT"
    set "sku=100"
    set "editionId=X19-99661"
    goto :parseAndPatch
)
if [%osedition%] == [Education] (
    set "edition=Education"
    set "key=YNMGQ-8RYV3-4PGQ3-C8XTP-7CFBY"
    set "sku=121"
    set "editionId=X19-98886"
    goto :parseAndPatch
)
if [%osedition%] == [EducationN] (
    set "edition=EducationN"
    set "key=84NGF-MHBT6-FXBX8-QWJK7-DRR8H"
    set "sku=122"
    set "editionId=X19-98892"
    goto :parseAndPatch
)
if [%osedition%] == [Enterprise] (
    set "edition=Enterprise"
    set "key=XGVPP-NMH47-7TTHJ-W3FW7-8HV2C"
    set "sku=4"
    set "editionId=X19-99683"
    goto :parseAndPatch
)
if [%osedition%] == [EnterpriseN] (
    set "edition=EnterpriseN"
  set "key=WGGHN-J84D6-QYCPR-T7PJ7-X766F"
    set "sku=27"
    set "editionId=X19-98746"
    goto :parseAndPatch
)
if [%osedition%] == [EnterpriseS] (
    set "edition=EnterpriseS"
    set "key=NK96Y-D9CD8-W44CQ-R8YTK-DYJWX"
    set "sku=125"
    set "editionId=X21-05035"
    goto :parseAndPatch
)
if [%osedition%] == [EnterpriseSN] (
    set "edition=EnterpriseSN"
    set "key=RW7WN-FMT44-KRGBK-G44WK-QV7YK"
    set "sku=126"
    set "editionId=X21-04921"
    goto :parseAndPatch
)
if [%osedition%] == [Professional] (
    set "edition=Professional"
    set "key=VK7JG-NPHTM-C97JM-9MPGT-3V66T"
    set "sku=48"
    set "editionId=X19-98841"
    goto :parseAndPatch
)
if [%osedition%] == [ProfessionalEducation] (
    set "edition=ProfessionalEducation"
    set "key=8PTT6-RNW4C-6V7J2-C2D3X-MHBPB"
    set "sku=164"
    set "editionId=X21-04955"
    goto :parseAndPatch
)
if [%osedition%] == [ProfessionalEducationN] (
    set "edition=ProfessionalEducationN"
    set "key=GJTYN-HDMQY-FRR76-HVGC7-QPF8P"
    set "sku=165"
    set "editionId=X21-04956"
    goto :parseAndPatch
)
if [%osedition%] == [ProfessionalN] (
    set "edition=ProfessionalN"
    set "key=2B87N-8KFHP-DKV6R-Y2C8J-PKCKT"
    set "sku=49"
    set "editionId=X19-98859"
    goto :parseAndPatch
)
if [%osedition%] == [ProfessionalWorkstation] (
    set "edition=ProfessionalWorkstation"
    set "key=DXG7C-N36C4-C4HTG-X4T3X-2YV77"
    set "sku=161"
    set "editionId=X21-43626"
    goto :parseAndPatch
)
if [%osedition%] == [ProfessionalWorkstationN] (
    set "edition=ProfessionalWorkstationN"
    set "key=WYPNQ-8C467-V2W6J-TX4WX-WT2RQ"
    set "sku=162"
    set "editionId=X21-43644"
    goto :parseAndPatch
)
if [%osedition%] == [ServerRdsh] (
    set "edition=ServerRdsh"
    set "key=NJCF7-PW8QT-3324D-688JX-2YV66"
    set "sku=175"
    set "editionId=X21-41295"
    goto :parseAndPatch
)
::===============================================================================================================
:parseAndPatch
cls
mode con cols=97 lines=15
call :Header "WINDOWS 10 DIGITAL LICENSE [Windows 10 %osedition% %vera%]"
echo Files are being prepared...
if not exist %gatherosstate% (
    call :Footer
    echo gatherosstate.exe not found. Enter ISO drive letter to copy.
    call :Footer
    set /p ogspath=Enter drive letter : ^>
    xcopy "!ogspath!:\sources\gatherosstate.exe" /s ".\bin" /Q /Y >nul 2>&1
)
set "ps=bin\
if [%osedition%] == [EnterpriseN] (
    set "ps=bin\entn.ps1"
    xcopy "!ps!" /s ".\bin" /Q /Y >nul 2>&1
    cd /d "bin"
    set "ps=entn.ps1"
    for /f "tokens=*" %%a in ('powershell -executionpolicy bypass -File !ps!') do set "key=%%a"
    if exist "!ps!" del /s /q "!ps!" >nul 2>&1
)
if [%osedition%] == [EnterpriseSN] (
    set "ps=bin\entsn.ps1"
    xcopy "!ps!" /s ".\bin" /Q /Y >nul 2>&1
    cd /d "bin"
    set "ps=entsn.ps1"
    for /f "tokens=*" %%a in ('powershell -executionpolicy bypass -File !ps!') do set "key=%%a"
    if exist "!ps!" del /s /q "!ps!" >nul 2>&1
)
call :Footer
cls
mode con cols=97 lines=48
call :Header "WINDOWS 10 DIGITAL LICENSE [Windows 10 %osedition% %vera%]"
echo Creating registry entries...
reg add "HKLM\SYSTEM\Tokens" /v "Channel" /t REG_SZ /d "Retail" /f
reg add "HKLM\SYSTEM\Tokens\Kernel" /v "Kernel-ProductInfo" /t REG_DWORD /d %sku% /f
reg add "HKLM\SYSTEM\Tokens\Kernel" /v "Security-SPP-GenuineLocalStatus" /t REG_DWORD /d 1 /f
call :Footer
echo  Default product key is installing for Windows 10 %edition% %vera%...
echo:
cscript /nologo %windir%\system32\slmgr.vbs -ipk %key%
call :Footer
echo Create GenuineTicket.XML file for Windows 10 %edition% %vera%...
start /wait "" "%gatherosstate%"
timeout /t 3 >nul 2>&1
call :Footer
echo GenuineTicket.XML file is installing for Windows 10 %edition% %vera%...
echo:
clipup -v -o -altto bin\%vera%\
call :Footer
echo Windows 10 %edition% %vera% activating...
echo:
cscript /nologo %windir%\system32\slmgr.vbs -ato
call :Footer
echo Deleting registry entries...
reg delete "HKLM\SYSTEM\Tokens" /f
call :Footer
echo Pressione qualquer tecla para continuar...
pause >nul
CLS
mode con cols=60 lines=25
goto:MainMenu
::===============================================================================================================
:Header
echo.
echo %~1
echo.
echo:
goto:eof
::===============================================================================================================
:Footer
echo:
echo.
echo:
goto:eof
::===============================================================================================================
: HWIDA_EXIT
CLS
GOTO MAINMENU
::===============================================================================================================
:Check
cd /d "%~dp0" && ( if exist "%temp%\getadmin.vbs" del "%temp%\getadmin.vbs" ) && fsutil dirty query %systemdrive% 1>nul 2>nul || (  cmd /u /c echo Set UAC = CreateObject^("Shell.Application"^) : UAC.ShellExecute "cmd.exe", "/k cd ""%~sdp0"" && ""%~s0""", "", "runas", 1 >> "%temp%\getadmin.vbs" && "%temp%\getadmin.vbs" && exit /B )
CLS
mode con cols=70 lines=40
ECHO ************************************************************
ECHO ***                   Windows Status                     ***
ECHO ************************************************************
cscript //nologo %systemroot%\System32\slmgr.vbs /dli
cscript //nologo %systemroot%\System32\slmgr.vbs /xpr
ECHO ____________________________________________________________
)
echo.
echo Pressione qualquer tecla para continuar...
pause >nul
CLS
mode con cols=60 lines=25
GOTO MAINMENU
::===============================================================================================================
goto menu

:opcao11
mode 110,55
systeminfo
pause
goto menu

:opcao12
mode 110,55
wmic product get name
pause
goto menu

:opcao13
ECHO OFF 
mode 110,50
echo [A] Instalar a Aplicacao Chocolatey(precisa reiniciar o pc).
echo.
echo [B] ja possuo o chocolatey e quero instalar um novo software(ex: Choco install adobereader).
echo entre no site para verificar todos os pacotes possiveis de instalacao (https://chocolatey.org/packages)
echo.
echo [C] Voltar ao Menu Principal.
echo.
choice /C ABC /N /M "Escolha:"
if errorlevel 3 goto :CHOCOSAIR
if errorlevel 2 goto :CHOCOINSTALL
if errorlevel 1 goto :CHOCO
::==============================================================================================================
:CHOCOINSTALL
cls
mode 70,37
cmd.exe
goto menu
::===============================================================================================================
:CHOCO
@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "[System.Net.ServicePointManager]::SecurityProtocol = 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))" && SET "PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin"
goto menu
::===============================================================================================================
:CHOCOSAIR
goto menu

:opcao14
echo Sera necessario um Pendrive que podera ser formatado!!
echo Deseja continuar?
choice /C SN /N /M " [S] SIM  [N]NAO  Escolha:"
if errorlevel 2 goto :bootoff
if errorlevel 1 goto :booton

:booton
echo (ATENCAO!!! esse comando vai formatar o Pendrive em NTFS)
SET /P USB= Digite e letra do Diretorio USB (C:, D:, E: etc):
format %USB%: /FS:NTFS /X /Q
XCOPY %~dp0\miniwin7 "%USB%:\" /c /g /d /i /e /h /-y
echo %ESC%[42mpendrive Bootavel criado com sucesso.%ESC%[0m
pause
goto menu

:bootoff
goto menu

:opcao15
echo off
echo ==============================================
echo * Para Duvidas e Sugestoes segue o contato:  *
echo * Email:luanrodriguesleite@gmail.com         *
echo * Versao: 1.0                                *
echo * Codename:KnightRider                       *
echo * Desenvolvedor: Luan Rodrigues Leite        *
echo * Colaborador e Beta tester:Marcelo Moreira  *
echo * Agradecimentos: Douglas Graciani           *
echo ==============================================
choice /C AB /N /M " [A] Voltar  [B]EasterEgg  Escolha:"
if errorlevel 2 goto :SENHAS
if errorlevel 1 goto :MENUP
::===========================================================================
:MENUP 
goto menu
::===========================================================================
:SENHAS

set Password2=KnightRider
set Password3=knightrider
set Password4=matrix
set Password5=snake
set Password6=msdos
set Password7=MSDOS
goto CHECK

:CHECK
echo EasterEgg
set /p pass="Password=> "
if %pass%==%Password2% goto OPEN2
if %pass%==%Password3% goto OPEN2
if %pass%==%Password4% goto OPEN4
if %pass%==%Password5% goto OPEN5
if %pass%==%Password6% goto OPEN6
if %pass%==%Password7% goto OPEN6
If NOT %pass%==%Password2%%Password3%%Password4%%Password5%%Password6%%Password7% goto FAIL
goto END

:OPEN6
XCOPY %~dp0\msdos C:\ /c /g /d /i /e /h /-y

"%~dp0\dosbox\DOSBox.exe"
goto menu



:OPEN5
start %~dp0/dosbox\snake.cmd
goto menu
:FAIL
echo.
echo.
echo         %ESC%[41mERROU IRMAO%ESC%[0m
pause
goto opcao15

:OPEN4
echo       Tome a Pilula AZUL volte a vida para o normal.
echo       Tome a Pilula VERMELHA e entre na MATRIX.
choice /C AV /N /M "          [A]AZUL  [V]VERMELHA  Escolha:"
if errorlevel 2 goto :VERMELHA
if errorlevel 1 goto :AZUL

:AZUL
goto menu

:VERMELHA
@echo off
:a
color 2
echo 1 1 1 0 1 0 0 0 1 1 1 1 0 0 0 1 1 0 0 1 0 0 0 1 1 0 1 0 1 0 0 0 1 1 1 1
ping localhost -n 1 > nul
echo 1 1 0 1 1 1 0 0 0 1 0 1 0 1 2 0 0 0 1 0 1 1 0 0 1 1 1 0 0 1 0 1 0 0 1 1 0
echo 1 0 0 1 1 0 9 8 1 2 0 1 9 9 2 1 1 1 0 0 1 0 1 1 1 0 1 1 0 1 0 0 0 1 0 1 1
ping localhost -n 1 > nul
echo 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0 1 0 0 1 0 1 0 1 1 0 1 0 0 0 0 1 0 1 0 0 1 0
ping localhost -n 1 > nul
echo 1 0 1 1 1 0 1 1 0 9 1 1 2 1 1 0 9 1 0 5 7 7 8 7 8 1 3 2 1 2 1 2 3 2 1 3 4
ping localhost -n 1 > nul
echo 1 1 1 0 1 0 0 1 0 0 0 1 1 1 0 0 1 1 1 4 1 2 1 1 2 0 1 0 1 2 2 1 0 1 1 0 1
goto a

:OPEN2
mode 79,32
echo                                 _versao 1.0
echo                              ==(W{==========-      /===-
echo                                [   (.--.)         /---=-_---~~~~~~~----__
echo                                [ \_,[**],__      ]===-~___            _,-'`
echo                   -==\\        `\ ' `--'   ),    `//~\\   ~~~~`--._.-~    
echo               ______-==[        /`\_. .__/\ \    ] ]  \\          _-~`
echo            -~~~  ,-/-==\\      (   [ .  ]  ~~]   ] ]   `\       ,'     
echo         __--~~~  ,-/-==\\      (   [ .  ]  ~~]   ] ]   `\       ,'     
echo      _-~       /'    [  \\     )__/=-0--=\}{/   / /      \     /          
echo    .'        /       [   \\      /~\___/~~\/  /' /        \   /           
echo   /  ____  /         [    \`\.__/-~~   \  ]_/'  /          \/'            
echo  /-'~    ~~~~~---__  [     ~-/~         ( )   /'        _--~`             
echo                    \_[      /        _) [ ;  ),   __--~~                  
echo                      '~~--_/      _-~/- []\   '-~ \                      
echo                     {\__--_/}    / \\}-]){__\      \                   
echo                     /'   (_/  _-~  ] ]__}--{__]      ]                   
echo                    [   _/) )-~     ] ]__}--{__]      ]
echo                    / /~ ,_/       / /__}---{__/      ]
echo                   o-o _//        /-~_}---{__-~      /     
echo                   (*(~          /~_}---{__-      _-~
echo                  ,/[           /__{--{__/     _-~
echo               ,//('(          [__}--{__]     /                  .--_
echo              ( ( '))          [__}--{__]    ]                 /' _-_~\
echo           `-)) )) (           [__}--{__]    ]               /'  /   ~\`\
echo          ,/,'//( (             \__}--{__\    \            /'  //      [[
echo        ,( ( ((, ))              ~-__}--{_~-_  ~--__---~'/'/  /'       VV
echo      `~/  )` ) ,/]                ~-_~}--{_/-__      __-~ _/
echo    ._-~//( )/ )) `                    ~~-'_/_/ /~~~~~__--~
echo     ;'( ')/ ,)(                              ~~~~~~~~
echo    ' ') '( (/
pause
goto menu


:opcao16
echo                       %ESC%[41m###########################%ESC%[0m
echo                       %ESC%[41m#  ESTA OPCAO NAO EXISTE  #%ESC%[0m
echo                       %ESC%[41m###########################%ESC%[0m
pause
goto menu
:setESC
for /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & echo on & for %%b in (1) do rem"') do (
  set ESC=%%b
exit /B 0
  )

