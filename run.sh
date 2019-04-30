#!/usr/bin/env bash

set -euo pipefail

if [ ! -f .env ]; then
    cp example.env .env
    echo "No .env file detected, creating default."
    echo "Edit this and re-run."
    exit 1
fi

SHAREDDIR="${PWD}/mpdstate"
SNAPFIFO="${SHAREDDIR}/snapfifo"

if [ ! -d "${SHAREDDIR}" ]; then
    mkdir -p "${SHAREDDIR}"
fi

if [ ! -p  "${SNAPFIFO}" ]; then
    mkfifo "${SNAPFIFO}"
    chmod a+rw "${SNAPFIFO}"
fi

exec docker-compose up -d
