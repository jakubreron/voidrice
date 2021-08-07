#!/bin/sh
cap && \ls ~/.config/personal/arch/pkglist/*.txt | entr -np git-update docs pkglist
