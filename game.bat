@echo off
title Jogo de Minecraft no CMD
setlocal enabledelayedexpansion

rem Tamanho da matriz
set largura=10
set altura=10

rem Posição inicial do jogador
set x=5
set y=5
set direcao=^

rem Matriz de blocos
for /l %%i in (1,1,%altura%) do (
    for /l %%j in (1,1,%largura%) do (
        set "mapa[%%i,%%j]= "
    )
)

rem Loop do jogo
:loop
cls
for /l %%i in (1,1,%altura%) do (
    for /l %%j in (1,1,%largura%) do (
        if !x! equ %%j if !y! equ %%i (
            set "linha=!linha!!direcao!"
        ) else (
            set "linha=!linha!!mapa[%%i,%%j]!"
        )
    )
    echo !linha!
    set "linha="
)

rem Controles do jogador
choice /c wsadeqx /n /m "Use W,A,S,D para mover, E para colocar bloco, Q para quebrar bloco, X para sair: "
set "tecla=%errorlevel%"

if %tecla% equ 1 set "direcao=^" & set /a y-=1
if %tecla% equ 2 set "direcao=<" & set /a x-=1
if %tecla% equ 3 set "direcao=v" & set /a y+=1
if %tecla% equ 4 set "direcao=>" & set /a x+=1
if %tecla% equ 5 set "mapa[%y%,%x%]=X"
if %tecla% equ 6 if "!mapa[%y%,%x%]!" equ "X" set "mapa[%y%,%x%]= "
if %tecla% equ 7 exit /b

rem Impede que o jogador saia da matriz
if %x% lss 1 set x=1
if %x% gtr %largura% set x=%largura%
if %y% lss 1 set y=1
if %y% gtr %altura% set y=%altura%

goto loop
