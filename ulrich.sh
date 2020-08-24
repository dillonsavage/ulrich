#!/bin/bash

clipfile="/run/media/dsavage/Kindle/documents/My Clippings.txt"
outfile="ulrich.txt"
title="The Man Without Qualities"

if [[ ! -f $clipfile ]] ; then
    echo "Can't open $clipfile! :("
    exit
else
    echo "Parsing $clipfile..."
fi

awk -v title="$title" '
    BEGIN {
    	  RS="==========\r";
	  FS="\n";
    }
    $2 ~ title { 
       gsub(/\r/, "");
       printf("%s\n%s\n\n", $3, $5);
    }
' "$clipfile" | fold -w 120 -s > "$outfile"

