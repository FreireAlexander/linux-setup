#!/bin/sh

BLANK='#00000000'
CLEAR='#ffffff22'
DEFAULT='#7B68EEcc'
TEXT='#ffffff'
WRONG='#8B0000bb'
VERIFYING='#228B22bb'
ATTEMPT='#7FFF00bb'

i3lock \
--insidever-color=$CLEAR     \
--ringver-color=$VERIFYING   \
\
--insidewrong-color=$CLEAR   \
--ringwrong-color=$WRONG     \
\
--inside-color=$BLANK        \
--ring-color=$DEFAULT        \
--line-color=$BLANK          \
--separator-color=$DEFAULT   \
\
--verif-color=$TEXT          \
--wrong-color=$TEXT          \
--time-color=$TEXT           \
--date-color=$TEXT           \
--layout-color=$TEXT         \
--keyhl-color=$ATTEMPT         \
--bshl-color=$ATTEMPT          \
\
--blur 5                     \
--clock                      \
--indicator                  \
--time-str="%I:%M:%S"        \
--date-str="%a, %d/%m/%Y"       \
--keylayout 1                \