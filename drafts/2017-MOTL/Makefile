TEX = pdflatex -shell-escape # -interaction=nonstopmode -file-line-error
BIB = biber
CV = MOTL
CL = LaurentNtibarikureCoverLetter

.SUFFIXES: .aux .pdf .tex
.PHONY: clean

all : doc

doc:
	$(TEX) $(CV).tex
	$(BIB) $(CV)
	$(TEX) $(CV).tex
	$(TEX) $(CV).tex
	open $(CV).pdf

clean: 
	rm -rf *.aux *.loa *.lof *.log *.lot *.toc *.bbl *.blg *.out *.run.xml *.bcf *.xmpi
