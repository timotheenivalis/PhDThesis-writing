%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% TimStyle.cls
%% Copyright 2016 Timothee Bonnet <timotheebonnetc@gmail.com>
%
% This work may be distributed and/or modified under the
% conditions of the LaTeX Project Public License, either version 1.3
% of this license or (at your option) any later version.
% The latest version of this license is in
%   http://www.latex-project.org/lppl.txt
% and version 1.3 or later is part of all distributions of LaTeX
% version 2003/12/01 or later.
%
% This work has the LPPL maintenance status "maintained".
% 
% The Current Maintainer of this work is Timothee Bonnet.
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% This class file builds on the scrartcl class
%% the KOMA Script bundle
%% 
%% This class implements the layout as defined by
%% the new (2010) corporate identity of the
%% University of Zurich (UZH), English version.
%%
%% USAGE: \documentclass[uzh-en]{timstyle}
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\def\filedate{2016/07/10}
\def\fileversion{0.1}
\def\filename{TimStyle.cls}
\NeedsTeXFormat{LaTeX2e}%[1997/06/01]

\ProvidesClass{TimStyle}[\filedate\space v\fileversion\space Timothee Bonnet's thesis template]


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% GENERAL SETTINGS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% FONTS (URW Arial and Mathpazo; available at CTAN)
\RequirePackage{uarial}
\RequirePackage{mathpazo}

%% BASE CLASS
\LoadClass{scrbook}%[1997/04/16]%TB: instead of scrartcl

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% TOC
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Original name = Contents
\renewcommand{\contentsname}{Table of Contents}

%% LOAD BABEL
%\RequirePackage[\sprache]{babel}[1997/01/23]
\RequirePackage[english]{babel}%[1997/01/23] % modif first of may 2016

%% HYPERLINKS
\RequirePackage{url}
\newcommand{\urlprefix}{}
\@ifundefined{selectfont}{%
\def\UrlFont{\it}}
{\def\UrlFont{\rmfamily\itshape}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\RequirePackage{scrhack}
%% BASE FONT SIZE (10pt/14pt)
\KOMAoptions{fontsize=12pt, twoside}

%% OPTIONS
\DeclareOption{10pt}{\KOMAoptions{fontsize=10pt}}
\DeclareOption{11pt}{\KOMAoptions{fontsize=11pt}}
\DeclareOption{12pt}{\KOMAoptions{fontsize=12pt}}
\def\sprache{}
\newif\ifuzh@english
\uzh@englishtrue

\DeclareOption{english}{
  \def\sprache{english}
  \uzh@englishtrue
}
\DeclareOption{american}{
  \def\sprache{english}
  \uzh@englishtrue
}


%% customize chapter format:
\KOMAoption{headings}{twolinechapter}
\renewcommand*\chapterformat{Chapter \thechapter\autodot}

\KOMAoptions{open=right} % or left

%\DeclareOption{titlepage}{\KOMAoptions{titlepage=true}}

\ProcessOptions

%% PAGE LAYOUT AND DIMENSIONS
\RequirePackage{geometry}
\geometry{%
  a4paper,
 top=38mm,
 left=30mm,
 right=21mm,
 bottom=24mm,
  headsep=16mm,
  footskip=15mm
}

%\setlength{\columnsep}{5mm}
\setlength{\footheight}{42.5pt}


%% FOOTNOTES
%\RequirePackage[ragged,bottom,hang,norule]{footmisc}
%\renewcommand\footnotelayout{\fontsize{7.5}{9pt}\selectfont}
%\renewcommand\footnotemargin{.8em}
%\setlength{\footnotesep}{12pt}


\usepackage[usenames,dvipsnames]{xcolor} % Required for specifying custom colors
\usepackage{tikz} %always after xcolor!
\usetikzlibrary{calc}
\newcommand*\voled[1]{\tikz[baseline]{\node[] (pic) {\includegraphics[width=0.12\textwidth]{SnowvoleshadowDark}};
\node[inner sep=0pt] (char) at ($(pic)+(0.2,0.05)$) {\textcolor{white}{#1}};
}}


%% LISTS
%\def\labelitemi{\normalfont{--}}
%\def\labelitemii{\normalfont{--}}
%\def\labelitemiii{\normalfont{--}}
%\def\labelitemiv{\normalfont{--}}
%\RequirePackage{enumitem}
%\setlist{leftmargin=*,nolistsep}
%\setitemize{labelwidth=2.7mm}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% PAGE STYLES
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% MACROS
\newcommand*\uzh{University of Zurich}
\newcommand*\uzhunit{IEU}
\def\partsave{}

%% HEADER (SUBSEQUENT PAGES)
%\def\uzhffhead{%
%    \ifx\partsave\empty
  %     \parbox{\textwidth}{\vspace*{12pt}\headmark\hfill}%\@title}%
    %\else
       % \parbox{\textwidth}{\vspace*{12pt}\partsave\hfill\@title\newline\headmark}%
    %\fi
%}


%% SET UP HEADERS WITH scrlayer-scrpage
\RequirePackage{scrlayer-scrpage}

\clearscrheadfoot
\pagestyle{scrheadings}
\ohead*{\headmark}
\ofoot*{\voled{\thepage}}

\renewcommand{\sectionmarkformat}{} %in order not to have numbers of sections in the heading


%%% TOC

\renewcommand{\contentsname}{Table of Contents}

\renewcommand\addchaptertocentry[2]{\addtocentrydefault{chapter}{}{#2}} %for the TOC without numbers
%\RequirePackage{tocstyle} % gives a scary warning
%\usetocstyle{standard}
%\usetocstyle{KOMAlike}
%\settocfeature {} {}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


\newenvironment{summary}{%
  \chapter*{Summary}}
  {}

\newenvironment{zusammenfassung}{%
  \chapter*{Zusammenfassung}}{}

\newenvironment{acknowledgements}{%
  \chapter*{Acknowledgements}}{}


\endinput
%%
%% End of file 'TimStyle.cls'

