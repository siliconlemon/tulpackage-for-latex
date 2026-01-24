\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{tulpackage/tularticle}[2026/01/24 v3.0.0]
% Licence: CC BY

% Základní třída
\newcommand{\TUL@baseclass}{article}

% ==========================================================================
% Zpracování voleb (Options)
% ==========================================================================
\RequirePackage{ifthen}%

% 1. Volba pro vypnutí PDF metadat a odkazů (třída)
\newif\ifTUL@pdf
\TUL@pdftrue
\DeclareOption{nopdf}{\TUL@pdffalse}

% 2. Ostatní volby: whitelist -> base class, jinak -> balík tul
\newcommand{\TUL@opt}{}
\DeclareOption*{%
    \edef\TUL@opt{\CurrentOption}%
    \ifthenelse{%
        \equal{\TUL@opt}{a4paper} \OR%
        \equal{\TUL@opt}{a5paper} \OR%
        \equal{\TUL@opt}{b5paper} \OR%
        \equal{\TUL@opt}{letterpaper} \OR%
        \equal{\TUL@opt}{legalpaper} \OR%
        \equal{\TUL@opt}{executivepaper} \OR%
        \equal{\TUL@opt}{10pt} \OR%
        \equal{\TUL@opt}{11pt} \OR%
        \equal{\TUL@opt}{12pt} \OR%
        \equal{\TUL@opt}{oneside} \OR%
        \equal{\TUL@opt}{twoside} \OR%
        \equal{\TUL@opt}{onecolumn} \OR%
        \equal{\TUL@opt}{twocolumn} \OR%
        \equal{\TUL@opt}{final} \OR%
        \equal{\TUL@opt}{draft}%
    }{%
        \PassOptionsToClass{\CurrentOption}{\TUL@baseclass}%
    }{%
        \PassOptionsToPackage{\CurrentOption}{tulpackage/tul}%
    }%
}

\ProcessOptions\relax

% ==========================================================================
% Načtení třídy a balíčků (POZOR NA POŘADÍ)
% ==========================================================================
% 1. Načtení základní třídy (article) – options (a4paper/12pt/...) přijdou z \documentclass
\LoadClass{\TUL@baseclass}

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
