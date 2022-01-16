
rmdir /s/q  "source\gen"
rmdir /s/q  "headers\gen"

mkdir "source\gen\graphics"
mkdir "headers\gen\graphics"

%GBDK_HOME%/bin/png2asset graphics\sprites\Player.png -c source\gen\graphics\Player.c -sw 16 -sh 8 -spr8x8 -noflip
%GBDK_HOME%/bin/png2asset graphics\sprites\Alien.png -c source\gen\graphics\Alien.c -sw 16 -sh 8 -spr8x8 -noflip
%GBDK_HOME%/bin/png2asset graphics\sprites\BulletA.png -c source\gen\graphics\BulletA.c -sw 8 -sh 16 -spr8x8
%GBDK_HOME%/bin/png2asset graphics\sprites\BulletB.png -c source\gen\graphics\BulletB.c -sw 8 -sh 16 -spr8x8

%GBDK_HOME%/bin/png2asset graphics\backgrounds\Barricade.png -c source\gen\graphics\Barricade.c -map -noflip
%GBDK_HOME%/bin/png2asset graphics\backgrounds\Invader1.png -c source\gen\graphics\Invader1.c -map -noflip
%GBDK_HOME%/bin/png2asset graphics\backgrounds\Invader2.png -c source\gen\graphics\Invader2.c -map -noflip
%GBDK_HOME%/bin/png2asset graphics\backgrounds\Invader3.png -c source\gen\graphics\Invader3.c -map -noflip
%GBDK_HOME%/bin/png2asset graphics\backgrounds\SpaceInvadersFont.png -c source\gen\graphics\SpaceInvadersFont.c -map


:: loop for all files in the generated source folder
FOR /R "source/gen/graphics/" %%X IN (*.h) DO (
    echo Moving %%~nX ...
    move "%%X" "%cd%/headers/gen/graphics/"
)