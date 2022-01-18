@echo off
setlocal
setlocal enabledelayedexpansion

:: ------------------- declare CLI file variable -------------------
set ROOT_DIR=%~dp0

:: ------------------- execute script -------------------
IF NOT EXIST vcpkg ( git clone https://github.com/Microsoft/vcpkg.git )
cd vcpkg
git fetch
git pull
IF NOT EXIST vcpkg.exe ( bootstrap-vcpkg.bat )

:: ------------------- install package -------------------
vcpkg install boost

:: ------------------- end -------------------
cd %ROOT_DIR%
