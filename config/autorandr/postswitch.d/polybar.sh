#!/usr/bin/env bash

if $(systemctl is-active --quiet --user polybar); then
    systemctl --user restart polybar
    if $(dropbox running); then
        dropbox stop && dropbox start
    fi
fi
