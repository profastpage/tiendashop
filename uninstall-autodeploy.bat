@echo off
REM Desinstalar Auto-Deploy del Inicio de Windows
echo ========================================
echo   Desinstalar Auto-Deploy del Inicio
echo ========================================
echo.

set STARTUP=%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup

echo [1/1] Eliminando acceso directo...
del /Q "%STARTUP%\TechStore-AutoDeploy.lnk"

if %errorlevel% equ 0 (
    echo [OK] Auto-Deploy desinstalado
    echo.
    echo El servicio ya no se iniciara automaticamente.
) else (
    echo [ERROR] No se pudo desinstalar
)

pause
