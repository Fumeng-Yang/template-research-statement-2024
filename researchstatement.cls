\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{researchstatement}[2024/12/03]
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions
\LoadClass{article}

%--------------------------------------------------------------------------------
% Useful packages
\RequirePackage{amsmath}
\RequirePackage{graphicx,xcolor}
\RequirePackage{fontspec}
\RequirePackage[T1]{fontenc}
\RequirePackage{fancyhdr}
\RequirePackage{comment}
\RequirePackage{float}
\RequirePackage[hidelinks]{hyperref}
\RequirePackage{xspace}
\RequirePackage{xurl}
\RequirePackage{natbib} % the text after reference
\RequirePackage{microtype}
 \RequirePackage[strict]{changepage}
 \RequirePackage{setspace}
\setlength{\bibsep}{.5em plus .5em}
\renewcommand{\UrlFont}{\mainfont\fontsize{8.5pt}{8.5pt}\selectfont}

% page setup
\RequirePackage[letterpaper,top=1.75cm,bottom=1.75cm,left=1.75cm,right=1.75cm, footskip=.75cm]{geometry}
% package ends
%--------------------------------------------------------------------------------




%--------------------------------------------------------------------------------
% font
\newcommand*{\fontdir}[1][font/]{\def\@fontdir{#1}}
\fontdir

% mainbody font
\newfontfamily\mainfont[
  Path=\@fontdir,
  Extension = .ttf,
  UprightFont= *-Regular, % you can also try "*-Light"
  ItalicFont= *-Italic,
  BoldFont= *-Bold,
  BoldSlantedFont = *-BoldItalic,
  FontFace = {l}{n}{*-Light},
   FontFace = {l}{it}{*-LightItalic},
  FontFace = {m}{n}{*-Medium},
%  FontFace = {l}{it}{*-LightItalic},
  FontFace = {sb}{n}{*-Medium},
  FontFace = {sb}{it}{*-MediumItalic},
%  FontFace = {eb}{n}{*-Black},
%  FontFace = {eb}{it}{*-BlackItalic},
]{Roboto}%[LetterSpace=-.25]%, WordSpace=1.25

\DeclareRobustCommand{\smseries}{\fontseries{sb}\selectfont}
\DeclareRobustCommand{\ltseries}{\fontseries{l}\selectfont}
\DeclareRobustCommand{\mdseries}{\fontseries{m}\selectfont}
\DeclareTextFontCommand{\textsm}{\smseries}
\DeclareTextFontCommand{\textmd}{\mdseries}
\DeclareTextFontCommand{\textmi}{\smseries\itshape}
\DeclareTextFontCommand{\textli}{\ltseries\itshape}
\RequirePackage{caption} 
\DeclareCaptionFont{quack}{\mainfont}
\captionsetup{font=quack, labelfont=bf}

\newfontfamily\namefont[
  Path=\@fontdir,
  Extension = .ttf
]{Helvetica-Bold}[LetterSpace=.25]

% head font
\newfontfamily\hfont[
  Path=\@fontdir,
  Extension = .ttf,
  UprightFont= *-Regular,
  ItalicFont= *-Oblique,
  BoldFont= *-Bold,
  SlantedFont= *-Regular
]{Helvetica}


% font ends
%--------------------------------------------------------------------------------



%--------------------------------------------------------------------------------
% color 
% **** change these **** 
\definecolor{gray}{HTML}{888888}
\definecolor{darkgray}{HTML}{222222}
\definecolor{lightgray}{HTML}{aaaaaa} 
\definecolor{verylightgray}{HTML}{efefef} 
\definecolor{mysecondcolor}{HTML}{777777} 
\definecolor{headercolor}{HTML}{3a84cf}
\definecolor{sectioncolor}{HTML}{6196c7}
\definecolor{awardcolor}{HTML}{f5586a}
\definecolor{hookcolor}{HTML}{3a84cf}
% **** **** **** **** **** 
% color ends
%--------------------------------------------------------------------------------




%--------------------------------------------------------------------------------
% section format
\newcommand*{\headregularbigger}[1]{{\hfont\fontsize{16pt}{16pt}\selectfont#1}\space}
\newcommand*{\headregular}[1]{{\hfont\fontsize{16pt}{16pt}\selectfont#1}\space}

\newcommand*{\headboldbigger}[1]{{\hfont\bfseries\fontsize{16pt}{16pt}\selectfont#1}\space}
\newcommand*{\headbold}[1]{{\hfont\bfseries\fontsize{16pt}{16pt}\selectfont#1}\space}
\newcommand*{\headname}[1]{{\namefont\bfseries\fontsize{17pt}{17pt}\selectfont#1}\space}

\newcommand*{\footstyle}[1]{{\mainfont\fontsize{7pt}{7pt}\selectfont\color{mysecondcolor}{#1}}}
\newcommand*{\footstylesmaller}[1]{{\mainfont\fontsize{6.5pt}{6.5pt}\selectfont\color{mysecondcolor}{#1}}}


% section
\RequirePackage{titlesec} % Used to customize the \section command
\titleformat{\section}{\hfont\bfseries\fontsize{11.5pt}{11.5pt}\selectfont\raggedright}{}{0em}{} % Text formatting of sections
\titlespacing{\section}{1pt}{1pt}{1pt} % Spacing around sections

\titleformat{\subsection}{\hfont\slshape\fontsize{10pt}{10pt}\selectfont\raggedright}{}{0em}{} % Text formatting of sections
\titlespacing{\subsection}{0pt}{0pt}{0pt} % Spacing around sections


\titleformat{\subsubsection}{\hfont\slshape\fontsize{10.5pt}{10.5pt}\selectfont\raggedright}{}{0em}{} % Text formatting of sections
\titlespacing{\subsubsection}{3pt}{0pt}{0pt} % Spacing around sections


\titleformat{\paragraph}[runin]{\smseries\fontsize{9pt}{9pt}\selectfont\raggedright}{\llap{\parbox{\titleindent}{\N\hfill}}}{0em}{}
\titlespacing*{\paragraph}{0pt}{0em plus 0em minus 0em}{.5em plus 0ex}
%--------------------------------------------------------------------------------




%--------------------------------------------------------------------------------
% header 

% Set offset to each header and footer
\fancyhfoffset{0em}
% Remove head rule
\renewcommand{\headrulewidth}{0pt}
% Clear all header & footer fields
\fancyhf{}
% Enable if you want to make header or footer using fancyhdr
\pagestyle{fancy}
\newcommand{\dateseparator}{\raisebox{0pt}{\hspace{2.5pt}{\fontsize{6.5}{6.5}\selectfont{/}}\hspace{2pt}}} %dotsep
\newcommand*{\makefooter}[3]{%
  \fancyfoot[L]{\footstyle{#1} \color{mysecondcolor}{\rule[-1pt]{.5pt}{6pt}} \footstyle{#2}}
  \fancyfoot[C]{}
  \fancyfoot[R]{\footstylesmaller{#3}}
}

% the actually header
\newcommand*{\makeheader}[3]{%
\begin{minipage}{\textwidth}
   \flushleft
	\headname{\color{headercolor}{#1}} \hspace{1pt} \rule[-1.5pt]{1.5pt}{13pt} \hspace{3pt} \headbold{#2}\headregular{#3}
\end{minipage}\vspace*{10pt}%
}


\RequirePackage{everypage}
\RequirePackage{tikz}
\AddEverypageHook{  
\begin{tikzpicture}[remember picture,overlay]
\fill[hookcolor,xshift=-30mm,yshift=-248.75mm](0,0) rectangle(7mm,5mm);
\end{tikzpicture}
}

% header ends
%--------------------------------------------------------------------------------

%--------------------------------------------------------------------------------
% last page
\RequirePackage{lastpage}
% \RequirePackage{zref-lastpage}
% last page ends
%--------------------------------------------------------------------------------




%--------------------------------------------------------------------------------
%--------------------------------------------------------------------------------
% paragraph
\parindent 0pt
\linespread{1.5} 
\setlength{\parskip}{4pt}
\newcommand{\topicsep}{\vspace{3pt}}
% paragraph ends
%--------------------------------------------------------------------------------



%--------------------------------------------------------------------------------
% reusable notes
%\newcommand{\separator}{\raisebox{0pt}{\hspace{2.5pt}\bfseries{/}\hspace{2pt}}}
% \newcommand*{\separator}{\raisebox{1pt}{\hspace{5pt}\fontsize{3}{3}\selectfont$\bullet$}\hspace{4.5pt}} %\rule{.7pt}{7pt}

\newcommand*{\separator}{\raisebox{0pt}{\hspace{2.5pt}{\fontsize{7}{7}\selectfont{/}}\hspace{2pt}}} %dotsep
\newcommand{\thirdfont}[1]{\fontsize{8}{8}\textli{#1}}
\newcommand{\honorable}{\textsm{\textcolor{awardcolor}{Best Paper Honorable Mention Award}}}
\newcommand{\bestpaper}{\textsm{\textcolor{awardcolor}{Best Paper Award}}}
\newcommand{\honorableOne}{\textsm{\fontsize{9}{9}\selectfont\textcolor{awardcolor}{Best Paper Honorable Mention Award (top 1\%)}}}
\newcommand{\honorableFive}{\textsm{\fontsize{9}{9}\selectfont\textcolor{awardcolor}{Best Paper Honorable Mention Award  (top 5\%)}}}
\newcommand{\bestpaperOne}{\textsm{\fontsize{9}{9}\selectfont\textcolor{awardcolor}{Best Paper Award  (top 1\%)}}}


\newcommand{\etal}{\mbox{et~al.}\xspace}
\newcommand{\ie}{\mbox{i.e.,}\space}
\newcommand{\eg}{\mbox{e.g.,}\space}
\newcommand{\vs}{\mbox{vs.}\space}
\newcommand{\cf}{\mbox{cf.}\space}
\newcommand{\etals}{\mbox{et~al.'s}\space}
\newcommand{\etc}{\mbox{etc.}\space}

%--------------------------------------------------------------------------------




% ------------------------------------------------------------------------------------------------ 
% this is where we disable/enable the notes
% edit tricks
\newif\ifnotes
\notestrue % display notes
% \notesfalse % hide notes

\newcommand{\todo}[1]{\ifnotes{\leavevmode{\color{red}{[TODO: #1]}}\normalsize\ }\fi}

% ------------------------------------------------------------------------------------------------  



% formatting
% \RequirePackage[defaultlines=4,all]{nowidow}\setnoclub

\clubpenalties=2 10000 0
\widowpenalties=2 10000 0
\looseness=-10
