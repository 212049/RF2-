@echo off
chcp 65001 >nul
title RF2T Log Reorganization Tool

echo ============================================
echo RF2T Log Reorganization Tool
echo ============================================
echo.
echo This tool will:
echo   1. Reorganize logs by model
echo   2. Delete original files after reorganization
echo.
echo Press any key to start...
pause >nul

echo.
cls
powershell -ExecutionPolicy Bypass -File "%~dp0reorganize_logs.ps1"

if %errorlevel% neq 0 (
    echo.
    echo Script execution failed!
    echo Please check the error messages above
    echo.
    pause
    exit /b %errorlevel%
)

echo.
echo All operations completed!
echo.
pause

