
% class file for FEM2012 workshop LaTex template

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{fem2012}
\LoadClass[11pt,letterpaper]{article}

\usepackage{amssymb}
\usepackage{ifthen}

\setlength{\topskip}{0in}
\setlength{\headheight}{0in}
\setlength{\headsep}{0in}
\setlength{\topsep}{0in}
\setlength{\textheight}{9in}
\setlength{\textwidth}{6.5in}
\setlength{\oddsidemargin}{0in}
\setlength{\topmargin}{0in}
\setlength{\parskip}{12pt}
\setlength{\parindent}{0pt}
\pagestyle{empty}

\renewcommand{\title}[1]{\newcommand{\FEM@title}{#1}}

\newcounter{author}
\renewcommand{\author}[2][]{
   \stepcounter{author}
   \@namedef{author@\theauthor}{#2}
   \@namedef{authorlabel@\theauthor}{#1}
}

\newcounter{address}
\newcommand{\address}[2][]{
   \stepcounter{address}
   \@namedef{address@\theaddress}{#2}
   \@namedef{addresslabel@\theaddress}{#1}
}

\newcommand{\alsep}{and}

\renewenvironment{abstract}{%
   \begin{center}%
    \begin{minipage}{6.5in}%
      \begin{center}%
    \begin{bfseries}\begin{Large}\FEM@title\\\end{Large}\end{bfseries}
    \vspace{2ex}
    \newcounter{c@author}
    \newcounter{c@tmp}
    \ifthenelse{\value{author}=2}{%
      \newcommand{\liand}{ and }}{%
      \newcommand{\liand}{, and }}
      \ifthenelse{\value{address}<2}{%
      \@nameuse{author@1}%
      \stepcounter{c@author}%
      \whiledo{\value{c@author}<\value{author}}{%
        \setcounter{c@tmp}{\value{author}}%
        \addtocounter{c@tmp}{-\value{c@author}}%
        \ifthenelse{\value{c@tmp}=1}{%
          \renewcommand{\alsep}{\liand}}{\renewcommand{\alsep}{, }}%
        \stepcounter{c@author}\alsep \@nameuse{author@\thec@author}}\\%
    }
    {
      \@nameuse{author@1}${}^{\ref{\@nameuse{authorlabel@1}}}$%
      \stepcounter{c@author}%
      \whiledo{\value{c@author}<\value{author}}{%
      \setcounter{c@tmp}{\value{author}}%
      \addtocounter{c@tmp}{-\value{c@author}}%
      \ifthenelse{\value{c@tmp}=1}{%
        \renewcommand{\alsep}{\liand}}{\renewcommand{\alsep}{, }}%
      \stepcounter{c@author}\alsep \@nameuse{author@\thec@author}%
        ${}^{\ref{\@nameuse{authorlabel@\thec@author}}}$%
      }
    }
    \vspace{0.0ex}

    \ifthenelse{\value{address}>0}{%
      \ifthenelse{\value{address}=1}{
        {\@nameuse{address@1}}
      }
      {
        \newcounter{c@address}
        \begin{center}
        \whiledo{\value{c@address}<\value{address}}
        {
          \refstepcounter{c@address}
            ${}^\thec@address$\,%
              \label{\@nameuse{addresslabel@\thec@address}}%
              \@nameuse{address@\thec@address}\\ %
        }
        \end{center}
      
      } 
    }
    {
      \relax
    }
    \end{center}
    \end{minipage}

  \end{center}

}{


\relax

\relax}
