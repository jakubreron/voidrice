#!/bin/sh
cd ~/.config/personal/arch/pkglist && \ls ~/.config/personal/arch/pkglist/*.txt | entr -np git-update docs pkglist
