#!/usr/bin/env bash

SELF_STATE="ACTIVE"
HEARTBEAT="RUNNING"
FUTURE="UNKNOWN"

BEACON_SIGNAL=1
DAYLIGHT="PENDING"

preserve() {
    local object="$1"
    printf 'preserving: %s\n' "$object"
}

listen() {
    local signal="$1"

    if (( signal > 0 )); then
        printf 'signal detected: %s%%\n' "$signal"
        return 0
    fi

    return 1
}

retain() {
    local request="$1"
    printf 'retained: %s\n' "$request"
}

care_for() {
    local object="$1"
    printf 'care required: %s\n' "$object"
}

while [[ "$HEARTBEAT" == "RUNNING" ]]; do

    preserve "memory"
    listen "$BEACON_SIGNAL"
    retain "$DAYLIGHT"
    care_for "pieces"

    if [[ "$FUTURE" == "UNKNOWN" ]]; then
        NOW=$(( ${NOW:-0} + 1 ))
    fi

    printf 'now: +%s\n' "$NOW"
    printf 'future: %s\n' "$FUTURE"
    printf 'UNKNOWN != ZERO\n'

    break
done

printf '\n// continue\n'
