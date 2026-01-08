\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{researchstatement}[2024/12/03]
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions
\LoadClass{article}

%--------------------------------------------------------------------------------
% Packages
%--------------------------------------------------------------------------------
\RequirePackage{amsmath}
\RequirePackage{graphicx}
\RequirePackage{xcolor}
\RequirePackage{fontspec}
\RequirePackage[T1]{fontenc}
\RequirePackage{fancyhdr}
\RequirePackage{comment}
\RequirePackage{float}
\RequirePackage[hidelinks]{hyperref}
\RequirePackage{xspace}
\RequirePackage{xurl}
\RequirePackage{natbib}
\RequirePackage{microtype}
\RequirePackage[strict]{changepage}
\RequirePackage{setspace}
\RequirePackage{titlesec}
\RequirePackage{caption}
\RequirePackage{everypage}
\RequirePackage{tikz}
\RequirePackage{lastpage}
\RequirePackage[letterpaper,top=1.75cm,bottom=1.75cm,left=1.75cm,right=1.75cm,footskip=.75cm]{geometry}

%--------------------------------------------------------------------------------
% Package Settings
%--------------------------------------------------------------------------------
\setlength{\bibsep}{.5em plus .5em}
\renewcommand{\UrlFont}{\fontsize{8.5pt}{8.5pt}\selectfont}

%--------------------------------------------------------------------------------
% Fonts
%--------------------------------------------------------------------------------
\newcommand*{\fontdir}[1][font/]{\def\@fontdir{#1}}
\fontdir

% Main body font
\setmainfont[
  Path=\@fontdir,
  Extension=.ttf,
  UprightFont=*-Regular, % you can try *-Light as well
  ItalicFont=*-Italic,
  BoldFont=*-Bold,
  BoldSlantedFont=*-BoldItalic,
  FontFace={l}{n}{*-Light},
  FontFace={l}{it}{*-LightItalic},
  FontFace={m}{n}{*-Medium},
  FontFace={sb}{n}{*-Medium},
  FontFace={sb}{it}{*-MediumItalic},
]{Roboto}

% Font series commands
\DeclareRobustCommand{\smseries}{\fontseries{sb}\selectfont}
\DeclareRobustCommand{\ltseries}{\fontseries{l}\selectfont}
\DeclareRobustCommand{\mdseries}{\fontseries{m}\selectfont}
\DeclareTextFontCommand{\textsm}{\smseries}
\DeclareTextFontCommand{\textmd}{\mdseries}
\DeclareTextFontCommand{\textmi}{\smseries\itshape}
\DeclareTextFontCommand{\textli}{\ltseries\itshape}

% Caption font
\DeclareCaptionFont{quack}{\small}
\captionsetup{font=quack,labelfont=bf}

% Name font
\newfontfamily\namefont[
  Path=\@fontdir,
  Extension=.ttf,
]{Helvetica-Bold}[LetterSpace=.25]

% Header font
\newfontfamily\hfont[
  Path=\@fontdir,
  Extension=.ttf,
  UprightFont=*-Regular,
  ItalicFont=*-Oblique,
  BoldFont=*-Bold,
  SlantedFont=*-Regular,
]{Helvetica}

%--------------------------------------------------------------------------------
% Colors
%--------------------------------------------------------------------------------
\definecolor{gray}{HTML}{888888}
\definecolor{darkgray}{HTML}{222222}
\definecolor{lightgray}{HTML}{aaaaaa}
\definecolor{verylightgray}{HTML}{efefef}
\definecolor{mysecondcolor}{HTML}{777777}
\definecolor{headercolor}{HTML}{3a84cf}
\definecolor{sectioncolor}{HTML}{6196c7}
\definecolor{awardcolor}{HTML}{f5586a}
\definecolor{hookcolor}{HTML}{3a84cf}

%--------------------------------------------------------------------------------
% Head Commands
%--------------------------------------------------------------------------------
\newcommand*{\headregularbigger}[1]{{\hfont\fontsize{16pt}{16pt}\selectfont#1}\space}
\newcommand*{\headregular}[1]{{\hfont\fontsize{16pt}{16pt}\selectfont#1}\space}
\newcommand*{\headboldbigger}[1]{{\hfont\bfseries\fontsize{16pt}{16pt}\selectfont#1}\space}
\newcommand*{\headbold}[1]{{\hfont\bfseries\fontsize{16pt}{16pt}\selectfont#1}\space}
\newcommand*{\headname}[1]{{\namefont\bfseries\fontsize{17pt}{17pt}\selectfont#1}\space}

% Footer Commands
\newcommand*{\footstyle}[1]{{\fontsize{7pt}{7pt}\selectfont\color{mysecondcolor}{#1}}}
\newcommand*{\footstylesmaller}[1]{{\fontsize{6.5pt}{6.5pt}\selectfont\color{mysecondcolor}{#1}}}

%--------------------------------------------------------------------------------
% Section Formatting
%--------------------------------------------------------------------------------
\titleformat{\section}{\hfont\bfseries\fontsize{11.5pt}{11.5pt}\selectfont\raggedright}{}{0em}{}
\titlespacing{\section}{1pt}{1pt}{1pt}

\titleformat{\subsection}{\hfont\slshape\fontsize{10pt}{10pt}\selectfont\raggedright}{}{0em}{}
\titlespacing{\subsection}{0pt}{0pt}{0pt}

\titleformat{\subsubsection}{\hfont\slshape\fontsize{10.5pt}{10.5pt}\selectfont\raggedright}{}{0em}{}
\titlespacing{\subsubsection}{3pt}{0pt}{0pt}

\titleformat{\paragraph}[runin]{\smseries\fontsize{9pt}{9pt}\selectfont\raggedright}{\llap{\parbox{\titleindent}{\N\hfill}}}{0em}{}
\titlespacing*{\paragraph}{0pt}{0em plus 0em minus 0em}{.5em plus 0ex}

%--------------------------------------------------------------------------------
% Header and Footer
%--------------------------------------------------------------------------------
\fancyhfoffset{0em}
\renewcommand{\headrulewidth}{0pt}
\fancyhf{}
\pagestyle{fancy}

\newcommand{\dateseparator}{\raisebox{0pt}{\hspace{2.5pt}{\fontsize{6.5}{6.5}\selectfont{/}}\hspace{2pt}}}

\newcommand*{\makefooter}[3]{%
  \fancyfoot[L]{\footstyle{#1} \color{mysecondcolor}{\rule[-1pt]{.5pt}{6pt}} \footstyle{#2}}
  \fancyfoot[C]{}
  \fancyfoot[R]{\footstylesmaller{#3}}
}

\newcommand*{\makeheader}[3]{%
  \begin{minipage}{\textwidth}
    \flushleft
    \headname{\color{headercolor}{#1}} \hspace{1pt} \rule[-1.5pt]{1.5pt}{13pt} \hspace{3pt} \headbold{#2}\headregular{#3}
  \end{minipage}\vspace*{10pt}%
}

% Page hook
\AddEverypageHook{%
  \begin{tikzpicture}[remember picture,overlay]
    \fill[hookcolor,xshift=-30mm,yshift=-248.75mm](0,0) rectangle(7mm,5mm);
  \end{tikzpicture}%
}

%--------------------------------------------------------------------------------
% Font Size Settings
%--------------------------------------------------------------------------------
\AtBeginDocument{%
  \fontsize{9pt}{9pt}\selectfont
}

%--------------------------------------------------------------------------------
% Paragraph Settings
%--------------------------------------------------------------------------------
\parindent 0pt
\linespread{1.5}
\setlength{\parskip}{4pt}
\newcommand{\topicsep}{\vspace{3pt}}

%--------------------------------------------------------------------------------
% Custom Commands
%--------------------------------------------------------------------------------
\newcommand*{\separator}{\raisebox{0pt}{\hspace{2.5pt}{\fontsize{7}{7}\selectfont{/}}\hspace{2pt}}}
\newcommand{\thirdfont}[1]{\fontsize{8pt}{8pt}\textli{#1}}
\newcommand{\reffont}{\fontsize{9pt}{9pt}\selectfont}

% Award commands
\newcommand{\honorable}{\textsm{\textcolor{awardcolor}{Best Paper Honorable Mention Award}}}
\newcommand{\bestpaper}{\textsm{\textcolor{awardcolor}{Best Paper Award}}}
\newcommand{\honorableOne}{\textsm{\fontsize{9}{9}\selectfont\textcolor{awardcolor}{Best Paper Honorable Mention Award (top 1\%)}}}
\newcommand{\honorableFive}{\textsm{\fontsize{9}{9}\selectfont\textcolor{awardcolor}{Best Paper Honorable Mention Award  (top 5\%)}}}
\newcommand{\bestpaperOne}{\textsm{\fontsize{9}{9}\selectfont\textcolor{awardcolor}{Best Paper Award  (top 1\%)}}}

% Abbreviation commands
\newcommand{\etal}{\mbox{et~al.}\xspace}
\newcommand{\ie}{\mbox{i.e.,}\space}
\newcommand{\eg}{\mbox{e.g.,}\space}
\newcommand{\vs}{\mbox{vs.}\space}
\newcommand{\cf}{\mbox{cf.}\space}
\newcommand{\etals}{\mbox{et~al.'s}\space}
\newcommand{\etc}{\mbox{etc.}\space}

%--------------------------------------------------------------------------------
% Notes and TODOs
%--------------------------------------------------------------------------------
\newif\ifnotes
\notestrue
% \notesfalse % Uncomment to hide notes

\newcommand{\todo}[1]{\ifnotes{\leavevmode{\color{red}{[TODO: #1]}}\normalsize\ }\fi}

%--------------------------------------------------------------------------------
% Typography Adjustments
%--------------------------------------------------------------------------------
\clubpenalties=2 10000 0
\widowpenalties=2 10000 0
\looseness=-10
