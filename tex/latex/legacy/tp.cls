\NeedsTeXFormat{LaTeX2e}
\ProvidesPackage{tp}[2012/06/01 LaTeX package for practical exercices]

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax
\LoadClass[a4paper]{article}

\RequirePackage[includeheadfoot,margin=15mm]{geometry}
\RequirePackage[xetex]{graphicx}
\RequirePackage{fontspec,xunicode}
\RequirePackage{fancyhdr}
\RequirePackage{ifthen}

\setmainfont[Mapping=tex-text]{Frutiger 55 Roman}
\pagestyle{fancy}

\newcommand{\@lecture}{\@empty}
\newcommand{\lecture}[1]{%
  \renewcommand{\@lecture}{#1}%
}
\newcommand{\@students}{\@empty}
\newcommand{\students}[1]{%
  \renewcommand{\@students}{#1}%
}
\newcommand{\@subtitle}{\@empty}
\newcommand{\subtitle}[1]{%
  \renewcommand{\@subtitle}{#1}%
}
\renewcommand{\maketitle}{%
  \thispagestyle{empty}%
  \vspace*{-20mm}%
  \noindent%
  \begin{minipage}[b]{\textwidth}%
    \parbox[2cm]{10cm}{\includegraphics[width=10cm]{eia-fr.pdf}}%
    \hfill%
    \parbox[2cm]{7cm}{%
    \begin{flushright}%
      {\large\textbf{\@lecture}}\\%
      \@students
  \end{flushright}%
  }%
  \end{minipage}
  \vspace*{3mm}%

  \begin{center}%
  \hrulefill%
  \medskip

  \noindent%
  {\huge\bf\@title}
  \ifthenelse{\equal{\@subtitle}{}}{}{
  
  \@subtitle
  }
  \noindent%

  \hrulefill%
  \end{center}%
  \vspace*{1mm}%
}

