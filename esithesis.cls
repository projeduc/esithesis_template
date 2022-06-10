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

\RequirePackage{listings}

\RequirePackage{times}

\RequirePackage{titlecaps}

\RequirePackage[left=3cm,right=2cm,top=2cm,bottom=2cm,includefoot,includehead,headheight=14pt,asymmetric]{geometry}
\RequirePackage[font=footnotesize,skip=2pt,tableposition=top]{caption}

%===============================================================
% Internal Packages
%===============================================================

\usepackage{etoolbox}

%===============================================================
% Control commands
%===============================================================
\newcommand{\makename}[2]{\titlecap{#1}\ \MakeUppercase{#2}}

%===============================================================
% Variables
%===============================================================
\def\@familyname{}
\def\@firstname{}
\def\@date{}
\def\@title{}
\def\@subtitle{}

\def\familyname#1{\def\@familyname{#1}}
\def\firstname#1{\def\@firstname{#1}}
\def\date#1{\def\@date{#1}}
\def\title#1{\def\@title{#1}}
\def\subtitle#1{\def\@subtitle{#1}}

\def\@esilogo{logo/ESI_logo.png}


%===============================================================
% Cover page
%===============================================================

\DeclareRobustCommand\usecovertheme[1]{%
	\def\@author{\makename{\@firstname}{\@familyname}}
	\usepackage{#1-cover}
	\def\maketitle {
		\phantomsection
		\addcontentsline{toc}{part}{\@title}
		\pagestyle{empty}
		\newgeometry{left=3cm,right=2cm,top=1cm,bottom=1cm}
		\setlength\parindent{0pt}
		\make@title
		\restoregeometry
		\cleardoublepage
	}
}

\usecovertheme{default}

%===============================================================
% General Layout
%===============================================================

% Default page style
\pagestyle{plain}

\renewcommand{\baselinestretch}{1.5} 
