@echo off
REM Auto-commit rápido - Solo añade y commitea localmente
echo [Auto-Commit] Guardando cambios...
git add .
git commit -m "feat: actualización %date%"
echo [OK] Cambios guardados localmente
echo.
echo Para subir a GitHub ejecuta: git push
pause
