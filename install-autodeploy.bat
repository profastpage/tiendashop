@echo off
REM Instalar Auto-Deploy en Inicio de Windows
echo ========================================
echo   Instalar Auto-Deploy en Inicio
echo ========================================
echo.

REM Crear acceso directo en la carpeta de Inicio
set SCRIPT_DIR=%~dp0
set STARTUP=%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup

echo [1/2] Creando acceso directo en Inicio...
powershell -Command "$WshShell = New-Object -ComObject WScript.Shell; $Shortcut = $WshShell.CreateShortcut('%STARTUP%\TechStore-AutoDeploy.lnk'); $Shortcut.TargetPath = '%SCRIPT_DIR%watch-deploy.vbs'; $Shortcut.WorkingDirectory = '%SCRIPT_DIR%'; $Shortcut.Description = 'Auto-Deploy TechStore a GitHub'; $Shortcut.Save()"

if %errorlevel% equ 0 (
    echo [OK] Acceso directo creado en Inicio
    echo.
    echo ========================================
    echo   INSTALACION COMPLETADA!
    echo ========================================
    echo.
    echo El Auto-Deploy se iniciara automaticamente:
    echo - Al iniciar sesion en Windows
    echo - En segundo plano (sin ventanas)
    echo.
    echo Para verificar: Revisa la carpeta Inicio
    echo Presiona Win+R, escribe: shell:startup
    echo.
    echo Para desinstalar: Elimina el acceso directo
    echo de la carpeta Inicio o ejecuta:
    echo   uninstall-autodeploy.bat
    echo.
) else (
    echo [ERROR] No se pudo crear el acceso directo
)

pause
