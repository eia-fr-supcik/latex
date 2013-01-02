\NeedsTeXFormat{LaTeX2e}
\ProvidesPackage{eia-exam}[2012/12/29 LaTeX package for EIA Exams]

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{exam}}
\ProcessOptions\relax
\LoadClass[a4paper]{exam}

\RequirePackage{calc}
\RequirePackage{layouts}
\RequirePackage{parskip}
\RequirePackage{afterpage}
\RequirePackage[xetex]{graphicx}
\RequirePackage{fontspec,xunicode}
\RequirePackage[absolute]{textpos}
\RequirePackage{titlesec}
\RequirePackage{ifthen}
\RequirePackage{color}
\RequirePackage[usenames,dvipsnames,svgnames,table]{xcolor}
\RequirePackage{tikz}

\input{eia.def}

\newcommand{\@lecture}{\@empty}
\newcommand{\lecture}[1]{%
  \renewcommand{\@lecture}{#1}%
}
\newcommand{\@students}{\@empty}
\newcommand{\students}[1]{%
  \renewcommand{\@students}{#1}%
}
\newcommand{\@lecturer}{\@empty}
\newcommand{\lecturer}[1]{%
  \renewcommand{\@lecturer}{#1}%
}
\newcommand{\@subtitle}{\@empty}
\newcommand{\subtitle}[1]{%
  \renewcommand{\@subtitle}{#1}%
}
\newcommand{\@examnotes}{\@empty}
\newcommand{\examnotes}[1]{%
  \renewcommand{\@examnotes}{#1}%
}

\definecolor{SolutionColor}{rgb}{0.8,0.9,1}

\newif\ifexam
\examfalse

\renewcommand*\@fullfoot{%
  \vbox to 0pt{%
    \if@footrule
      \hrule
    \else
      % an invisible hrule, to keep positioning constant:
      \hrule width 0pt
    \fi
    \vskip 3pt
    \hbox to \textwidth{%
      \normalfont\rlap{\parbox[t]{\textwidth}{\raggedright\color{eia-gray}\@lfoot}}%
        \hss\parbox[t]{\textwidth}{\centering\color{eia-gray}\@cfoot}\hss
        \llap{\parbox[t]{\textwidth}{\raggedleft\color{eia-gray}\@rfoot}}%
    }% hbox
    \vss
  }% vbox
}

\renewcommand*\run@fullhead{%
  \vbox to \headheight{%
    \vss
    \hbox to \textwidth{%
      \normalfont\rlap{\parbox[b]{\textwidth}{\raggedright\color{eia-gray}\run@lhead\strut}}%
        \hss\parbox[b]{\textwidth}{\centering\color{eia-gray}\run@chead\strut}\hss
        \llap{\parbox[b]{\textwidth}{\raggedleft\color{eia-gray}\run@rhead\strut}}%
    }% hbox
    \ifrun@headrule
      \vspace*{3pt}
      {\vbox to 0pt{\hbox
      to\textwidth{{\textcolor{eia-blue}{\dotfill}}}\vss}}
    \else
      % an invisible hrule, to keep positioning constant:
      \hrule width 0pt
    \fi
  }% vbox
}

\renewcommand*\run@fullfoot{%
  \vbox to 0pt{%
    \ifrun@footrule
      {\vbox to 0pt{\hbox
      to\textwidth{{\textcolor{eia-blue}{\dotfill}}}\vss}}
      \hrule width 0pt
    \else
      % an invisible hrule, to keep positioning constant:
      \hrule width 0pt
    \fi
    \vskip 5pt
    \hbox to \textwidth{%
      \normalfont\rlap{\parbox[t]{\textwidth}{\raggedright\color{eia-gray}\run@lfoot}}%
        \hss\parbox[t]{\textwidth}{\centering\color{eia-gray}\run@cfoot}\hss
        \llap{\parbox[t]{\textwidth}{\raggedleft\color{eia-gray}\run@rfoot}}%
    }% hbox
    \vss
  }% vbox
}

\runningheader%
  {\@title} {}{\@lecture { }/ \@students}
\firstpagefooter{}{\@lecturer}{%
\iflanguage{german}{Seite}{Page}
\thepage\ \iflanguage{german}{von}{de} \numpages}
\runningfooter{%
\iflanguage{german}%
{Hochschule für Technik und Architektur Freiburg}%
{École d'ingénieurs et d'architectes de Fribourg}%
}{}{\iflanguage{german}{Seite}{Page}
\thepage\ \iflanguage{german}{von}{de} \numpages}
\runningfootrule
\runningheadrule
\shadedsolutions

\renewcommand{\maketitle}{%
  \enlargethispage{-10mm}
  \textblockorigin{0mm}{0mm}
  \begin{textblock*}{4cm}(18.5mm, 11mm)
  \includegraphics[scale=0.9]{images/eia_dots.pdf}
  \end{textblock*}
  \begin{textblock*}{5cm}(8.2153mm, 267mm)
  \includegraphics[scale=0.4875]{images/hesso_fr_dots_line.pdf}
  \end{textblock*}
  \vspace*{17mm}
  \noindent%
  {\huge\bf\textcolor{eia-gray}{\@title}}
  \ifthenelse{\equal{\@subtitle}{}}{}{

  {\LARGE\itshape\textcolor{eia-gray}{\@subtitle}}
  }

  {\Large\bf\textcolor{eia-gray}{\@lecture { }/ \@students}}
  \ifexam

  \vspace{5mm}
  \begin{tikzpicture}[rounded corners=2mm]
  \draw [line width=0.7mm] (0, 0) rectangle +(10, 2);
  \draw [line width=0.5mm] (0, 1) -- +(10, 0);
  \draw [line width=0.2mm] (2.2, 0) -- +(0, 2);
  \draw (0.2,1.5) node [right] {\large \iflanguage{german}{Vorname}{Prénom}};
  \draw (0.2,0.5) node [right] {\large \iflanguage{german}{Name}{Nom}};
  \end{tikzpicture}
  \hfill
  \begin{tikzpicture}[rounded corners=2mm]
  \draw [line width=0.7mm, red] (0, 0) rectangle +(5, 2);
  \draw [line width=0.5mm, red] (0, 1) -- +(5, 0);
  \draw [line width=0.2mm, red] (1.85, 0) -- +(0, 2);
  \draw (0.2,1.5) node [red, right] {\large \iflanguage{german}{Punkte}{Points}};
  \draw (0.2,0.5) node [red, right] {\large Note};
  \draw (4.8,0.5) node [red, left] {\large / 6.0};
  \draw (4.8,1.5) node [red, left] {\large / \numpoints};
  \end{tikzpicture}
  \vspace{1mm}

  \begin{tikzpicture}[rounded corners=2mm]
  \draw [line width=0.3mm, red] (0, 0) rectangle +(15.88, 1.8);
  \draw (0.2,1.3) node [right, red] {\iflanguage{german}{Bemerkungen}{Remarques}};
  \end{tikzpicture}

  {\large\bf\color{eia-blue}\@examnotes}
  \fi

  \vspace*{5mm}
}

