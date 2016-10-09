#!/bin/bash

set -e; set -u

TMP="/tmp"
lc="../latex-common"

function MAKE_QUICK {
    if [ $1.tex -nt $1.pdf ]; then
        cat styles/slides-head.tex > $TMP/$1.tex
        cat $1.tex >> $TMP/$1.tex
        cat styles/slides-tail.tex >> $TMP/$1.tex
        pdflatex    -output-directory $TMP $TMP/$1
#        biber       --output_directory $TMP $TMP/$1
        pdflatex    -output-directory $TMP $TMP/$1
        cp $TMP/$1.pdf .
    fi
}


ls *.tex | while read f ; do 
    MAKE_QUICK ${f%.tex}
done

