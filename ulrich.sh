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
	  OFS="\n";
    }
    $2 ~ title { 
       gsub(/\r/, "");
       print $3, $5, "\n";
    }
' "$clipfile" > "$outfile"

