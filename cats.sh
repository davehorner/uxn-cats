#!/bin/bash
# cats.sh - Launch multiple catclock widgets with random positions and effects (Linux/macOS)

# Screen dimensions (requires xrandr)
read SCREEN_WIDTH SCREEN_HEIGHT < <(xrandr | grep '*' | head -n1 | awk '{print $1}' | awk -Fx '{print $1, $2}')

EFFECTS=(invert plasma rainbow waves noise random)
FITS=(contain cover stretch none center)
ROM_URL="https://wiki.xxiivv.com/etc/catclock.tal.txt"
COUNT=10  # Number of windows to launch
UXNTAL_EXE="uxntal"

for ((i=0; i<COUNT; i++)); do
    W=$((RANDOM % 441 + 200))
    H=$((RANDOM % 281 + 200))
    X=$((RANDOM % (SCREEN_WIDTH - W)))
    Y=$((RANDOM % (SCREEN_HEIGHT - H)))
    T=$((RANDOM % 8 + 3))
    SCALE=$((RANDOM % 3 + 1))
    EFX=${EFFECTS[$RANDOM % ${#EFFECTS[@]}]}
    FIT=${FITS[$RANDOM % ${#FITS[@]}]}

    ARGS=(
        "uxntal"
        "widget"
        "x^^$X"
        "y^^$Y"
        "w^^$W"
        "h^^$H"
        "t^^$T"
        "efx^^$EFX"
        "fit^^$FIT"
        "scale^^$SCALE"
        "//$ROM_URL"
    )
    ARGS_STRING=$(IFS=:; echo "${ARGS[*]}")
    echo "$UXNTAL_EXE $ARGS_STRING"
    "$UXNTAL_EXE" "$ARGS_STRING" &
done
