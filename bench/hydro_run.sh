#!/bin/sh

threads="${1}"

./hydro_starter.sh ${threads} > output/log-hydro-${1}.txt 2>&1
