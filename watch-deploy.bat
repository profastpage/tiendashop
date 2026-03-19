@echo off
REM Auto-Deploy Watcher - Detecta cambios y sube automáticamente
echo ========================================
echo   TechStore - Auto-Deploy Watcher
echo   Detectando cambios cada 5 segundos...
echo ========================================
echo.

:loop
REM Guardar estado actual
git status --porcelain > "%temp%\git_status.tmp"

REM Verificar si hay cambios
findstr /r "." "%temp%\git_status.tmp" > nul
if %errorlevel% equ 0 (
    echo [%time%] Cambios detectados!
    echo [1/3] Añadiendo...
    git add .
    
    echo [2/3] Commiteando...
    git commit -m "auto: deploy %date% %time%"
    
    echo [3/3] Subiendo a GitHub...
    git push -u origin main
    
    if %errorlevel% equ 0 (
        echo [OK] Deploy completado!
    ) else (
        echo [ERROR] No se pudo subir
    )
    echo.
)

REM Esperar 5 segundos
timeout /t 5 /nobreak > nul
goto loop
