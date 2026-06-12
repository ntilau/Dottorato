TEX = pdflatex -interaction=nonstopmode -file-line-error
BIB = bibtex
FILE = MIMO

.SUFFIXES: .aux .pdf .tex
.PHONY: all clean

all:
	$(TEX) $(FILE).tex
	-$(BIB) $(FILE)
	$(TEX) $(FILE).tex
	$(TEX) $(FILE).tex

clean:
	rm -f *.aux *.bbl *.blg *.brf *.fdb_latexmk *.fls *.loa *.lof \
	      *.log *.lot *.lpr *.nav *.out *.run.xml *.snm *.synctex.gz *.toc *.vrb
