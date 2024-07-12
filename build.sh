#!/usr/bin/env bash

# Remove bin and dist directories
rm -rf bin dist

# Create bin and dist directories
mkdir bin dist

# Set environment variables
GBDK_HOME=/usr/local/gbdk
LCC_COMPILE_BASE="$GBDK_HOME/bin/lcc -Iheaders/main -Iheaders/gen -Wa-l -Wl-m -Wl-j -DUSE_SFR_FOR_REG"
LCC_COMPILE="$LCC_COMPILE_BASE -c -o"

# Call generate-graphics script
echo "Part 1: Calling generate-graphics.sh ..."
echo "        This converts PNG images to C source files for game graphics using png2asset"
echo "        and then moves the generated header files to a specific location."
echo "---------------------------------"
./generate-graphics.sh
echo; echo; echo
echo "Part 2: Compiling source files ..."
echo "---------------------------------"
# Compile object files
COMPILE_OBJECT_FILES=""
echo "Part 2.1: Generate object files for the graphics"
echo "        FROM: source/gen/default/graphics/<FILE>.c and any subdirectory of it"
echo "          TO: bin/gen_<FILE>.c.o"
echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
for file in $(find source/gen/default/graphics -name "*.c"); do
    echo " * Compiling ${file##*/} ... $LCC_COMPILE "\"bin/gen_${file##*/}.o\" \"$file\"""
    eval $LCC_COMPILE "\"bin/gen_${file##*/}.o\" \"$file\""
    if [ $? -ne 0 ]; then
        echo "Error compiling ${file##*/}. Exiting..."
        exit 1
    fi
    COMPILE_OBJECT_FILES+="bin/gen_${file##*/}.o "
done
echo
echo "Part 2.2: Generate object files for the main source files"
echo "        FROM: source/main/default/<FILE>.c and any subdirectory of it"
echo "          TO: bin/<FILE>.c.o"
echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
for file in $(find source/main/default -name "*.c"); do
    echo " * Compiling ${file##*/} ...  $LCC_COMPILE "\"bin/${file##*/}.o\" \"$file\"""
    eval $LCC_COMPILE "\"bin/${file##*/}.o\" \"$file\""
    if [ $? -ne 0 ]; then
        echo "Error compiling ${file##*/}. Exiting..."
        exit 1
    fi
    COMPILE_OBJECT_FILES+="bin/${file##*/}.o "
done

echo; echo; echo
echo "Part 3: Linking object files, producing Gameboy rom ..."
echo "---------------------------------"

# Compile .gb file from object files
echo " * $LCC_COMPILE_BASE -Wm-yC -Wl-yt3 -o \"dist/SpaceInvaders.gb\" $COMPILE_OBJECT_FILES"
eval $LCC_COMPILE_BASE -Wm-yC -Wl-yt3 -o "\"dist/SpaceInvaders.gb\"" $COMPILE_OBJECT_FILES
if [ $? -ne 0 ]; then
        echo "Error. Exiting..."
        exit 1
fi
echo; echo; echo

echo "Part 4: Running romusage script ..."
echo "---------------------------------"
# Run romusage script (https://github.com/bbbbbr/romusage/)
# Nowadays this is part of the gbdk-2020 binaries
eval "$GBDK_HOME/bin/romusage" "dist/SpaceInvaders.noi" -a
if [ $? -ne 0 ]; then
        echo "Error. Exiting..."
        exit 1
fi