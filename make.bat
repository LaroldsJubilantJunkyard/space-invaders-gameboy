@echo off

rmdir /s /q bin
rmdir /s /q dist

mkdir bin
mkdir dist


SET GBDK_HOME=C:/gbdk
SET HUGETRACKER_DIR=%GBDK_HOME%/lib/hUGETracker_1_0b9/hUGEDriver

SET LCC_COMPILE_BASE=%GBDK_HOME%\bin\lcc -Iheaders/main -Iheaders/gen -I%HUGETRACKER_DIR% -Wa-l -Wl-m -Wl-j -DUSE_SFR_FOR_REG
SET LCC_COMPILE=%LCC_COMPILE_BASE% -c -o 

:: Assemble the hUGEDriver source into an RGBDS object file
:: "lib/rgbasm" -obin/hUGEDriver.obj -i%HUGETRACKER_DIR% %HUGETRACKER_DIR%/hUGEDriver.asm

:: Convert the RGBDS object file into a GBDK object file
:: "lib/rgb2sdas" bin/hUGEDriver.obj
SETLOCAL ENABLEDELAYEDEXPANSION

:: Default to the hugedriver file
:: SET "COMPILE_OBJECT_FILES=bin/hUGEDriver.obj.o"
SET "COMPILE_OBJECT_FILES="


rmdir /s/q  "source\gen"
rmdir /s/q  "headers\gen"

mkdir "source\gen\graphics"
mkdir "headers\gen\graphics"

::%GBDK_HOME%/bin\png2asset graphics\sprites\Player.png -c source\gen\graphics\Player.c -sw 16 -h 8 -px 8 -py 4

:: loop for all files in the default source folder
FOR /R "source/main/default/" %%X IN (*.c) DO (
    echo Compiling %%~nX ...
    %LCC_COMPILE% bin/%%~nX.o %%X
    SET "COMPILE_OBJECT_FILES=bin/%%~nX.o !COMPILE_OBJECT_FILES!"
)


:: Compile a .gb file from the compiled .o files
%LCC_COMPILE_BASE% -Wl-yt3 -Wl-yo4 -Wl-ya4 -o dist/SpaceInvaders.gb !COMPILE_OBJECT_FILES!

endlocal

"lib/romusage" dist\SpaceInvaders.noi -a