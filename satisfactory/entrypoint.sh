#!/bin/bash
set -ex
mkdir -p "${STEAM_APPDIR}" || true  

steamcmd "+login anonymous +force_install_dir ${STEAM_APPDIR} +app_update ${STEAM_APPID} +quit"

cd "${STEAM_APPDIR}"

exec "${STEAM_APPDIR}/FactoryServer.sh"
