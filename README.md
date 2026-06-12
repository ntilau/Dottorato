# PhD Dissertation: Contributions to Finite Element Analysis in Electromagnetics

LaTeX sources for a PhD dissertation ("Contributions to the Art of Finite Element
Analysis in Electromagnetics", University of Florence, 2011–2013) and its defense
presentation. Also includes annual progress reports, conference talks, and an
external seminar handout.

## Repository Layout

```
manuscript/                    Main dissertation document
├── dissertation.tex           Entry point (\documentclass{book})
├── title.tex                  Title page
├── pub.tex                    List of publications
├── abs.tex                    Italian + English abstract
├── ack.tex                    Acknowledgments
├── intro.tex                  Introduction
├── ch1.tex                    Finite elements for the wave equation
├── ch2.tex                    Domain decomposition methods
├── ch3.tex                    Nonlinear analysis (harmonic balance FE)
├── concl.tex                  Conclusion
├── dissertation.bib           Bibliography (BibLaTeX, biber)
├── cover/                     Cover page files
├── img/                       Figures by chapter
│   ├── ch1/
│   ├── ch2/
│   └── ch3/
├── reviews/                   Review comments
└── [dissertation.pdf]         Generated output

presentation/                 Defense Beamer presentation
├── defense.tex               Entry point
├── custom.tex                Theme and package config
├── img/                      Slide images and diagrams
└── [defense.pdf]             Generated output

notes/                        Supplementary PDFs (split from merged archive)
├── 01_Dissertation_Manuscript.pdf    Full dissertation (144 pp)
├── 02_PhD_Defense_Presentation.pdf   Defense slides (104 pp)
├── 03_Yearly_Reports.pdf             1st–3rd year reports (46 pp)
├── 04_CEM_Seminar.pdf                Prof. J.F. Lee CEM seminar (85 pp)
└── 05_MBDA.pdf                       MBDA presentation scans (10 pp)

archives/                     ZIP bundles of published/submitted papers
drafts/                       Earlier works (MEng thesis, journal articles)
Makefile                      Build orchestration
README.md                     This file
configure                     Automated dependency installer
```

## Requirements

- `make` - build automation
- `pdflatex` - LaTeX engine (included in most TeX distributions)
- **Optional**: `biber` or `bibtex` for bibliography processing

Install dependencies on macOS, Debian/Ubuntu, Arch, Fedora/RHEL, and other supported systems:

```bash
./configure
```

This script automatically detects your system and installs required packages.

## Quick Start

Build both documents:

```bash
make
```

Build only the thesis manuscript:

```bash
make manuscript
```

Build only the defense presentation:

```bash
make presentation
```

View results:

- [manuscript/dissertation.pdf](manuscript/dissertation.pdf) - Thesis PDF
- [presentation/defense.pdf](presentation/defense.pdf) - Presentation PDF

## Build Process

The build system compiles LaTeX documents in multiple passes to resolve cross-references and citations:

1. **LaTeX compilation**: Initial document processing
2. **Bibliography** (if configured): Process bibliography database (optional)
3. **LaTeX compilation (pass 2)**: Update citations and references
4. **LaTeX compilation (pass 3)**: Finalize all references

### Three-pass compilation ensures:
- ✓ All cross-references are resolved
- ✓ Table of contents is accurate
- ✓ Citations and bibliography are properly formatted
- ✓ Page numbers in references reflect final layout

## Cleaning Up

Remove temporary LaTeX files (keeps generated PDFs):

```bash
make clean
```

Remove temporary files AND generated PDFs:

```bash
make distclean
```

Temporary files cleaned: `*.aux`, `*.log`, `*.toc`, `*.nav`, `*.out`, `*.bbl`, etc.

## Configuration

Override default settings from the command line:

```bash
make VAR=value target
```

### Manuscript variables
- `MS_FILE` - Main source file without `.tex` extension (default: `thesis`)
- `MS_TEX` - LaTeX engine command (default: `pdflatex`)
- `MS_TEXFLAGS` - Compiler flags (default: `-interaction=nonstopmode -file-line-error`)
- `MS_BIB` - Bibliography processor: `biber` or leave empty for none (default: biber)

### Presentation variables
- `PR_FILE` - Main source file without `.tex` extension (default: `defense`)
- `PR_TEX` - LaTeX engine command (default: `pdflatex`)
- `PR_TEXFLAGS` - Compiler flags (default: `-shell-escape -interaction=nonstopmode -file-line-error`)
- `PR_BIB` - Bibliography processor (default: biber)

### Examples

Build manuscript with Biber bibliography:

```bash
make MS_BIB=biber manuscript
```

Build with different source file names:

```bash
make MS_FILE=mainThesis PR_FILE=presentation
```

List all available targets:

```bash
make help
```

## Project Structure Details

### Manuscript Organization

The main dissertation file (`manuscript/dissertation.tex`) uses `\include` commands to import chapters modularly:

```latex
\include{title}
\include{abs}
\include{ack}
\include{pub}
\include{intro}
\include{ch1}
\include{ch2}
\include{ch3}
\include{concl}
```

This modular structure allows:
- Selective compilation of individual chapters during editing
- Easy reordering of chapters
- Clean separation of concerns

### Custom Commands

Both documents include `custom.tex` for:
- Common package imports
- Custom command definitions
- Document-specific configurations

### Image Management

Images are organized by chapter to maintain clarity:

- Chapter-specific images in `img/ch1/`, `img/ch2/`, etc.
- Shared resources (logos) in `img/`
- All images use lowercase filenames for consistency across platforms

## Troubleshooting

**"Make: command not found"**
- macOS: `brew install make`
- Ubuntu/Debian: `apt install build-essential`
- Other systems: See your package manager

**"pdflatex: command not found"**
- Install a TeX distribution: `./configure` or manually install TeX Live

**Bibliography not appearing**
- Ensure `MS_BIB` or `PR_BIB` is set to `biber` or `bibtex`
- Example: `make MS_BIB=biber manuscript`

**PDF not updating**
- Run `make distclean` to remove all cache, then `make` to rebuild

## Outputs

Generated files:

- [manuscript/dissertation.pdf](manuscript/dissertation.pdf) - Full dissertation document
- [presentation/defense.pdf](presentation/defense.pdf) - Presentation slides
