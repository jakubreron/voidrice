#!/bin/sh
\ls ~/.config/personal/arch/pkglist/*.txt | entr git-update docs pkglist
