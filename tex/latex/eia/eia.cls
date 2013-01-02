\NeedsTeXFormat{LaTeX2e}
\ProvidesPackage{eia}[2012/12/25 LaTeX package for EIA Documents]

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax
\LoadClass[a4paper]{article}

\RequirePackage[french]{babel}
\RequirePackage{calc}
\RequirePackage{layouts}
\RequirePackage{parskip}
\RequirePackage{afterpage}
\RequirePackage[xetex]{graphicx}
\RequirePackage{fontspec,xunicode}
\RequirePackage[absolute]{textpos}
\RequirePackage{titlesec}
\RequirePackage{fancyhdr}
\RequirePackage{ifthen}
\RequirePackage{color}
\RequirePackage[usenames,dvipsnames,svgnames,table]{xcolor}

\input{eia.def}
\pagestyle{fancy}

\fancyhead[LE,LO]{\slshape\textcolor{eia-gray}{\nouppercase\leftmark}}
\fancyhead[RE,RO]{}{}
\renewcommand{\headrule}{\raisebox{2mm}{\vbox to 0pt{\hbox
to\headwidth{{\textcolor{blue3015}{\dotfill}}}\vss}}}

\renewcommand{\maketitle}{%
  \enlargethispage{-10mm}
  \thispagestyle{empty}%
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
  \vspace*{5mm}
}

