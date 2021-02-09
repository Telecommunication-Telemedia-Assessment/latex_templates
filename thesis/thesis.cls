
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{thesis}[2017/04/26 Thesis Class]  % YYYY/MM/DD


\RequirePackage{ifthen}

\newboolean{german}
\setboolean{german}{false}
\DeclareOption{german}{\setboolean{german}{true}}

\newboolean{coloredheadlines}
\setboolean{coloredheadlines}{false}
\DeclareOption{coloredheadlines}{\setboolean{coloredheadlines}{true}}

\newboolean{twoside}
\setboolean{twoside}{false}
\DeclareOption{twoside}{\setboolean{twoside}{true}}

\ProcessOptions \relax


\ifthenelse{\boolean{german}}{
    \ifthenelse{\boolean{twoside}}{
        \LoadClass[
            ngerman,
            a4paper,
            twoside, % two pages
            openright,
            cleardoublepage=plain,
            headsepline,
            footsepline,
            chapterprefix, % Chapter X
            numbers=noenddot,
            12pt,
            fleqn,
            bibliography=totoc, % add bibliography to table of contents
            listof=totoc % add all other lists to toc
        ]{scrreprt}
    }{
        \LoadClass[
            ngerman,
            a4paper,
            headsepline,
            footsepline,
            chapterprefix, % Chapter X
            numbers=noenddot,
            12pt,
            fleqn,
            bibliography=totoc, % add bibliography to table of contents
            listof=totoc % add all other lists to toc
        ]{scrreprt}
    }
    \RequirePackage[ngerman]{babel}
    \RequirePackage{csquotes} % for german quotes
}{
    \ifthenelse{\boolean{twoside}}{
        \LoadClass[
            english,
            a4paper,
            twoside, % two pages
            openright,
            cleardoublepage=plain,
            headsepline,
            footsepline,
            chapterprefix, % Chapter X
            numbers=noenddot,
            12pt,
            fleqn,
            bibliography=totoc, % add bibliography to table of contents
            listof=totoc % add all other lists to toc
        ]{scrreprt}
    }{
        \LoadClass[
            english,
            a4paper,
            %twoside, % two pages
            %openright,
            %cleardoublepage=plain,
            headsepline,
            footsepline,
            chapterprefix, % Chapter X
            numbers=noenddot,
            12pt,
            fleqn,
            bibliography=totoc, % add bibliography to table of contents
            listof=totoc % add all other lists to toc
        ]{scrreprt}
    }
    \RequirePackage[english]{babel}
    \RequirePackage{csquotes} % for german quotes
}

% packages
\RequirePackage[utf8]{inputenc}

% fülltext spielerein
\RequirePackage{lipsum}
\RequirePackage{blindtext}

\RequirePackage[normalem]{ulem}
\RequirePackage{fancybox}

\RequirePackage{graphicx}
\RequirePackage[usenames,dvipsnames]{xcolor}
\RequirePackage{url}

\RequirePackage{listings}

\RequirePackage{longtable}
\RequirePackage{tabularx}
\RequirePackage{multicol,multirow}
\RequirePackage{colortbl}

\RequirePackage{latexsym}
\RequirePackage{amsmath}
\RequirePackage{float,placeins}

\renewcommand{\labelitemi}{$\triangleright$}
\renewcommand{\labelitemii}{$\diamond$}
\renewcommand{\labelitemiii}{$\circ$}

\RequirePackage{amssymb}

%\RequirePackage[automark]{scrpage2}


% latex pictures
\RequirePackage{tikz}
\usetikzlibrary{shapes,snakes,arrows,matrix,calc,er}
\RequirePackage{pgfplots}

\RequirePackage{booktabs}
\RequirePackage{algorithm2e}

\RequirePackage[colorinlistoftodos]{todonotes} % todonotes

\RequirePackage{caption}
\RequirePackage{subcaption}


% color definitions
\definecolor{lightblue}{rgb}{0,0.6,1.0}
\definecolor{lightgray}{rgb}{0.6,0.6,0.6}
\definecolor{darkgray}{rgb}{0.4,0.4,0.4}
\definecolor{blue}{rgb}{0,0.3,0.6}
\definecolor{darkblue}{rgb}{0,0.1,0.4}
\definecolor{green}{rgb}{0,0.7,0.2}



% Paket für Links innerhalb des PDF Dokuments
\RequirePackage[%
    %pdftitle={\thema{}},% Titel der erzeugten PDF Datei
    %pdfauthor={\author{}},%
    %pdfcreator={LaTeX Skript by stg7},
    %pdfsubject={\thema{}},%
    %pdfkeywords={\schluesselwoerter{}}
    bookmarksopen=true,%
    bookmarksopenlevel=1,%
    plainpages=false%
    ]{hyperref}

\hypersetup{%
    colorlinks=true,% links einfaerben, oder box drum malen?
    linkcolor={darkgray},% verweise im doc, ua inhaltsverzeichnis
    citecolor={darkgray},
    filecolor={black},
    filecolor=darkgray,
    urlcolor={darkgray}
    }

% header and footer
%\clearscrheadfoot
%\chead{\headmark} % add chapter names
%\ofoot[\pagemark]{\pagemark} % add page numbers
\pagestyle{scrheadings}


% page layout

\setlength{\topmargin}{0.5cm}
\setlength{\headheight}{12pt}
\setlength{\headsep}{10pt}
\setlength{\topskip}{12pt}
\setlength{\evensidemargin}{0pt}
\setlength{\oddsidemargin}{0pt}
\setlength{\textheight}{240mm}
\setlength{\textwidth}{160mm}
\setlength{\voffset}{-2cm}
\setlength{\parindent}{0pt}
\setlength{\parskip}{6pt}


% font settings
\RequirePackage[T1]{fontenc}
\RequirePackage{lmodern} % modern font
\renewcommand*\familydefault{\sfdefault}

\setkomafont{sectioning}{\normalfont\bfseries}
\setkomafont{descriptionlabel}{\normalfont\bfseries}
\setkomafont{captionlabel}{\bfseries\footnotesize}
\setkomafont{caption}{\footnotesize}

% colored headlines
\ifthenelse{\boolean{coloredheadlines}}{
    \addtokomafont{chapter}{\color{darkblue}}
    \addtokomafont{section}{\color{darkblue}}
    \addtokomafont{subsection}{\color{blue}}
    \addtokomafont{subsubsection}{\color{lightgray}}
    \addtokomafont{paragraph}{\color{blue}}
}{

}


% own commands
\newcommand{\hide}[1]{}
\newcommand{\whide}[1]{\textcolor{white}{#1}}
\newcommand{\todoI}[1]{\todo[inline]{#1}}
\newcommand{\note}[1]{\todo[inline,color=green!40]{#1}}
\newcommand{\last}[1]{\todo[inline,color=blue!40]{#1}}

\newcommand{\G}[1]{{ \color{green!45!black}#1}}
\newcommand{\R}[1]{{ \color{red!45!black}#1}}
\newcommand{\B}[1]{{ \color{blue!70!black}#1}}
\newcommand{\W}[1]{{ \color{white}#1}}



\RequirePackage{setspace}
\onehalfspacing

\RequirePackage{enumitem}
\RequirePackage[printonlyused,nohyperlinks]{acronym} % acronyms


%listing setup
\lstset{tabsize=4,
    basicstyle=\footnotesize\ttfamily,
    stringstyle=\color{Orange},
    showstringspaces=false,
    columns=fixed,
    numberstyle=\tiny\ttfamily,
    numbersep=15pt,
    commentstyle=\color{LimeGreen},
    language=[GNU]C++,
    identifierstyle=\color{MidnightBlue}}

\lstset{
    numbers=right,
    xrightmargin=2em,
    breaklines=true,
    breakatwhitespace=true,
    prebreak=\mbox{\tiny$\searrow$},
        postbreak=\mbox{{\color{blue}\tiny$\rightarrow$}},
    numberbychapter=false,
}


\DeclareGraphicsExtensions{.pdf,.png,.jpg}

\RequirePackage[all]{nowidow}

\newcommand{\thesistype}[1]{\gdef\thethesistype{#1}}
\newcommand{\professor}[1]{\gdef\theprofessor{#1}}
\newcommand{\advisor}[1]{\gdef\theadvisor{#1}}
\newcommand{\chair}[1]{\gdef\thechair{#1}}
\newcommand{\course}[1]{\gdef\thecourse{#1}}
\newcommand{\faculty}[1]{\gdef\thefaculty{#1}}
\newcommand{\institut}[1]{\gdef\theinstitut{#1}}
\newcommand{\locatin}[1]{\gdef\thelocatin{#1}}



\renewcommand*{\maketitle}{%
\begin{titlepage}
   \begin{center}
        \includegraphics[scale=1.4]{images/logo.pdf} \\[1em]

        % general
        \thefaculty \\
        \theinstitut \\
        \thechair \\[8em]
    \end{center}
    \centering
    % topic
    {\LARGE \textsc \thethesistype} \\[1cm]

    \parbox{\textwidth}{\centering \LARGE \textbf \@title } \\[2cm]

    % author info
    \ifthenelse{\boolean{german}}{
        \begin{tabular}{rl}
            \hline \\
            vorgelegt von:               & \@author \\[0.5em]
            Studiengang:                 & \thecourse \\[0.5em]
            Verantwortlicher Professor:  & \theprofessor \\
            Wissenschaftlicher Betreuer: & \theadvisor \\
        \end{tabular}
        \\[10em]
        \thelocatin, den \today
    }{
        \begin{tabular}{rl}
            \hline \\
            Submitted by:                & \@author \\[0.5em]
            Major:                       & \thecourse \\[0.5em]
            Advisor:                     & \theprofessor \\
            Co-Advisor:                  & \theadvisor \\
        \end{tabular}
        \\[10em]
        \thelocatin, \today
    }
    \pagenumbering{gobble}
\end{titlepage}
}

\ifthenelse{\boolean{german}}{
    \faculty{Fakultät für Elektrotechnik und Informationstechnik}
    \institut{Institut für Medientechnik}
    \chair{Fachgebiet Audiovisuelle Technik}

}{
    \faculty{Faculty of Electrical Engineering and Information Technology}
    \institut{Institute for Media Technology}
    \chair{Audio Visual Technology}
}

\locatin{Ilmenau}


\newcommand{\acknowledgments}[1]{
\ifthenelse{\boolean{german}}{
    \addchap*{Danksagung}
}{
    \addchap*{Acknowledgments}
}
\thispagestyle{empty}
~ \\[4em]
#1
}

\newcommand{\bothabstracts}[2]{
\begingroup
\let\cleardoublepage\relax
\section*{Zusammenfassung}
#1
%\clearpage
\section*{Abstract}
#2
\endgroup
}


\newcommand{\declaration}{
    \thispagestyle{empty}
    \pagenumbering{gobble}
    \ifthenelse{\boolean{german}}{
        \addchap*{Erklärung}
        Ich versichere, dass ich die Arbeit ohne fremde Hilfe und ohne Benutzung anderer als der angegebenen Quellen angefertigt habe und dass die Arbeit in gleicher oder ähnlicher Form noch keiner anderen Prüfungsbehörde vorgelegen hat und von dieser als Teil einer Prüfungsleistung angenommen wurde.\\
        Alle Ausführungen, die wörtlich oder sinngemäß übernommen wurden, sind als solche gekennzeichnet.
    }{
        \addchap*{Declaration}
        I declare that the work is entirely my own and was produced with no assistance from third parties.\\
        I certify that the work has not been submitted in the same or any similar form for assessment to any other examining body and all references, direct and indirect, are indicated as such and have been cited accordingly.
    }
    \vspace{3cm}
    \thelocatin,
    \newline
    \rule[-0.2cm]{5cm}{0.5pt}
    \textsc{\author}
}



\RequirePackage[style=alphabetic,
                natbib=true,
                backend=bibtex
               ]{biblatex}

