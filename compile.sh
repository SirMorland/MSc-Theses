#!/bin/bash

pdflatex -output-directory out --shell-escape main.tex
makeindex -s out/main.ist -t out/main.glg -o out/main.gls out/main.glo
sudo biber out/main
pdflatex -output-directory out --shell-escape main.tex
pdflatex -output-directory out --shell-escape main.tex

gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dPDFSETTINGS=/prepress -dNOPAUSE -dQUIET -dBATCH -sOutputFile=out/hapsynth.pdf out/main.pdf