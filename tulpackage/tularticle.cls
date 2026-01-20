\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{tulpackage/tularticle}[2026/01/21 v3.0.0]
% Licence: CC BY

% Základní třída
\newcommand{\TUL@baseclass}{article}

% ==========================================================================
% Zpracování voleb (Options)
% ==========================================================================

% 1. Volba pro vypnutí PDF metadat a odkazů
\newif\ifTUL@pdf
\TUL@pdftrue
\DeclareOption{nopdf}{\TUL@pdffalse}

% 2. Předání voleb do balíčku tulpackage/tul
% Jazyk
\DeclareOption{EN}{\PassOptionsToPackage{EN}{tulpackage/tul}}

% Fakulty
\DeclareOption{FS}{\PassOptionsToPackage{FS}{tulpackage/tul}}
\DeclareOption{FT}{\PassOptionsToPackage{FT}{tulpackage/tul}}
\DeclareOption{FP}{\PassOptionsToPackage{FP}{tulpackage/tul}}
\DeclareOption{EF}{\PassOptionsToPackage{EF}{tulpackage/tul}}
\DeclareOption{FA}{\PassOptionsToPackage{FA}{tulpackage/tul}}
\DeclareOption{FM}{\PassOptionsToPackage{FM}{tulpackage/tul}}
\DeclareOption{FZS}{\PassOptionsToPackage{FZS}{tulpackage/tul}}
\DeclareOption{UZS}{\PassOptionsToPackage{UZS}{tulpackage/tul}}
\DeclareOption{CXI}{\PassOptionsToPackage{CXI}{tulpackage/tul}}

% Vzhled a funkce
\DeclareOption{bwtitles}{\PassOptionsToPackage{bwtitles}{tulpackage/tul}}
\DeclareOption{bw}{\PassOptionsToPackage{bw}{tulpackage/tul}}
\DeclareOption{fonts}{\PassOptionsToPackage{fonts}{tulpackage/tul}}
\DeclareOption{sfbody}{\PassOptionsToPackage{sfbody}{tulpackage/tul}}
\DeclareOption{sfheadings}{\PassOptionsToPackage{sfheadings}{tulpackage/tul}}
\DeclareOption{numbering}{\PassOptionsToPackage{numbering}{tulpackage/tul}}
\DeclareOption{nonumbering}{\PassOptionsToPackage{nonumbering}{tulpackage/tul}}
\DeclareOption{margins}{\PassOptionsToPackage{margins}{tulpackage/tul}}
\DeclareOption{captionsleft}{\PassOptionsToPackage{captionsleft}{tulpackage/tul}}
\DeclareOption{nocapnumbers}{\PassOptionsToPackage{nocapnumbers}{tulpackage/tul}}

% 3. Všechny ostatní volby (a4paper, 12pt atd.) předej základní třídě article
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{\TUL@baseclass}}

% Zpracování všech voleb
\ProcessOptions\relax

% ==========================================================================
% Načtení třídy a balíčků (POZOR NA POŘADÍ)
% ==========================================================================

% 1. Načtení základní třídy (article)
\LoadClass[a4paper,12pt]{\TUL@baseclass}

% 2. Načtení hlavního TUL balíku (obsahuje hyperref, barvy, fonty...)
\RequirePackage{tulpackage/tul}

% 3. Konfigurace hyperref (musí být až po načtení tul, aby existoval \hypersetup a barva tul)
\ifTUL@pdf
    \hypersetup{colorlinks=true, linkcolor=tul, urlcolor=tul, citecolor=tul}
\fi

% ==========================================================================
% Specifická makra pro třídu tularticle
% ==========================================================================

% Implementace příkazu \uv pro české uvozovky (pokud chybí)
\providecommand{\uv}[1]{„#1“}

% Předdefinovaný obsah (TOC) na samostatné stránce bez čísla
\newcommand{\TULarticleTOC}{%
    \tableofcontents
    \thispagestyle{empty}
    \clearpage
}

% Přiblížení následujících odstavců k popiskům obrázků
\setlength{\belowcaptionskip}{-8pt}

% Výchozí stav: vypnuté grafické záhlaví pro články (lze zapnout v dokumentu)
\noTULheader{}

\endinput
