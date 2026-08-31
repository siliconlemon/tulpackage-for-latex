% tulpackage/tulthesis.cls
% Obsahuje: Specifika pro tvorbu bakalářských a diplomových prací

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{./tulpackage/tulthesis}[2026/01/25 v3.0.0]
% Licence: CC BY

% ==========================================================================
% 1. Výchozí nastavení a proměnné
% ==========================================================================

% Výchozí třída dokumentu (report je výchozí, lze přepnout na article)
\newcommand{\TUL@baseclass}{report}

% Proměnné pro texty (CZ/EN) a typy prací
\newcommand{\TUL@levelCZ}{Bakalářská práce}
\newcommand{\TUL@levelEN}{Bachelor thesis}
\newcommand{\TUL@kat}{BP}
\newcommand{\TULpraceou}{bakalářskou práci}
\newcommand{\TULpracee}{bakalářské práce}
% Přepínač rodu: #1 pro projekt, #2 pro práce, #3 pro teze
\newcommand{\TULpracerod}[3]{#2}

% ==========================================================================
% 2. Možnosti (Options)
% ==========================================================================

% Základní když/pak vazby (přednačtení)
\RequirePackage{ifthen}%

% --- Základní třída ---
\DeclareOption{article}{\renewcommand{\TUL@baseclass}{article}}
\DeclareOption{report}{}

% --- Typy prací ---
\DeclareOption{BP}{} % Výchozí

\DeclareOption{DP}{%
    \renewcommand{\TUL@levelCZ}{Diplomová práce}%
    \renewcommand{\TUL@levelEN}{Master thesis}%
    \renewcommand{\TULpraceou}{diplomovou práci}%
    \renewcommand{\TULpracee}{diplomové práce}%
    \renewcommand{\TULpracerod}[3]{#2}%
    \renewcommand{\TUL@kat}{DP}%
}

\DeclareOption{Dis}{%
    \renewcommand{\TUL@levelCZ}{Disertační práce}%
    \renewcommand{\TUL@levelEN}{Dissertation}%
    \renewcommand{\TULpraceou}{disertační práci}%
    \renewcommand{\TULpracee}{disertační práce}%
    \renewcommand{\TULpracerod}[3]{#2}%
    \renewcommand{\TUL@kat}{Dis}%
}

\DeclareOption{Hab}{%
    \renewcommand{\TUL@levelCZ}{Habilitační práce}%
    \renewcommand{\TUL@levelEN}{Habilitation thesis}%
    \renewcommand{\TULpraceou}{habilitační práci}%
    \renewcommand{\TULpracee}{habilitační práce}%
    \renewcommand{\TULpracerod}[3]{#2}%
    \renewcommand{\TUL@kat}{Hab}%
}

\DeclareOption{Teze}{%
    \renewcommand{\TUL@levelCZ}{Teze disertační práce}%
    \renewcommand{\TUL@levelEN}{Dissertation thesis draft}%
    \renewcommand{\TULpraceou}{teze disertační práce}%
    \renewcommand{\TULpracee}{tezí disertační práce}%
    \renewcommand{\TULpracerod}[3]{#3}%
    \renewcommand{\TUL@kat}{Teze}%
}

\DeclareOption{Autoref}{%
    \renewcommand{\TUL@levelCZ}{Autoreferát disertační práce}%
    \renewcommand{\TUL@levelEN}{Dissertation thesis summary}%
    \renewcommand{\TULpraceou}{autoreferát disertační práce}%
    \renewcommand{\TULpracee}{autoreferátu disertační práce}%
    \renewcommand{\TULpracerod}[3]{#1}%
    \renewcommand{\TUL@kat}{Autoref}%
}

\DeclareOption{Proj}{%
    \renewcommand{\TUL@levelCZ}{Projekt}%
    \renewcommand{\TUL@levelEN}{Project report}%
    \renewcommand{\TULpraceou}{projekt}%
    \renewcommand{\TULpracee}{projektu}%
    \renewcommand{\TULpracerod}[3]{#1}%
    \renewcommand{\TUL@kat}{RP}%
}

\DeclareOption{SP}{%
    \renewcommand{\TUL@levelCZ}{Semestrální práce}%
    \renewcommand{\TUL@levelEN}{Semestral work}%
    \renewcommand{\TULpraceou}{semestrální práci}%
    \renewcommand{\TULpracee}{semestrální práce}%
    \renewcommand{\TULpracerod}[3]{#2}%
    \renewcommand{\TUL@kat}{SP}%
}

% --- PDF Metadata ---
\newif\ifTUL@pdf
\TUL@pdftrue%
\DeclareOption{nopdf}{\TUL@pdffalse}

% --- Dlouhé indikátory příloh ---
\newif\ifTUL@longappendices%
\TUL@longappendicesfalse%
\DeclareOption{longappendices}{\TUL@longappendicestrue}

% --- Ostatní volby ---
% Všechno neznámé posíláme primárně do balíku tul (ten řeší EN, fakulty, vzhled, layout...).
% Výjimka: klasické volby základní třídy (twoside, oneside, 10pt/11pt/12pt, a4paper...) se mají
% dostat do \LoadClass.
\newcommand{\TUL@opt}{}
\DeclareOption*{%
    \edef\TUL@opt{\CurrentOption}%
    % Whitelist pro base class
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
        \equal{\TUL@opt}{openright} \OR%
        \equal{\TUL@opt}{openany} \OR%
        \equal{\TUL@opt}{titlepage} \OR%
        \equal{\TUL@opt}{notitlepage} \OR%
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
% 3. Načtení balíčků a základní třídy
% ==========================================================================

\LoadClass{\TUL@baseclass}

% Načtení balíku TUL (bez záhlaví, zápatí řešíme zde)
\RequirePackage[noheader]{tulpackage/tul}
\noTULfooter%

% Nastavení textů šablony tabulek v češtině
\ifthenelse{\equal{\TUL@nguage}{EN}}{}{%
    \DefTblrTemplate{conthead-text}{default}{(pokračování)}%
    \DefTblrTemplate{contfoot-text}{default}{pokračuje na další straně\,\ldots}%
}

% Hyperref (pokud není vypnut)
\ifTUL@pdf
    \hypersetup{colorlinks=true, linkcolor=\tulcolor, urlcolor=\tulcolor,
    citecolor=\tulcolor, filecolor=\tulcolor, menucolor=\tulcolor,
    runcolor=\tulcolor, anchorcolor=\tulcolor}%
\fi

% Pomocné
\providecommand{\uv}[1]{„#1“}

% Vypnutí číslování vakátů vytvořených použitím \cleardoublepage
\AtBeginDocument{%
  \makeatletter
  \patchcmd{\cleardoublepage}{\hbox{}}{\hbox{}\thispagestyle{empty}}{}{}
  \makeatother
}

% ==========================================================================
% 4. Definice příkazů pro metadata práce
% ==========================================================================

% Definice typu práce (ruční přepsání)
\newcommand{\TULthesisType}[2]{%
    \renewcommand{\TUL@levelCZ}{#1}%
    \renewcommand{\TUL@levelEN}{#2}%
}

% Název práce
\newcommand{\TUL@nazevCZ}{Chybí \textbackslash{}TULtitle\{česky\}\{anglicky\}}
\newcommand{\TUL@nazevEN}{English title}
\newcommand{\TULtitle}[2]{%
    \renewcommand{\TUL@nazevCZ}{#1}%
    \renewcommand{\TUL@nazevEN}{#2}%
    \ifTUL@pdf
        \ifthenelse{\equal{\TUL@nguage}{EN}}%
        {\hypersetup{pdftitle={#2}}}%
        {\hypersetup{pdftitle={#1}}}%
    \fi
}

% Autor
\newcommand{\TUL@autor}{Chybí \textbackslash{}TULauthor\{jméno\}}
\newcommand{\TULauthor}[1]{%
    \renewcommand{\TUL@autor}{#1}%
    \ifTUL@pdf
        \hypersetup{pdfauthor={#1}}%
    \fi
}

% Vedoucí práce
\newcommand{\TUL@vedouci}{Chybí \textbackslash{}TULsupervisor\{jméno\}}
\newcommand{\TULsupervisor}[1]{\renewcommand{\TUL@vedouci}{#1}}

% Konzultanti
\newcounter{TULk@nzult}
\setcounter{TULk@nzult}{0}
\newcommand{\TULconsultant}[1]{%
    \stepcounter{TULk@nzult}%
    \@namedef{\roman{TULk@nzult}@TULkonzultant}{#1}%
}

% Studijní program
\newcommand{\TUL@programCZ}{Chybí \textbackslash{}TULprogramme\{kód\}\{česky\}\{anglicky\}}
\newcommand{\TUL@programEN}{Study Programme}
\newcommand{\TULprogramme}[3]{%
    \renewcommand{\TUL@programCZ}{#1~-- #2}%
    \renewcommand{\TUL@programEN}{#1~-- #3}%
}

% Studijní obory
\newcounter{TUL@bor}
\setcounter{TUL@bor}{0}
\newcommand{\i@TULoborCZ}{Chybí \textbackslash{}TULbranch\{kód\}\{česky\}\{anglicky\}}
\newcommand{\i@TULoborEN}{Study Branches}
\newcommand{\TULbranch}[3]{%
    \stepcounter{TUL@bor}%
    \ifthenelse{\equal{#1}{}}{%
        \@namedef{\roman{TUL@bor}@TULoborCZ}{#2}%
        \@namedef{\roman{TUL@bor}@TULoborEN}{#3}%
    }{%
        \@namedef{\roman{TUL@bor}@TULoborCZ}{#1~-- #2}%
        \@namedef{\roman{TUL@bor}@TULoborEN}{#1~-- #3}%
    }%
}

% Rok a ID
\newcommand{\TUL@rok}{\the\year}
\newcommand{\TULyear}[1]{\renewcommand{\TUL@rok}{#1}}
\newcommand{\TULid}[1]{\newcommand{\TUL@id}{#1}}

% Pomocné grafické prvky
\newcommand{\@ddel}{\hspace{0.5em}\rule[-0.2em]{0.75pt}{1.2em}\hspace{0.5em}}
% Lokální vlevo zarovnaná buňka tabulky (pro p-sloupce na titulní straně)
\newcommand{\TUL@leftcell}[1]{{\raggedright#1\par}}

% ==========================================================================
% 5. Layout a Prostředí
% ==========================================================================

% Prostředí pro úzký text (zarovnaný na střed)
\newenvironment{uzky@text}{%
    \begin{center}
        \begin{minipage}{0.80\textwidth}
            \setlength{\parskip}{0.5\baselineskip}
            \titlespacing*{\section}{0pt}{1.4em}{1.5em}
}{%
        \end{minipage}
    \end{center}
}

\AtBeginDocument{%
    \pagestyle{empty}%
}

% Číslování stránek
\fancypagestyle{plain}{%
    \fancyhf{}%
    \if@twoside
        \fancyfoot[RO,LE]{\thepage}%
    \else
        \fancyfoot[C]{\thepage}%
    \fi
    \renewcommand{\headrulewidth}{0pt}%
    \renewcommand{\footrulewidth}{0pt}%
}

% Rozměry pro titulní stranu
\newdimen{\TUL@shift}
\setlength{\TUL@shift}{21mm}
\newdimen{\TUL@wide}
\setlength{\TUL@wide}{\linewidth}
\addtolength{\TUL@wide}{2\TUL@shift}

% Explicitní okraje titulní strany (přesné vzdálenosti od okraje papíru).
\newlength{\Title@PageMarginT}
\setlength{\Title@PageMarginT}{25mm}
\newlength{\Title@PageMarginB}
\setlength{\Title@PageMarginB}{22mm}
\newlength{\Title@PageMarginH}
\setlength{\Title@PageMarginH}{25mm}

% ==========================================================================
% 6. Titulní strana (\ThesisTitle)
% ==========================================================================

\newcommand{\ThesisTitle}[1]{{%
    \thispagestyle{TULheaderonly}%
    % Titulní strana vždy používá rozvržení margins=true (vazební okraj vlevo)
    \ifthenelse{\lengthtest{\paperwidth=210mm}\AND\lengthtest{\paperheight=297mm}}{%
        \setlength{\oddsidemargin}{5mm}%
        \setlength{\evensidemargin}{0mm}%
        \setlength{\textwidth}{\dimexpr\paperwidth-55mm\relax}%
    }{%
        \setlength{\oddsidemargin}{10mm}%
        \setlength{\evensidemargin}{0mm}%
        \setlength{\textwidth}{\dimexpr\paperwidth-60mm\relax}%
    }%
    % Odvození interních parametrů z požadovaných okrajů
    \setlength{\voffset}{\dimexpr\Title@PageMarginT-\topmargin-\headheight-\headsep-1in\relax}%
    \setlength{\hoffset}{\dimexpr\Title@PageMarginH-\oddsidemargin-1in\relax}%
    \enlargethispage{\dimexpr\paperheight-\Title@PageMarginT-\Title@PageMarginB-\textheight\relax}%
    \sffamily

    \mbox{}\vfill

    % Nadpis
    \begin{minipage}{\textwidth}
        \noindent\Large\TULHeadFont%
        \ifthenelse{\equal{#1}{EN}}{\TUL@levelEN}{\TUL@levelCZ}\\[\bigskipamount]%
        \raggedright\fontsize{18pt}{22pt}\selectfont\color{\tulcolor}\TULHeadFont%
        \ifthenelse{\equal{#1}{EN}}{\TUL@nazevEN}{\TUL@nazevCZ}\par
    \end{minipage}

    \bigskip\bigskip

    % Tabulka s informacemi
    \newcommand{\t@nd}{&}%
    \newcommand{\n@dpis}{\itshape}%
    \newdimen{\TUL@hodnoty}%
    \newcounter{TULc@unter}%

    \setlength{\TUL@hodnoty}{\linewidth}%
    \addtolength{\TUL@hodnoty}{-15em}%

    \noindent
    \begin{tabular}{@{}p{13em}p{\TUL@hodnoty}@{}}
        \ifthenelse{\equal{\TUL@kat}{Hab}}{%
            % Habilitační práce
            \TUL@leftcell{\ifthenelse{\equal{#1}{EN}}{Author}{Autor práce}:}
                & \TUL@leftcell{\bfseries\TUL@autor} \\
            \TUL@leftcell{\ifthenelse{\equal{#1}{EN}}{Field}{Obor}:}
                & \TUL@leftcell{\ifthenelse{\equal{#1}{EN}}{\i@TULoborEN}{\i@TULoborCZ}} \\
        }{%
            % Ostatní práce
            \TUL@leftcell{\n@dpis \ifthenelse{\equal{#1}{EN}}{Study programme}{Studijní program}:}
                & \TUL@leftcell{\ifthenelse{\equal{#1}{EN}}{\TUL@programEN}{\TUL@programCZ}} \\
            % Studijní obory
            \ifthenelse{\value{TUL@bor}=0}{}{%
                \TUL@leftcell{\n@dpis
                \ifthenelse{\equal{#1}{EN}}
                {Study branch\ifnum\theTUL@bor>1\relax es\fi}
                {Studijní obor\ifnum\theTUL@bor>1\relax y\fi}:}
                & \TUL@leftcell{\ifthenelse{\equal{#1}{EN}}{\i@TULoborEN}{\i@TULoborCZ}} \\
                \setcounter{TULc@unter}{1}%
                \whiledo{\value{TULc@unter} < \value{TUL@bor}}{%
                    \stepcounter{TULc@unter}\t@nd
                    \TUL@leftcell{\ifthenelse{\equal{#1}{EN}}
                    {\@nameuse{\roman{TULc@unter}@TULoborEN}}
                    {\@nameuse{\roman{TULc@unter}@TULoborCZ}}} \\
                }%
            }%
            % Autor a vedoucí
            \TUL@leftcell{\n@dpis \ifthenelse{\equal{#1}{EN}}{Author}{Autor práce}:}     & \TUL@leftcell{\bfseries\TUL@autor} \\
            \TUL@leftcell{\n@dpis \ifthenelse{\equal{#1}{EN}}{Supervisor}{Vedoucí práce}:} & \TUL@leftcell{\TUL@vedouci} \\
            % Konzultanti
            \@ifundefined{i@TULkonzultant}{}{%
                \TUL@leftcell{\n@dpis
                \ifthenelse{\equal{#1}{EN}}
                {Consultant\@ifundefined{ii@TULkonzultant}{}{s}}
                {Konzultant\@ifundefined{ii@TULkonzultant}{}{i}}:}
                & \TUL@leftcell{\i@TULkonzultant} \\
                \setcounter{TULc@unter}{1}%
                \whiledo{\value{TULc@unter} < \value{TULk@nzult}}{%
                    \stepcounter{TULc@unter}\t@nd
                    \TUL@leftcell{\@nameuse{\roman{TULc@unter}@TULkonzultant}} \\
                }%
            }%
        }%
        % Rok a místo
        \TUL@leftcell{\rule{0pt}{10mm}} & \TUL@leftcell{Liberec \TUL@rok} \\
    \end{tabular}

    \clearpage%
}}

% ==========================================================================
% 7. Zadání a Prohlášení
% ==========================================================================

% Pomocná stránka pro nahrazení dokumentem z IS STAG
\newcommand{\StagPlaceholderPage}[1]{%
    \mbox{}\vfill
    \begin{center}
        \LARGE\sffamily
        #1
        \thispagestyle{empty}%
    \end{center}
    \vfill
    \clearpage
}

% Stránka pro nahrazení zadáním (zpětná kompatibilita)
\newcommand{\Assignment}{%
    \ifthenelse{\equal{\TUL@nguage}{EN}}
    {\StagPlaceholderPage{Replace this page\\[0.5em]with the original assignment.}}
    {\StagPlaceholderPage{Tento list nahraďte\\[0.5em]originálem zadání.}}%
}

% Pomocné pro prohlášení
\newcommand{\TULfem}[1]{\ifthenelse{\equal{#1}{female}}{a}{}}
\newcommand{\TULpraceCZ}{\lowercase\expandafter{\TUL@levelCZ}}
\newcommand{\ThesisType@EN}{\lowercase\expandafter{\TUL@levelEN}}

% Prohlášení CZ
\newcommand{\DeclarationCZ}[1]{%
    \vspace{2em}
    \section*{\normalfont\color{\titlecolor}\TUL@headfnt\LARGE\raggedright{}Prohlášení}
    \vspace{1.5em}

    Prohlašuji, že \TULpracerod{svůj}{svou}{své} \TULpraceou\ jsem vypracoval\TULfem{#1}
    samostatně jako původní dílo s použitím uvedené literatury
    \ifthenelse{\equal{\TUL@kat}{Hab}}{}{ a na základě konzultací s vedoucím
        \TULpracerod{mého}{mé}{mých} \TULpracee\ a konzultantem}.

    \ifthenelse{\equal{\TUL@kat}{Hab}}{}{%
        Jsem si vědom\TULfem{#1} toho, že na \TULpracerod{můj}{mou}{mé} \TULpraceou\ se plně
        vztahuje zákon č.~121/2000 Sb., o~právu autorském, zejména \S~60~-- školní dílo.

        Beru na vědomí, že Technická univerzita v~Liberci nezasahuje do mých autorských
        práv užitím \TULpracerod{mého}{mé}{mých} \TULpracee\ pro vnitřní potřebu
        Technické univerzity v~Liberci.

        Užiji-li \TULpraceou\ nebo poskytnu-li licenci k~\TULpracerod{jeho}{jejímu}{jejich}
        využití, jsem si vědom\TULfem{#1} povinnosti informovat o~této skutečnosti
        Technickou univerzitu v~Liberci; v~tomto případě má Technická univerzita v~Liberci
        právo ode mne požadovat úhradu nákladů, které vynaložila na vytvoření díla,
        až do jejich skutečné výše.

        \ifthenelse{\equal{\TUL@kat}{BP} \OR\equal{\TUL@kat}{DP} \OR\equal{\TUL@kat}{Dis}}
        {Současně čestně prohlašuji, že text elektronické podoby práce vložený do IS STAG
            se shoduje s textem tištěné podoby práce.}{}
    }

    Beru na vědomí, že \TULpracerod{můj}{má}{mé} \TULpraceCZ\
    \TULpracerod{bude zveřejněn}{bude zveřejněna}{budou zveřejněny}
    Technickou univerzitou v~Liberci v souladu s~\S~47b zákona č.~111/1998 Sb.,
    o~vysokých školách a o~změně a doplnění dalších zákonů (zákon o~vysokých školách),
    ve znění pozdějších předpisů.

    Jsem si vědom\TULfem{#1} následků, které podle zákona o~vysokých školách mohou
    vyplývat z porušení tohoto prohlášení.

    \vspace{3em}
    \noindent \the\day. \the\month. \the\year\hfill \noindent \TUL@autor
}

% Prohlášení EN
\newcommand{\DeclarationEN}{%
    \vspace{2em}
    \section*{\normalfont\color{\titlecolor}\TUL@headfnt\LARGE\raggedright{}Declaration}
    \vspace{1.5em}

    I hereby certify, I, myself, have written my \ThesisType@EN\ as an original and
    primary work using the literature listed below
    \ifthenelse{\equal{\TUL@kat}{Hab}}{}{ and consulting it with my thesis
        supervisor and my thesis counsellor}.

    \ifthenelse{\equal{\TUL@kat}{Hab}}{}{%
        I acknowledge that my \ThesisType@EN\ is fully governed by Act No.~121/2000 Coll.,
        the Copyright Act, in particular Article~60!-- School Work.

        I acknowledge that the Technical University of Liberec does not infringe my
        copyrights by using my \ThesisType@EN\ for internal purposes of the Technical
        University of Liberec.

        I am aware of my obligation to inform the Technical University of Liberec on
        having used or granted license to use the results of my \ThesisType@EN\@; in
        such a case the Technical University of Liberec may require reimbursement of
        the costs incurred for creating the result up to their actual amount.

        \ifthenelse{\equal{\TUL@kat}{BP} \OR\equal{\TUL@kat}{DP} \OR\equal{\TUL@kat}{Dis}}
        {At the same time, I honestly declare that the text of the printed version of my
            \ThesisType@EN\ is identical with the text of the electronic version uploaded
            into the IS STAG.}{}
    }

    I acknowledge that the Technical University of Liberec will make my
    \ThesisType@EN\ public in accordance with paragraph~47b of Act No.~111/1998
    Coll., on Higher Education Institutions and on Amendment to Other Acts (the
    Higher Education Act), as amended.

    I am aware of the consequences which may under the Higher Education Act result
    from a breach of this declaration.

    \vspace{3em}
    \noindent \the\day. \the\month. \the\year\hfill \noindent \TUL@autor
}

% Automatický výběr prohlášení
\newcommand{\Declaration}[1]{%
    \thispagestyle{empty}%
    \begin{uzky@text}
        \ifthenelse{\equal{\TUL@nguage}{EN}}{\DeclarationEN}{\DeclarationCZ{#1}}
    \end{uzky@text}
    \cleardoublepage%
}

% Hlavní příkaz pro zahájení práce
\newcommand{\ThesisStart}[1]{%
    \ifthenelse{\equal{#1}{female} \OR\equal{#1}{male}}{%
        % Stránka 1: Titulní list
        \ifthenelse{\equal{\TUL@nguage}{EN}}{\ThesisTitle{EN}}{\ThesisTitle{CZ}}%
        % Stránka 2: Vakát za titulkou
        \thispagestyle{empty}\mbox{}\clearpage
        % Stránka 3: Zadání – 1. strana
        \ifthenelse{\equal{\TUL@nguage}{EN}}
        {\StagPlaceholderPage{Replace with the first page of the assignment\\from IS STAG (double-sided).}}
        {\StagPlaceholderPage{Nahraďte první stranou zadání\\z~IS STAG (oboustranně).}}%
        % Stránka 4: Zadání – 2. strana
        \ifthenelse{\equal{\TUL@nguage}{EN}}
        {\StagPlaceholderPage{Replace with the second page of the assignment\\from IS STAG (double-sided).}}
        {\StagPlaceholderPage{Nahraďte druhou stranou zadání\\z~IS STAG (oboustranně).}}%
        % Stránka 5: Prohlášení
        \ifthenelse{\equal{\TUL@nguage}{EN}}
        {\StagPlaceholderPage{Replace with the declaration of authorship\\from IS STAG.}}
        {\StagPlaceholderPage{Nahraďte prohlášením o~vypracování\\z~IS STAG.}}%
        % Stránka 6: Vakát za prohlášením
        \thispagestyle{empty}\mbox{}\clearpage
    }{%
        \includepdf[pages=-]{#1}%
    }%
}

% ==========================================================================
% 8. Abstrakty, Klíčová slova, Poděkování
% ==========================================================================

\newenvironment{abstractCZ}[1][narrow]{%
    \ifthenelse{\equal{#1}{wide}}
    {\renewcommand{\endabstractCZ}{\par}}
    {\begin{uzky@text}\renewcommand{\endabstractCZ}{\end{uzky@text}}}
    \section*{\LARGE\TUL@nazevCZ}
    \thispagestyle{empty}
    \section*{Abstrakt}
}{}

\newenvironment{abstractEN}[1][narrow]{%
    \ifthenelse{\equal{#1}{wide}}
    {\renewcommand{\endabstractEN}{\par}}
    {\begin{uzky@text}\renewcommand{\endabstractEN}{\end{uzky@text}}}
    \section*{\LARGE\TUL@nazevEN}
    \thispagestyle{empty}
    \section*{Abstract}
}{}

\newenvironment{annotationCZ}[1][narrow]{%
    \ifthenelse{\equal{#1}{wide}}
    {\renewcommand{\endannotationCZ}{\par}}
    {\begin{uzky@text}\renewcommand{\endannotationCZ}{\end{uzky@text}}}
    \section*{\LARGE\TUL@nazevCZ}
    \thispagestyle{empty}
    \section*{Anotace}
}{}

\newenvironment{annotationEN}[1][narrow]{%
    \ifthenelse{\equal{#1}{wide}}
    {\renewcommand{\endannotationEN}{\par}}
    {\begin{uzky@text}\renewcommand{\endannotationEN}{\end{uzky@text}}}
    \section*{\LARGE\TUL@nazevEN}
    \thispagestyle{empty}
    \section*{Annotation}
}{}

\newenvironment{keywordsCZ}[1][narrow]{%
    \ifthenelse{\equal{#1}{wide}}
    {\renewcommand{\endkeywordsCZ}{\par}}
    {\begin{uzky@text}\renewcommand{\endkeywordsCZ}{\end{uzky@text}}}
    \vspace{0.4em}
    \section*{Klíčová slova}
}{}

\newenvironment{keywordsEN}[1][narrow]{%
    \ifthenelse{\equal{#1}{wide}}
    {\renewcommand{\endkeywordsEN}{\par}}
    {\begin{uzky@text}\renewcommand{\endkeywordsEN}{\end{uzky@text}}}
    \vspace{0.4em}
    \section*{Keywords}
}{}

\newenvironment{acknowledgement}[1][narrow]{%
    \ifthenelse{\equal{#1}{wide}}
    {\renewcommand{\endacknowledgement}{\clearpage}}
    {\begin{uzky@text}\renewcommand{\endacknowledgement}{\end{uzky@text}\clearpage}}
    \ifthenelse{\equal{\TUL@nguage}{EN}}
    {\vspace{2em}\chapter*{Acknowledgements}\thispagestyle{empty}\vspace{0.6em}}
    {\vspace{2em}\chapter*{Poděkování}\thispagestyle{empty}\vspace{0.6em}}
}{}

% ==========================================================================
% 9. Obsah a Seznamy
% ==========================================================================

% Balík pro flexibilní seznamy/obsahy
\RequirePackage{etoc}

% Formátování nadpisů
\titleformat{\chapter}
{\normalfont\color{\titlecolor}\TUL@headfnt\LARGE\raggedright}
{\thechapter}{1em}{}

% Příkaz pro skrytí individuálních příloh, pokud je definovaný seznam příloh (interní)
\newcommand{\TUL@HideAppendices}{}

% Příkaz definující hlavní obsah
\newcommand{\TULthesisTOC}{%
    \etocdepthtag.toc{TOC}%
    \etocsettagdepth{TOC}{subsection}%
    \etocsettagdepth{LOA}{subsection}%
    % Mechanismus skrytí individuálních příloh, pokud je definovaný seznam příloh (interní)
    \def\TUL@HideAppendices{\etocsettagdepth{LOA}{none}}%
    \etocsettocstyle{\chapter*{\contentsname}}{}%
    \tableofcontents
    \pagestyle{plain}
    \clearpage
}

% Definice přepínače pro prostředí s přílohami
\newif\if@inTULappendix

% Prostředí pro přílohy v rámci práce
\newenvironment{TULthesisAppendix}{%
    \cleardoublepage%
    \phantomsection%
    \@inTULappendixtrue%
    \appendix%
    \etocdepthtag.toc{LOA}%
    \ifTUL@longappendices%
        \ifthenelse{\equal{\TUL@nguage}{EN}}%
            {\renewcommand{\appendixname}{Appendix}}%
            {\renewcommand{\appendixname}{Příloha}}%
        \titleformat{\chapter}
            {\color{\titlecolor}\TUL@headfnt\LARGE\raggedright}
            {\appendixname~\thechapter}
            {1em}
            {}%
        \ifthenelse{\equal{\TUL@nguage}{EN}}%
            {%
             \addtocontents{toc}{%
                \protect\renewcommand{\protect\cftchappresnum}{\appendixname~}%
                \protect\setlength{\protect\cftchapnumwidth}{6.4em}}%
            }{%
             \addtocontents{toc}{%
                \protect\renewcommand{\protect\cftchappresnum}{\appendixname~}%
                \protect\setlength{\protect\cftchapnumwidth}{5.3em}}%
            }%
    \fi%
}{%
    % Konec prostředí
}

% Příkaz generující seznam příloh (LOA = List of Appendices)
\newcommand{\TULthesisLOA}{%
    \if@inTULappendix
        \phantomsection%
        \etocdepthtag.toc{TOC}%
        \ifthenelse{\equal{\TUL@nguage}{EN}}
        {\addcontentsline{toc}{chapter}{List of Appendices}}
        {\addcontentsline{toc}{chapter}{Seznam příloh}}
        \addtocontents{toc}{\protect\TUL@HideAppendices}%
        \etocdepthtag.toc{LOA}%
        \ifthenelse{\equal{\TUL@nguage}{EN}}
        {\chapter*{List of Appendices}}
        {\chapter*{Seznam příloh}}
        \etocsettagdepth{TOC}{none}%
        \etocsettagdepth{LOA}{subsection}%
        \def\TUL@HideAppendices{}%
        \etocsettocstyle{}{}%
        \tableofcontents
    \else
        \ClassError{tulthesis}{%
            Command \protect\TULthesisLOA\space used outside the TULthesisAppendix environment.%
        }{%
            This command can only be used when wrapped with TULthesisAppendix.%
        }%
    \fi
}
