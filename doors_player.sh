#!/bin/env bash

playlist="https://raw.githubusercontent.com/DonaldGelman/doors/main/doors_playlist.txt"

if [ "$#" -eq 0 ]
then
	mpv --prefetch-playlist --shuffle=yes --playlist=$playlist
else
	filter="$1"
	filtered_pl=$HOME/bin/doors/filtered_pl.txt
	curl -s $playlist | grep $filter > $filtered_pl
	mpv --prefetch-playlist --shuffle=yes --playlist=$filtered_pl
fi

