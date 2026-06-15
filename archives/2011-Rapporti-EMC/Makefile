TARGET = rapporti-emc

all: $(TARGET).pdf

$(TARGET).pdf: $(TARGET).tex intro.tex ch1.tex ch2.tex concl.tex bibliography.tex custom.tex title.tex
	pdflatex $(TARGET)
	pdflatex $(TARGET)

clean:
	rm -f *.aux *.log *.out *.toc *.bbl *.blg *.nav *.snm *.synctex.gz

distclean: clean
	rm -f $(TARGET).pdf
