#!/usr/bin/env bash

if $(systemctl is-active --quiet --user polybar); then
    systemctl --user restart polybar
fi
