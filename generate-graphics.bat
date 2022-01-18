
rmdir /s/q  "source\gen"
rmdir /s/q  "headers\gen"

mkdir "source\gen\default\graphics"
mkdir "headers\gen\graphics"


SET GBDK_HOME=C:/gbdk

%GBDK_HOME%/bin/png2asset graphics\sprites\Player.png -c source\gen\default\graphics\Player.c -sw 16 -sh 8 -spr8x8 -noflip
%GBDK_HOME%/bin/png2asset graphics\sprites\Explosion.png -c source\gen\default\graphics\Explosion.c -sw 8 -sh 8 -spr8x8 -noflip
%GBDK_HOME%/bin/png2asset graphics\sprites\Alien.png -c source\gen\default\graphics\Alien.c -sw 16 -sh 8 -spr8x8 -noflip
%GBDK_HOME%/bin/png2asset graphics\sprites\BulletA.png -c source\gen\default\graphics\BulletA.c -sw 8 -sh 8 -spr8x8 -noflip
%GBDK_HOME%/bin/png2asset graphics\sprites\BulletB.png -c source\gen\default\graphics\BulletB.c -sw 8 -sh 8 -spr8x8 -noflip
%GBDK_HOME%/bin/png2asset graphics\sprites\BulletC.png -c source\gen\default\graphics\BulletC.c -sw 8 -sh 8 -spr8x8 -noflip

%GBDK_HOME%/bin/png2asset graphics\backgrounds\SpaceInvadersTitle.png -c source\gen\default\graphics\SpaceInvadersTitle.c -map -noflip
%GBDK_HOME%/bin/png2asset graphics\backgrounds\Barricade.png -c source\gen\default\graphics\Barricade.c -map -noflip
%GBDK_HOME%/bin/png2asset graphics\backgrounds\Invader1.png -c source\gen\default\graphics\Invader1.c -map -noflip
%GBDK_HOME%/bin/png2asset graphics\backgrounds\Invader2.png -c source\gen\default\graphics\Invader2.c -map -noflip
%GBDK_HOME%/bin/png2asset graphics\backgrounds\Invader3.png -c source\gen\default\graphics\Invader3.c -map -noflip
%GBDK_HOME%/bin/png2asset graphics\backgrounds\SpaceInvadersFont.png -c source\gen\default\graphics\SpaceInvadersFont.c -map


:: move .h files to their proper location
FOR /R "source/gen/bank1/graphics/" %%X IN (*.h) DO (
    echo Moving %%~nX ...
    move "%%X" "%cd%/headers/gen/graphics/"
)

:: move .h files to their proper location
FOR /R "source/gen/default/graphics/" %%X IN (*.h) DO (
    echo Moving %%~nX ...
    move "%%X" "%cd%/headers/gen/graphics/"
)