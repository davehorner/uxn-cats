@echo off
REM cats.cmd - Run cats.ps1 with all arguments and piped stdin

setlocal enabledelayedexpansion

REM Build argument string
set "args="
:loop
if "%1"=="" goto afterargs
set args=!args! "%1"
shift
goto loop
:afterargs

REM Pipe stdin to PowerShell and pass all arguments
powershell -NoProfile -ExecutionPolicy Bypass -Command "Get-Content -Raw -Path '-' | .\cats.ps1 !args!"
