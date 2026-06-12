
MS_TEX      = pdflatex
MS_TEXFLAGS ?= -interaction=nonstopmode -file-line-error
MS_BIB      ?= bibtex
MS_BIB      := $(if $(strip $(MS_BIB)),$(strip $(MS_BIB)),biber)
MS_FILE     ?= MIMO

# LaTeX auxiliary files to remove during clean
# Includes: cross-references, bibliography, font database, logs, etc.
CLEAN_EXTS = *.aux *-blx.bib *.bcf *.blg *.bbl *.brf *.fdb_latexmk *.fls *.loa *.lof *.log *.lot *.lpr *.nav *.out *.run.xml *.snm *.toc *.vrb *.synctex.gz

.SUFFIXES: .aux .pdf .tex
.PHONY: all manuscript presentation clean distclean help

# Build both manuscript and presentation
all: manuscript

# Build manuscript PDF
# Process: LaTeX → (Bibliography if configured) → LaTeX → LaTeX
# Three LaTeX passes ensure cross-references and citations are resolved
manuscript:
	$(MS_TEX) $(MS_TEXFLAGS) $(MS_FILE).tex
	@if [ -n "$(MS_BIB)" ]; then $(MS_BIB) $(MS_FILE); fi
	$(MS_TEX) $(MS_TEXFLAGS) $(MS_FILE).tex
	$(MS_TEX) $(MS_TEXFLAGS) $(MS_FILE).tex

# Remove temporary LaTeX files (keep PDFs)
clean:
	rm -f $(CLEAN_EXTS)

# Remove temporary files AND generated PDFs
distclean: clean
	rm -f $(MS_FILE).pdf

# Display help message with available targets and variables
help:
	@echo "========== LaTeX Build System =========="
	@echo ""
	@echo "TARGETS:"
	@echo "  make / make all      - Build BOTH manuscript and presentation"
	@echo "  make manuscript      - Build ONLY manuscript/$(MS_FILE).pdf"
	@echo "  make clean           - Remove temporary LaTeX files (keeps PDFs)"
	@echo "  make distclean       - Remove temporary files AND PDFs"
	@echo "  make help            - Show this help message"
	@echo ""
	@echo "CONFIGURABLE VARIABLES (override via: make VAR=value):"
	@echo "  Manuscript:"
	@echo "    MS_FILE=$(MS_FILE)          - Main source file (no .tex extension)"
	@echo "    MS_TEX=$(MS_TEX)            - LaTeX engine"
	@echo "    MS_TEXFLAGS                - Compiler flags"
	@echo "    MS_BIB=$(MS_BIB)            - Bibliography processor (biber or empty)"
	@echo ""
	@echo "EXAMPLES:"
	@echo "  make                             # Build both documents"
	@echo "  make manuscript                  # Build thesis only"
	@echo "  make clean                       # Clean all temporary files"
	@echo "  make MS_BIB=biber manuscript     # Build with biber bibliography"
	@echo "  make help                        # Show this help message"

