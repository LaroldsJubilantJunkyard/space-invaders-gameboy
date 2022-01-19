@echo off

rmdir /s /q bin
rmdir /s /q dist

mkdir bin
mkdir dist


SET GBDK_HOME=C:/gbdk

SET LCC_COMPILE_BASE=%GBDK_HOME%\bin\lcc -Iheaders/main -Iheaders/gen -Wa-l -Wl-m -Wl-j -DUSE_SFR_FOR_REG
SET LCC_COMPILE=%LCC_COMPILE_BASE% -c -o 


SETLOCAL ENABLEDELAYEDEXPANSION

:: Default to the hugedriver file
:: SET "COMPILE_OBJECT_FILES=bin/hUGEDriver.obj.o"
SET "COMPILE_OBJECT_FILES="


call generate-graphics.bat

:: loop for all files in the generated source folder
FOR /R "source/gen/default/graphics/" %%X IN (*.c) DO (
    echo Compiling %%~nX ...
    %LCC_COMPILE% bin/gen_%%~nX.o %%X
    SET "COMPILE_OBJECT_FILES=bin/gen_%%~nX.o !COMPILE_OBJECT_FILES!"
)


:: loop for all files in the default source folder
FOR /R "source/main/default/" %%X IN (*.c) DO (
    echo Compiling %%~nX ...
    %LCC_COMPILE% bin/%%~nX.o %%X
    SET "COMPILE_OBJECT_FILES=bin/%%~nX.o !COMPILE_OBJECT_FILES!"
)


:: Compile a .gb file from the compiled .o files
%LCC_COMPILE_BASE% -Wm-yC  -Wl-yt3 -o dist/SpaceInvaders.gb !COMPILE_OBJECT_FILES!

endlocal

"lib/romusage" dist\SpaceInvaders.noi -a