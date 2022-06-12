\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{esithesis}[2022/06/10 v1.0 ESI Thesis Class]

%===============================================================
% Packages
%===============================================================

\LoadClass[12pt, twosides, a4paper]{book}
\RequirePackage[utf8]{inputenc}
\RequirePackage{graphicx}
\RequirePackage{fancyhdr}
\RequirePackage{lastpage}
\RequirePackage{amssymb}
\RequirePackage[centertags]{amsmath}
\RequirePackage[many]{tcolorbox}
\RequirePackage{multirow}
\RequirePackage{tablefootnote}
\RequirePackage[ruled]{algorithm2e}
\RequirePackage{hyperref}
\RequirePackage{natbib}
\RequirePackage{verbatim}
\RequirePackage{lettrine}
\RequirePackage{longtable}
%\RequirePackage{titlesec}%sections vertical spacing
\RequirePackage{setspace}
\RequirePackage{lscape} %landscape page
\RequirePackage{afterpage}% used with landscape to prevent white pages
\RequirePackage{tocvsec2} %to set the TOC level
%\RequirePackage{tocloft} % toc, lof, lot
\RequirePackage{mdframed}

\RequirePackage{graphbox} 

\usepackage{indentfirst}

\RequirePackage{acro}


\RequirePackage{times}

\RequirePackage{titlecaps}

\RequirePackage[english,french]{babel} % by default it is french
\RequirePackage{arabtex}

\RequirePackage{listings}

\RequirePackage[left=3cm,right=2cm,top=2cm,bottom=2cm,includefoot,includehead,headheight=14pt,asymmetric]{geometry}
\RequirePackage[font=footnotesize,skip=2pt,tableposition=top]{caption}

\RequirePackage{etoolbox} %list variables, if else
\RequirePackage{xstring}

%===============================================================
% Options
%===============================================================
\newif\ifenglish % a boolean variable to check if english is used
\englishfalse % y default it is not english
%\DeclareOption*{english}{
%	\englishtrue % set the english variable to true (will be used later for internationalization)
%	\selectlanguage{english} % set babel into english
%}


%===============================================================
% Control commands
%===============================================================
\newcommand{\makename}[2]{\titlecap{#1}\ \MakeUppercase{#2}}

	
%===============================================================
% Thesis labels
%===============================================================

% The cover page will be in french whatever the used language
%\ifenglish
%
%\fi

%===============================================================
% Thesis information
%===============================================================

\newif\ifelab % a boolean variable to check if there is a lab info
\elabfalse

% commands to store cover pages informations
\def\@familyname{}
\def\@firstname{}
\def\@date{}
\def\@title{}
\def\@subtitle{}
\def\@supervisorlist{}
\def\@jurylist{}
\def\@lablogo{}
\def\@labtitle{}
\def\@esilogo{logo/ESI_logo.png}
\def\@speciality{Informatique}

% commands to set up cover pages informations
\def\familyname#1{\def\@familyname{#1}}
\def\firstname#1{\def\@firstname{#1}}
\def\date#1{\def\@date{#1}}
\def\title#1{\def\@title{#1}}
\def\subtitle#1{\def\@subtitle{#1}}

\newcommand\addsupervisor[3]{% firstname familyname rank
	\listadd{\@supervisorlist}{#3\ \makename{#1}{#2}}
}

\newcommand\addjury[6]{% firstname familyname rank
	\listadd{\@jurylist}{#3\ \makename{#1}{#2},#4,#5,#6}
}

\def\lablogo#1{\def\@lablogo{#1}\elabtrue}
\def\labtitle#1{\def\@labtitle{#1}\elabtrue}

\def\lablcsi{
	\lablogo{logo/K-LCSI.png}
	\labtitle{
		\begin{tabular}{l}
			\textbf{L}aboratoire de la \\
			\textbf{C}ommunication dans les \\
			\textbf{S}ystèmes \\
			\textbf{I}nformatiques \\
		\end{tabular}
	}
}

\def\lablmcs{
	\lablogo{logo/LMCS.png}
	\labtitle{
		\begin{tabular}{l}
			\textbf{L}aboratoire de \\
			\textbf{M}éthodes de \\
			\textbf{C}onception des \\
			\textbf{S}ystèmes \\
		\end{tabular}
	}
}

%===============================================================
% Cover page
%===============================================================

% define a command to set up the cover page's theme
\DeclareRobustCommand\usecovertheme[1]{%
	\def\@author{\makename{\@firstname}{\@familyname}} % define the author's variable in case it is used by the theme
	\usepackage{#1-cover} % call the theme which is the name followed by -cover.sty
	\def\maketitle { %redefine the command which makes the title page
		\phantomsection
		\addcontentsline{toc}{part}{\@title} % add the page to the table of contents
		\pagestyle{empty} % define an empty page
		\newgeometry{left=3cm,right=2cm,top=1cm,bottom=1cm} % modify the page layout
		\setlength\parindent{0pt} % set the indentation to 0 (no indentation)
		\make@title %call the command which actualy makes the title; it must e redefined in the theme file
		\restoregeometry %restore the default page layout
		\cleardoublepage % add an empty page after this one (case of double pages)
	}
}

% use the default theme in case the author did not set one
\usecovertheme{default}

%===============================================================
% General Layout
%===============================================================

% Default page style
\pagestyle{plain}

\renewcommand{\baselinestretch}{1.25} 

\fancypagestyle{fancymain}{
	\fancyhf{}
	\renewcommand{\headrulewidth}{.4pt}
	\fancyfoot[C]{\thepage}
%	\fancyfoot[C]{%
%		\rule{0.33\textwidth}{.4pt}\\[.2cm]
%		Page \thepage\ of \pageref{LastMainPage}
%	}
	\fancyhead[RE]{\bfseries\nouppercase{\leftmark}}      % Chapter in the right on even pages
	\fancyhead[LO]{\bfseries\nouppercase{\rightmark}}     % Section in the left on odd pages
	\fancyhead[LE,RO]{}
}

\fancypagestyle{fancychap}{
	\fancyhf{}
	\renewcommand{\headrulewidth}{0pt}
	\fancyfoot[C]{%
		\rule{0.33\textwidth}{.4pt}\\[.2cm]
		\thepage
	}
	%	\fancyhead{}
}

\fancypagestyle{fancyfront}{
	\fancyhf{}
	\renewcommand{\headrulewidth}{0pt}
	\fancyfoot[C]{%
		\rule{0.33\textwidth}{.4pt}\\[.2cm]
		\thepage
	}
	%	\fancyhead{}
}


\renewcommand{\frontmatter}{%
	\newpage
	\pagestyle{fancyfront}
	\pagenumbering{roman}
}

\renewcommand{\mainmatter}{%
	\newpage
	\pagenumbering{arabic}
	\pagestyle{fancymain}
}


%===============================================================
% Chapter Layout
%===============================================================

\newtcolorbox{quotebox}{
	enhanced jigsaw,
	oversize,
	rightrule=0pt,
	toprule=0pt,
	bottomrule=0pt,
	leftrule=5pt,
	colback=white!90!black,
	colframe=black,
	arc=0pt,
	outer arc=0pt,
	%	title={Remarque :},
	%	title style={white},
	%	fonttitle=\color{black}\bfseries,
	titlerule=0pt,
	bottomtitle=0pt,
	top=0pt,
	bottom=0pt,
	left=0pt,
	enlarge left by=.5\textwidth,
	width=0.5\textwidth,
	fontupper=\itshape
}

\renewcommand{\thechapter}{\arabic{chapter}}
\renewcommand{\thesection}{\arabic{section}.}
\renewcommand{\thesubsection}{\thesection.\arabic{subsection}.}


\newif\if@numbredchap\@numbredchaptrue

\def\@current@quote{}

\renewcommand{\@makechapterhead}[1]{%
	\if@openright\cleardoublepage\else\clearpage\fi
	\vspace*{-\headheight}%
	\thispagestyle{fancyfront}
	
	\begin{tikzpicture}
	\node[anchor=north west, minimum width=2.5cm,minimum height=2.5cm] (ref)
	at ([shift={(0cm,0cm)}] current page.north west){};
	
	\if@numbredchap%
	\if@mainmatter%
	\thispagestyle{fancychap}
	\node[anchor=north west, minimum width=2.5cm,minimum height=2.5cm,fill=white,draw=black,line width=2pt] 
	at ([shift={(0cm,0cm)}] ref.north west){
		\begin{minipage}[t!]{2cm}
		\begin{center}
		{\fontsize{50}{30}\bfseries\selectfont\raggedright\thechapter}\vspace{0.5cm}
		\end{center}
		\end{minipage}
	};
	\fi\fi%
	\node[anchor=north west, minimum width=\textwidth-2.5cm,minimum height=2.5cm] 
	at ([shift={(0cm,0cm)}] ref.north east){
		\begin{minipage}[t!]{\textwidth-2.8cm}
		{\fontsize{30}{30}\bfseries\selectfont#1\par}%
		\end{minipage}
	};
	\end{tikzpicture}
	
	\vspace*{1cm}%
	\@current@quote{}
	\@numbredchaptrue%
	\def\@current@quote{}%
}

\renewcommand{\@makeschapterhead}[1]{\@numbredchapfalse\@makechapterhead{#1}}

\RequirePackage{environ}

\def\define@quote#1{\gdef\@current@quote{%
		\begin{quotebox}%
			#1%
		\end{quotebox}%
		\vspace*{1cm}%
}}

% compatibility with package "quotchap"
\AtBeginDocument {
	\makeatletter
	\@ifundefined{savequote}{%
		\newenvironment{savequote}[1][10cm]{\collect@body\define@quote}{}
	}{}
	
	\@ifundefined{qauthor}{%
		\newcommand{\qauthor}[1]{%
			\begin{flushright}%
				#1%
			\end{flushright}%
		}%
	}{}
	
	\makeatother
}


%===============================================================
% Lists
%===============================================================


\def\listabbreviations{%
	
	\chapter*{Liste des abbreviations}
	\addcontentsline{toc}{chapter}{Liste des abbreviations}
	
	\printacronyms[include-classes=abbrev,name=]
	
}

\let\old@listoffigures\listoffigures
\def\listoffigures{%
	\old@listoffigures
	\addcontentsline{toc}{chapter}{Liste des figures}
}

\let\old@listoftables\listoftables
\def\listoftables{%
	\old@listoftables
	\addcontentsline{toc}{chapter}{Liste des tables}
}


