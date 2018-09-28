
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{phdthesis}[2017/04/26 Thesis Class]  % YYYY/MM/DD


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
            BCOR=10mm,
            DIV=16,
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
            DIV=16,
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
            BCOR=10mm,
            DIV=16,
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
            DIV=16,
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

\RequirePackage[automark]{scrpage2}


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

\definecolor{TUILOrange}     {RGB}{255, 121, 0}
\definecolor{TUILBlack}      {RGB}{0, 0, 0}
\definecolor{TUILGreen}       {RGB}{0, 116, 122}
\definecolor{TUILBlue}       {RGB}{0, 51, 89}
\definecolor{TUILGray}     {RGB}{149,149,149}


\renewcommand*{\sectionformat}{%
  \textcolor{TUILGreen}{{\thesection\autodot\enskip}}%
}
\renewcommand*{\subsectionformat}{%
  \textcolor{TUILGray}{{\thesubsection\autodot\enskip}}%
}

\RedeclareSectionCommand[
  beforeskip=0pt,
  afterskip=1\baselineskip
]{chapter}


\definecolor{rulecolor}{named}{TUILBlue}
\addtokomafont{chapter}{\color{TUILBlue}}
\addtokomafont{section}{}

\RequirePackage{framed}
\renewenvironment{leftbar}{%
  \def\FrameCommand{\textcolor{TUILOrange}{\vrule width 3pt}\hspace{10pt}}%
  \MakeFramed{\advance\hsize-\width\FrameRestore}}%
{\endMakeFramed}


\newcommand\titlerule[1][1pt]{\textcolor{rulecolor}{\rule{\textwidth}{#1}}}
\renewcommand\chapterlineswithprefixformat[3]{%
  \ifstr{#2}{}{}{\titlerule[2pt]\par\nobreak}%
  #2#3\par\nobreak\titlerule[1pt]%
}
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
    citecolor={TUILOrange},
    filecolor={darkgray},
    filecolor=darkgray,
    urlcolor={darkgray}
    }

% header and footer
%\clearscrheadfoot
%\chead{\headmark} % add chapter names
%\ofoot[\pagemark]{\pagemark} % add page numbers
\pagestyle{scrheadings}


% paragraph settings
\setlength{\parindent}{0pt}
\setlength{\parskip}{6pt}


% font settings
% Palatino for rm and math | Helvetica for ss | Courier for tt
\RequirePackage{mathpazo} % math & rm
\linespread{1.05}        % Palatino needs more leading (space between lines)
\RequirePackage[scaled]{helvet} % ss
\RequirePackage{courier} % tt
\normalfont
\RequirePackage[T1]{fontenc}

\RequirePackage[T1]{fontenc}
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
\newcommand{\thesisfor}[1]{\gdef\thethesisfor{#1}}
\newcommand{\authorbirthday}[1]{\gdef\theauthorbirthday{#1}}


\newcommand{\profOne}[1]{\gdef\theprofOne{#1}}
\newcommand{\profTwo}[1]{\gdef\theprofTwo{#1}}
\newcommand{\supervisor}[1]{\gdef\thesupervisor{#1}}
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
        \thechair \\[5em]
    \end{center}
    \centering
    % topic
    {\LARGE \textsc \thethesistype}\\[1em]
    {\large \thethesisfor} \\[1.5cm]

    \parbox{\textwidth}{\centering \LARGE \textbf \@title } \\[1.5cm]

    % author info
    \ifthenelse{\boolean{german}}{
        \begin{tabular}{rl}
            \hline \\
            vorgelegt von:               & \@author \\
            geboren am:                  & \theauthorbirthday \\[0.5em]
            Betreuender Gutachter:       & \thesupervisor \\[0.5em]
            Gutachter:  & \theprofOne \\
            Gutachter: & \theprofTwo \\
        \end{tabular}
        \\[6em]
        \thelocatin, den \today
    }{
        \begin{tabular}{rl}
            \hline \\
            vorgelegt von:               & \@author \\
            geboren am:                  & \theauthorbirthday \\[0.5em]
            Betreuender Gutachter:       & \thesupervisor \\[0.5em]
            Gutachter:  & \theprofOne \\
            Gutachter: & \theprofTwo \\
        \end{tabular}
        \\[6em]
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
\addchap*{Zusammenfassung}
#1
\clearpage
\addchap*{Abstract}
#2
\endgroup
}


\newcommand{\declaration}{
    \thispagestyle{empty}
    \pagenumbering{gobble}
    \ifthenelse{\boolean{german}}{
        \addchap*{Erklärung}
        \addchap*{Declaration}
        Ich versichere, dass ich die vorliegende Arbeit ohne unzulässige Hilfe Dritter und ohne Benutzung anderer als der angegebenen Hilfsmittel angefertigt habe.
        Die aus anderen Quellen direkt oder indirekt übernommenen Daten und Konzepte sind unter Angabe der Quelle gekennzeichnet.


        Bei der Auswahl und Auswertung folgenden Materials haben mir die nachstehend aufgeführten Personen in der jeweils beschriebenen Weise \sout{entgeltlich}/unentgeltlich geholfen:
        \begin{enumerate}
            \item ....
            \item ...
            \item ...
        \end{enumerate}
        Weitere Personen waren an der inhaltlich-materiellen Erstellung der vorliegenden Arbeit nicht beteiligt.
        Insbesondere habe ich hierfür nicht die entgeltliche Hilfe von Vermittlungs bzw. Beratungsdiensten (Promotionsberater oder anderer Personen) in Anspruch genommen.
        Niemand hat von mir unmittelbar oder mittelbar geldwerte Leistungen für Arbeiten erhalten, die im Zusammenhang mit dem Inhalt der vorgelegten Dissertation stehen.


        Die Arbeit wurde bisher weder im In- noch im Ausland in gleicher oder ähnlicher Form einer Prüfungsbehörde vorgelegt.
        Ich bin darauf hingewiesen worden, dass die Unrichtigkeit der vorstehenden Erklärung als Täuschungsversuch bewertet wird und gemäß § 7 Abs. 10 der Promotionsordnung den Abbruch des Promotionsverfahrens zur Folge hat.
    }{
        \addchap*{Declaration}
        Ich versichere, dass ich die vorliegende Arbeit ohne unzulässige Hilfe Dritter und ohne Benutzung anderer als der angegebenen Hilfsmittel angefertigt habe.
        Die aus anderen Quellen direkt oder indirekt übernommenen Daten und Konzepte sind unter Angabe der Quelle gekennzeichnet.


        Bei der Auswahl und Auswertung folgenden Materials haben mir die nachstehend aufgeführten Personen in der jeweils beschriebenen Weise \sout{entgeltlich}/unentgeltlich geholfen:
        \begin{enumerate}
            \item ....
            \item ...
            \item ...
        \end{enumerate}
        Weitere Personen waren an der inhaltlich-materiellen Erstellung der vorliegenden Arbeit nicht beteiligt.
        Insbesondere habe ich hierfür nicht die entgeltliche Hilfe von Vermittlungs bzw. Beratungsdiensten (Promotionsberater oder anderer Personen) in Anspruch genommen.
        Niemand hat von mir unmittelbar oder mittelbar geldwerte Leistungen für Arbeiten erhalten, die im Zusammenhang mit dem Inhalt der vorgelegten Dissertation stehen.


        Die Arbeit wurde bisher weder im In- noch im Ausland in gleicher oder ähnlicher Form einer Prüfungsbehörde vorgelegt.
        Ich bin darauf hingewiesen worden, dass die Unrichtigkeit der vorstehenden Erklärung als Täuschungsversuch bewertet wird und gemäß § 7 Abs. 10 der Promotionsordnung den Abbruch des Promotionsverfahrens zur Folge hat.
    }
    \vspace{1cm} \\
    \thelocatin, \today \\[2em]
    \textsc{\@author}
    \rule[-0.2cm]{5cm}{0.5pt}
}



\RequirePackage[style=alphabetic,
                natbib=true
               ]{biblatex}


