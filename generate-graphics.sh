# Set GBDK_HOME environment variable
GBDK_HOME=/usr/local/gbdk

# Remove directories and their contents
rm -rf "source/gen"
rm -rf "headers/gen"

# Define constants for directories
SPRITE_DIR="graphics/sprites"
BACKGROUND_DIR="graphics/backgrounds"
TARGET_C_DIR="source/gen/default/graphics"
TARGET_HEADER_DIR="headers/gen/graphics"

# Create necessary directories
mkdir -p "$TARGET_C_DIR"
mkdir -p "$TARGET_HEADER_DIR"

# Define sprite and background assets
SPRITES=("Player:16:8" "Explosion:8:8" "Alien:16:8" "BulletA:8:8" "BulletB:8:8" "BulletC:8:8")
BACKGROUNDS=("SpaceInvadersTitle" "Barricade" "Invader1" "Invader2" "Invader3" "SpaceInvadersFont")


convert_sprites() {
    local sprite_dir=$1
    local output_dir=$2
    local sprites=("${@:3}") # Get all arguments starting from the third

    for asset in "${sprites[@]}"; do
        IFS=':' read -r name sw sh <<< "$asset"
        if "$GBDK_HOME/bin/png2asset" "$sprite_dir/$name.png" -c "$output_dir/$name.c" -sw "$sw" -sh "$sh" -spr8x8 -noflip; then
            echo " * $name sprite: $sprite_dir/$name.png --> $output_dir/$name.c and $output_dir/$name.h"
        else
            echo "Error converting $name sprite."
            exit 1
        fi
    done
}

convert_backgrounds() {
    local background_dir=$1
    local output_dir=$2
    local backgrounds=("${@:3}") # Get all arguments starting from the third

    for asset in "${backgrounds[@]}"; do
        if "$GBDK_HOME/bin/png2asset" "$background_dir/$asset.png" -c "$output_dir/$asset.c" -map -noflip; then
            echo " * $asset: $background_dir/$asset.png --> $output_dir/$asset.c and $output_dir/$asset.h"
        else
            echo "Error converting $asset background."
            exit 1
        fi
    done
}

# Move .h files to their proper location
echo
echo "1.1: Converting Sprite PNG files to C source and Header files using png2asset"
convert_sprites "$SPRITE_DIR" "$TARGET_C_DIR" "${SPRITES[@]}"
echo
echo "1.2: Converting Background PNG files to C source and Header files using png2asset"
convert_backgrounds "$BACKGROUND_DIR" "$TARGET_C_DIR" "${BACKGROUNDS[@]}"
echo
echo "1.3: Move generated Header files to $TARGET_HEADER_DIR/"
find "$TARGET_C_DIR" -name "*.h" -exec sh -c '
    count=0
    for file do
        count=$((count + 1))
        [ $count -eq 1 ] && continue # the first argument is the path itself
        echo " * file: $file --> $1/"
        mv "$file" "$1/"
    done
' sh "$TARGET_HEADER_DIR" {} +

echo
echo "All C source files are in $TARGET_C_DIR and header files are in $TARGET_HEADER_DIR/"