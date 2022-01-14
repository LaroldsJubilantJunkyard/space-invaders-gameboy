@echo off

rmdir /s /q bin
rmdir /s /q dist

mkdir bin
mkdir dist


SET GBDK_HOME=C:/gbdk
SET HUGETRACKER_DIR=%GBDK_HOME%/lib/hUGETracker_1_0b9/hUGEDriver

SET LCC_COMPILE_BASE=%GBDK_HOME%\bin\lcc -Iheaders -I%HUGETRACKER_DIR% -Wa-l -Wl-m -Wl-j -DUSE_SFR_FOR_REG
SET LCC_COMPILE=%LCC_COMPILE_BASE% -c -o 

:: Assemble the hUGEDriver source into an RGBDS object file
:: "lib/rgbasm" -obin/hUGEDriver.obj -i%HUGETRACKER_DIR% %HUGETRACKER_DIR%/hUGEDriver.asm

:: Convert the RGBDS object file into a GBDK object file
:: "lib/rgb2sdas" bin/hUGEDriver.obj
SETLOCAL ENABLEDELAYEDEXPANSION

:: Default to the hugedriver file
:: SET "COMPILE_OBJECT_FILES=bin/hUGEDriver.obj.o"
SET "COMPILE_OBJECT_FILES="

:: loop for all files in the default source folder
FOR %%X IN (source/default/*.c) DO (
    %LCC_COMPILE% bin/%%~nX.o source/default/%%X
    SET "COMPILE_OBJECT_FILES=bin/%%~nX.o !COMPILE_OBJECT_FILES!"

    echo Compiling %%X...
)


:: loop for all files in the bank2 folder
FOR %%X IN (source/bank1/*.c) DO (
    %LCC_COMPILE_BASE% -Wf-bo1  -Wf-ba1 -c -o bin/%%~nX.o source/bank1/%%X    
    SET "COMPILE_OBJECT_FILES=bin/%%~nX.o !COMPILE_OBJECT_FILES!"

    echo Compiling %%X...
)


:: loop for all files in the bank2 folder
FOR %%X IN (source/bank2/*.c) DO (
    %LCC_COMPILE_BASE% -Wf-bo2  -Wf-ba2 -c -o bin/%%~nX.o source/bank2/%%X    
    SET "COMPILE_OBJECT_FILES=bin/%%~nX.o !COMPILE_OBJECT_FILES!"

    echo Compiling %%X...
)

:: loop for all files in the bank3 folder
FOR %%X IN (source/bank3/*.c) DO (
    %LCC_COMPILE_BASE% -Wf-bo3  -Wf-ba3 -c -o bin/%%~nX.o source/bank3/%%X    
    SET "COMPILE_OBJECT_FILES=bin/%%~nX.o !COMPILE_OBJECT_FILES!"

    echo Compiling %%X...
)


:: Compile a .gb file from the compiled .o files
%LCC_COMPILE_BASE% -Wl-yt3 -Wl-yo4 -Wl-ya4 -o dist/SpaceInvaders.gb !COMPILE_OBJECT_FILES!

endlocal

"lib/romusage" dist\SpaceInvaders.noi -a