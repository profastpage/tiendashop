@echo off
REM Script para commit automático a GitHub
REM Configura tu usuario primero con:
REM git config --global user.name "Tu Nombre"
REM git config --global user.email "tu@email.com"

echo ========================================
echo   TechStore - Auto Commit a GitHub
echo ========================================
echo.

REM Verificar si hay cambios
git status --porcelain > nul
if %errorlevel% neq 0 (
    echo [ERROR] No hay repositorio Git inicializado
    echo Ejecuta: git init
    pause
    exit /b 1
)

REM Añadir todos los cambios
echo [1/4] Añadiendo cambios...
git add .

REM Verificar si hay cambios para commitear
git status --porcelain | findstr /r "." > nul
if %errorlevel% neq 0 (
    echo [INFO] No hay cambios para commitear
    pause
    exit /b 0
)

REM Hacer commit
echo [2/4] Creando commit...
git commit -m "Actualización automática: %date% %time%"

REM Intentar hacer push
echo [3/4] Subiendo a GitHub...
git push

if %errorlevel% equ 0 (
    echo.
    echo [OK] Cambios subidos exitosamente!
    echo [4/4] Completado!
) else (
    echo.
    echo [ERROR] No se pudo subir a GitHub
    echo Verifica tu conexión o configura el remote:
    echo git remote add origin https://github.com/TU_USUARIO/TU_REPO.git
)

echo.
pause
