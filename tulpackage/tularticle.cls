\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{./tulpackage/tularticle}[2026/01/20 v1.0.0]
% Licence: CC BY

% Používané balíčky:
% ==========================================================================
% ifthen        % Podmíněné příkazy
% tabularray    % Moderní tvorba tabulek
% pdfpages      % Vkládání PDF souborů
% hyperref      % Vytváření hypertextových odkazů v PDF dokumentu
% polyglossia   % Podpora různých jazyků
% fontspec      % Práce s OpenType fonty
% xunicode      % Lepší práci s Unicode znaky
% xltxtra       % Doplňkové funkce pro XeLaTeX
% tabularx      % Tabulky s proměnnou šířkou sloupců
% makeidx       % Pro vytváření rejstříků
% tocloft       % Pro úpravu obsahu, seznamu obrázků a tabulek
% float         % Pro lepší kontrolu nad obrázky, tabulkami apod.
% graphicx      % Vkládání obrázků
% xcolor        % Definice a použití barev
% fancyhdr      % Vlastní záhlaví a zápatí
% silence       % Potlačení varování
% etoolbox      % Úprava existujících příkazů

% Možnosti nastavení:
% ==========================================================================
% EN:  Přepíná dokument do angličtiny
% FS, FT, FP, EF, FA, FM, FZS, UZS, CXI:  Styl dokumentu podle fakulty
% bwtitles:  Vypíná barevné nadpisy
% bw:  Vypíná všechny barevné prvky, monochromatický režim
% fonts:  Používání lokálně uložených fontů TUL
% sfbody:  Patkový font v těle dokumentu
% sfheadings:  Patkový font v nadpisech.
% numbering:  Číslování nadpisů v dokumentu
% nonumbering:  Vypnutí číslování nadpisů (předáno explicitně dvakrát)
% margins:  Odsazená zleva/zprava, i pro jednostranný tisk

% Vlastní možnosti a příkazy třídy tularticle.cls:
% ==========================================================================
% nopdf:  Deaktivace PDF metadat a podmíněné nenačítání hyperref
% \TULarticleTOC:  Předdefinovaný obsah
% \noTULheader:  Vypnutí výchozího záhlaví TUL

% Základní třída
\newcommand{\TUL@baseclass}{article}

% Přepnutí na anglickou verzi (předává volbu balíku EN)
\DeclareOption{EN}{\PassOptionsToPackage{\CurrentOption}{EN}}

% Fakultní přepínače – předání volby do balíku "tul"
\DeclareOption{FS}{\PassOptionsToPackage{\CurrentOption}{tul}}
\DeclareOption{FT}{\PassOptionsToPackage{\CurrentOption}{tul}}
\DeclareOption{FP}{\PassOptionsToPackage{\CurrentOption}{tul}}
\DeclareOption{EF}{\PassOptionsToPackage{\CurrentOption}{tul}}
\DeclareOption{FA}{\PassOptionsToPackage{\CurrentOption}{tul}}
\DeclareOption{FM}{\PassOptionsToPackage{\CurrentOption}{tul}}
\DeclareOption{FZS}{\PassOptionsToPackage{\CurrentOption}{tul}}
\DeclareOption{UZS}{\PassOptionsToPackage{\CurrentOption}{tul}}
\DeclareOption{CXI}{\PassOptionsToPackage{\CurrentOption}{tul}}

% Dále volby pro barvy, fonty a nadpisy
\DeclareOption{bwtitles}{\PassOptionsToPackage{\CurrentOption}{tul}}
\DeclareOption{bw}{\PassOptionsToPackage{\CurrentOption}{tul}}
\DeclareOption{fonts}{\PassOptionsToPackage{\CurrentOption}{tul}}
\DeclareOption{sfbody}{\PassOptionsToPackage{\CurrentOption}{tul}}
\DeclareOption{sfheadings}{\PassOptionsToPackage{\CurrentOption}{tul}}
\DeclareOption{numbering}{\PassOptionsToPackage{\CurrentOption}{tul}}
\DeclareOption{nonumbering}{\PassOptionsToPackage{\CurrentOption}{tul}}

% Aktivace nebo deaktivace PDF metadat
\newif\ifTUL@pdf
\TUL@pdftrue
\DeclareOption{nopdf}{\TUL@pdffalse}

% Aktivace a deaktivace odsazení okrajů stránky
\DeclareOption{margins}{\PassOptionsToPackage{\CurrentOption}{tul}}

% Předání neznámých voleb základní třídě dokumentu
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{\TUL@baseclass}}

% Předání tul-specific options to tulpackage/tul
\DeclareOption{fonts}{\PassOptionsToPackage{fonts}{tulpackage/tul}}
\DeclareOption{nonumbering}{\PassOptionsToPackage{nonumbering}{tulpackage/tul}}

% Zpracování možností
\ProcessOptions\relax

% Načtení základní třídy dokumentu s výchozím nastavením
\LoadClass[a4paper,12pt]{\TUL@baseclass}

% Aktivace balíku hyperref (pouze pokud je povolen PDF režim)
\ifTUL@pdf
	\hypersetup{colorlinks=true, linkcolor=tul, urlcolor=tul, citecolor=tul}
\fi

% Načtení balíčku s předanými možnostmi
\RequirePackage{tulpackage/tul}

% Implementace příkazu \uv pro čeké uvozovky (chybí v polyglossia)
\providecommand{\uv}[1]{„#1“}

% noTULheader jako fixní možnost
\noTULheader{}

% Předdefinovaný obsah
\newcommand{\TULarticleTOC}{%
	\tableofcontents
	\thispagestyle{empty}
	\clearpage
}

% Přiblížení následujících odstavců k popiskům obrázků apod.
\setlength{\belowcaptionskip}{-8pt}

\endinput
