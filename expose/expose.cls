

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{expose}[2017/04/26 Expose Class]  % YYYY/MM/DD

\RequirePackage{ifthen}

\newboolean{german}
\setboolean{german}{false}
\DeclareOption{german}{\setboolean{german}{true}}

\ProcessOptions \relax

\ifthenelse{\boolean{german}}{
    \LoadClass[ngerman,a4paper,11pt]{scrartcl}
    \RequirePackage[ngerman]{babel}
}{
    \LoadClass[a4paper,11pt]{scrartcl}
}

\RequirePackage[utf8]{inputenc}
\RequirePackage[T1]{fontenc}
\RequirePackage{lmodern} % modern font

\RequirePackage{setspace}
\singlespacing

\RequirePackage{booktabs}

\clubpenalty = 10000
\widowpenalty = 10000


% label definitionen
\renewcommand{\labelitemi}{$\triangleright$}
\renewcommand{\labelitemii}{$\diamond$}
\renewcommand{\labelitemiii}{$\circ$}

\RequirePackage{enumerate}

\RequirePackage{amsmath}
\RequirePackage[usenames,dvipsnames]{color}
\RequirePackage{xcolor}

\RequirePackage{listings}
\lstset{tabsize=4,
    basicstyle=\footnotesize\ttfamily,
    stringstyle=\color{Orange},
    showstringspaces=false,
    columns=fixed,
    numbers=left,
    numberstyle=\tiny\ttfamily,
    numbersep=15pt,
    commentstyle=\color{LimeGreen},
    language=[GNU]C++,
    identifierstyle=\color{MidnightBlue}}


\RequirePackage{graphicx}
\RequirePackage[colorlinks]{hyperref}
\RequirePackage[colorinlistoftodos]{todonotes} % todonotes

\RequirePackage{lipsum} % filltexts
\RequirePackage{amssymb}
\RequirePackage{ulem}

% custom color definitions
\definecolor{lightblue}{rgb}{0,0.6,1.0}
\definecolor{lightgray}{rgb}{0.4,0.4,0.4}
\definecolor{blue}{rgb}{0,0.3,0.6}
\definecolor{darkblue}{rgb}{0,0.1,0.4}
\definecolor{green}{rgb}{0,0.7,0.2}


% colors for headlines
\addtokomafont{section}{\color{darkblue}}
\addtokomafont{subsection}{\color{blue}}
\addtokomafont{subsubsection}{\color{lightgray}}
\addtokomafont{paragraph}{\color{blue}}

% Page settings FIXME: maybe use default or geometry
\setlength{\topmargin}{1cm}
\setlength{\headheight}{12pt}
\setlength{\headsep}{20pt}
\setlength{\topskip}{12pt}
\setlength{\evensidemargin}{0pt}
\setlength{\oddsidemargin}{0pt}
\setlength{\textheight}{250mm}
\setlength{\textwidth}{160mm}
\setlength{\voffset}{-2cm}
\setlength{\parindent}{0pt}
\setlength{\parskip}{6pt}


% font settings
\renewcommand*\familydefault{\sfdefault}
\setkomafont{sectioning}{\normalfont\bfseries}
\setkomafont{descriptionlabel}{\normalfont\bfseries}
\setkomafont{captionlabel}{\bfseries\footnotesize}
\setkomafont{caption}{\footnotesize}

\RequirePackage{pgfgantt}
\usetikzlibrary{shadows}
\usetikzlibrary{shadings}


% custom commands
\newcommand{\G}[1]{{\color{green!45!black}#1}}
\newcommand{\R}[1]{{\color{red!45!black}#1}}
\newcommand{\hide}[1]{}
\newcommand{\todoI}[1]{\todo[inline]{#1}}
\newcommand{\note}[1]{\todo[inline,color=green!40]{#1}}

\newcommand{\thesistype}[1]{\gdef\thethesistype{#1}}
\newcommand{\advisors}[1]{\gdef\theadvisors{#1}}
\newcommand{\chair}[1]{\gdef\thechair{#1}}

\let\endtitlepage\relax % no page break after title
\renewcommand*{\maketitle}{%
\begin{titlepage}
\begin{center}
{\color{darkblue}
    {\huge \bfseries
    \@title \\[1em]
    }
    {\large
    Expose \thethesistype \\[1em]
    }
}
{\normalsize
 \color{lightgray}\textit{\@author}\\[0.5em]
 {\footnotesize
  \thechair: \theadvisors
 }\\[0.5em]
 \color{lightgray}
 \@date
}
\end{center}
\end{titlepage}
}

\usepackage[style=numeric,
            natbib=true
           ]{biblatex}

\chair{AVT}

\sloppy