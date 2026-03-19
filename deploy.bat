@echo off
REM Script para commit automático a GitHub con SSH
echo ========================================
echo   TechStore - Auto Deploy a GitHub
echo ========================================
echo.

REM Añadir todos los cambios
echo [1/3] Añadiendo cambios...
git add .

REM Verificar si hay cambios para commitear
git status --porcelain | findstr /r "." > nul
if %errorlevel% neq 0 (
    echo [INFO] No hay cambios para commitear
    pause
    exit /b 0
)

REM Hacer commit
echo [2/3] Creando commit...
git commit -m "feat: actualización automática %date%"

REM Hacer push con SSH
echo [3/3] Subiendo a GitHub (SSH)...
git push -u origin main

if %errorlevel% equ 0 (
    echo.
    echo [OK] Cambios subidos exitosamente!
    echo ========================================
) else (
    echo.
    echo [ERROR] No se pudo subir a GitHub
    echo Verifica que tu SSH key esté configurada
)

echo.
pause
