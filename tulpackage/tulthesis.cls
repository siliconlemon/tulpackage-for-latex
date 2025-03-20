\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{./tulpackage/tulthesis}[2024/12/02 version 2.1 fork 0.1]
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
% article:  Přepne základní třídu na article (výchozí je report)
% EN:  Přepíná dokument do angličtiny
% BP, DP, Dis, Hab, Teze, Autoref, Proj, SP:  Nastavení typu práce
% FS, FT, FP, EF, FA, FM, FZS, UZS, CXI:  Styl dokumentu podle fakulty
% bwtitles:  Vypíná barevné nadpisy
% bw:  Vypíná všechny barevné prvky, monochromatický režim
% fonts:  Používání lokálně uložených fontů TUL
% sfbody:  Patkový font v těle dokumentu
% sfheadings:  Patkový font v nadpisech
% nopdf:  Deaktivace PDF metadat a podmíněné nenačítání hyperref

% Vlastní možnosti a příkazy třídy tulthesis.cls:
% ==========================================================================
% \TUL@baseclass:  Makro pro uložení názvu základní třídy
% \TUL@levelCZ, \TUL@levelEN:  Text typu práce v češtině a angličtině
% \TUL@kat:  Zkratka kategorie práce (např. BP)
% \TULpraceou, \TULpracee:  Skloňování názvu práce
% \TULpracerod:  Přepínač rodu pro název práce
% \TULthesisType:  Příkaz pro nastavení typu práce
% \TUL@nazevCZ, \TUL@nazevEN:  Makra pro název práce v CZ a EN
% \TULtitle:  Příkaz pro nastavení názvu práce
% \TUL@autor:  Makro pro jméno autora
% \TULauthor:  Příkaz pro nastavení jména autora
% \TUL@vedouci:  Makro pro jméno vedoucího práce
% \TULsupervisor:  Příkaz pro nastavení jména vedoucího práce
% \TULconsultant:  Příkaz pro přidání konzultanta
% \TUL@programCZ, \TUL@programEN:  Makra pro studijní program
% \TULprogramme:  Příkaz pro nastavení studijního programu
% \TULbranch:  Příkaz pro nastavení studijního oboru
% \TUL@rok:  Makro pro rok práce
% \TULyear:  Příkaz pro nastavení roku práce
% \TULid:  Příkaz pro nastavení identifikačního čísla práce
% \@ddel:  Pomocný příkaz
% \begin{uzky@text} ... \end{uzky@text}:  Prostředí pro úzký text
% \ThesisTitle:  Příkaz pro vytvoření titulní strany
% \Assignment:  Příkaz pro vložení stránky se zadáním
% \TULfem:  Příkaz pro ženský rod v češtině
% \TULpraceCZ:  Název práce v malých písmenech (česky)
% \DeclarationCZ:  Prohlášení autora v češtině
% \ThesisType@EN:  Typ práce v malých písmenech (anglicky)
% \DeclarationEN:  Prohlášení autora v angličtině
% \Declaration:  Příkaz pro vložení prohlášení (automaticky podle jazyka)
% \ThesisStart:  Příkaz pro zahájení práce
% \begin{abstractCZ} ... :  Prostředí pro abstrakt v češtině
% \begin{abstractEN} ... :  Prostředí pro abstrakt v angličtině
% \begin{keywordsCZ} ... :  Prostředí pro klíčová slova v češtině
% \begin{keywordsEN} ... :  Prostředí pro klíčová slova v angličtině
% \begin{acknowledgement} ... :  Prostředí pro poděkování
% \begin{abbrList} ... :  Prostředí pro seznam zkratek
% \TULthesisTOC:  Předdefinovaný obsah

% Výchozí třída dokumentu (report je výchozí, lze přepnout na article)
\newcommand{\TUL@baseclass}{report}
\DeclareOption{article}{\renewcommand{\TUL@baseclass}{article}}
\DeclareOption{report}{}

% Typ práce v češtině a angličtině + zkratka kategorie (např. BP)
\newcommand{\TUL@levelCZ}{Bakal\'{a}\v{r}sk\'{a} pr\'{a}ce}
\newcommand{\TUL@levelEN}{Bachelor thesis}
\newcommand{\TUL@kat}{BP}

% Skloňování názvu práce podle rodu
\newcommand{\TULpraceou}{bakal\'a\v rskou pr\'aci}
\newcommand{\TULpracee}{bakal\'a\v rsk\'e pr\'ace}
% Přepínač rodu: #1 pro projekt, #2 pro práce, #3 pro teze
\newcommand{\TULpracerod}[3]{#2}

% Přepnutí na anglickou verzi (předává volbu balíku EN)
\DeclareOption{EN}{\PassOptionsToPackage{\CurrentOption}{EN}}

% Konfigurace pro různé typy prací (např. Diplomová práce, Disertační práce atd.)
\DeclareOption{BP}{}
\DeclareOption{DP}{
    \renewcommand{\TUL@levelCZ}{Diplomov\'{a} pr\'{a}ce}
    \renewcommand{\TUL@levelEN}{Master thesis}
    \renewcommand{\TULpraceou}{diplomovou pr\'aci}
    \renewcommand{\TULpracee}{diplomov\'e pr\'ace}
    \renewcommand{\TULpracerod}[3]{#2}
    \renewcommand{\TUL@kat}{DP}}
\DeclareOption{Dis}{
    \renewcommand{\TUL@levelCZ}{Diserta\v cn\'\i\ pr\'{a}ce}
    \renewcommand{\TUL@levelEN}{Dissertation}
    \renewcommand{\TULpraceou}{diserta\v cn\'{\i} pr\'aci}
    \renewcommand{\TULpracee}{diserta\v cn\'{\i} pr\'ace}
    \renewcommand{\TULpracerod}[3]{#2}
    \renewcommand{\TUL@kat}{Dis}}
\DeclareOption{Hab}{
    \renewcommand{\TUL@levelCZ}{Habilita\v cn\'\i\ pr\'{a}ce}
    \renewcommand{\TUL@levelEN}{Habilitation thesis}
    \renewcommand{\TULpraceou}{habilita\v cn\'{\i} pr\'aci}
    \renewcommand{\TULpracee}{habilita\v cn\'{\i} pr\'ace}
    \renewcommand{\TULpracerod}[3]{#2}
    \renewcommand{\TUL@kat}{Hab}}
\DeclareOption{Teze}{
    \renewcommand{\TUL@levelCZ}{Teze diserta\v cn\'\i\ pr\'{a}ce}
    \renewcommand{\TUL@levelEN}{Dissertation thesis draft}
    \renewcommand{\TULpraceou}{teze diserta\v cn\'{\i} pr\'ace}
    \renewcommand{\TULpracee}{tez\'{\i} diserta\v cn\'{\i} pr\'ace}
    \renewcommand{\TULpracerod}[3]{#3}
    \renewcommand{\TUL@kat}{Teze}}
\DeclareOption{Autoref}{
    \renewcommand{\TUL@levelCZ}{Autorefer\'{a}t diserta\v cn\'\i\ pr\'{a}ce}
    \renewcommand{\TUL@levelEN}{Dissertation thesis summary}
    \renewcommand{\TULpraceou}{autorefer\'{a}t diserta\v cn\'{\i} pr\'ace}
    \renewcommand{\TULpracee}{autorefer\'{a}tu diserta\v cn\'{\i} pr\'ace}
    \renewcommand{\TULpracerod}[3]{#1}
    \renewcommand{\TUL@kat}{Autoref}}
\DeclareOption{Proj}{
    \renewcommand{\TUL@levelCZ}{Projekt}
    \renewcommand{\TUL@levelEN}{Project report}
    \renewcommand{\TULpraceou}{projekt}
    \renewcommand{\TULpracee}{projektu}
    \renewcommand{\TULpracerod}[3]{#1}
    \renewcommand{\TUL@kat}{RP}}
\DeclareOption{SP}{
    \renewcommand{\TUL@levelCZ}{Semestr\'{a}ln\'\i\ pr\'{a}ce}
    \renewcommand{\TUL@levelEN}{Semestral work}
    \renewcommand{\TULpraceou}{semestr\'aln\'{\i} pr\'aci}
    \renewcommand{\TULpracee}{semestr\'aln\'{\i} pr\'ace}
    \renewcommand{\TULpracerod}[3]{#2}
    \renewcommand{\TUL@kat}{SP}}

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

% Další volby pro barvy, fonty a nadpisy
\DeclareOption{bwtitles}{\PassOptionsToPackage{\CurrentOption}{tul}}
\DeclareOption{bw}{\PassOptionsToPackage{\CurrentOption}{tul}}
\DeclareOption{fonts}{\PassOptionsToPackage{\CurrentOption}{tul}}
\DeclareOption{sfbody}{\PassOptionsToPackage{\CurrentOption}{tul}}
\DeclareOption{sfheadings}{\PassOptionsToPackage{\CurrentOption}{tul}}

% Aktivace nebo deaktivace PDF metadat
\newif\ifTUL@pdf
\TUL@pdftrue
\DeclareOption{nopdf}{\TUL@pdffalse}

% Předání neznámých voleb základní třídě dokumentu
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{\TUL@baseclass}}

% Zpracování všech voleb
\ProcessOptions\relax

% Načtení základní třídy dokumentu s výchozím nastavením
\LoadClass[a4paper,12pt]{\TUL@baseclass}

% Načtení balíku TUL s vypnutými záhlavími a zapnuýmimi zápatími
\RequirePackage[noheader]{tulpackage/tul}
\noTULfooter

% Základní balíky pro logiku a tabulky
\RequirePackage{ifthen}
\RequirePackage{tabularray}
% Nastavení textů šablony tabulek v češtině
\ifthenelse{\equal{\TUL@nguage}{EN}}{}{
    \DefTblrTemplate{conthead-text}{default}{(pokračování)}
    \DefTblrTemplate{contfoot-text}{default}{pokračuje na další straně\,\ldots}
}

% Balík pro vkládání PDF souborů
\RequirePackage{pdfpages}

% Aktivace balíku hyperref (pouze pokud je povolen PDF režim)
\ifTUL@pdf
 \RequirePackage{hyperref}
 \hypersetup{colorlinks=true, linkcolor=tul, urlcolor=tul, citecolor=tul}
\fi

% Definice typu práce
\newcommand{\TULthesisType}[2]{\renewcommand{\TUL@levelCZ}{#1}%
\renewcommand{\TUL@levelEN}{#2}}

% Název práce (čeština a angličtina)
\newcommand{\TUL@nazevCZ}{Chyb\'\i\ \textbackslash TULtitle\{\v{c}esky\}\{anglicky\}}
\newcommand{\TUL@nazevEN}{English title}
\newcommand{\TULtitle}[2]{\renewcommand{\TUL@nazevCZ}{#1}%
\renewcommand{\TUL@nazevEN}{#2}%
\ifTUL@pdf
 \ifthenelse{\equal{\TUL@nguage}{EN}}{\hypersetup{pdftitle={#2}}}{\hypersetup{pdftitle={#1}}}
\fi}

% Autor práce
\newcommand{\TUL@autor}{Chyb\'\i\ \textbackslash TULauthor\{jm\'eno\}}
\newcommand{\TULauthor}[1]{\renewcommand{\TUL@autor}{#1}
\ifTUL@pdf
 \hypersetup{pdfauthor={#1}}
\fi}

% Vedoucí práce
\newcommand{\TUL@vedouci}{Chyb\'\i\ \textbackslash TULsupervisor\{jm\'eno\}}
\newcommand{\TULsupervisor}[1]{\renewcommand{\TUL@vedouci}{#1}}

% Konzultant (více konzultantů povoleno)
\newcounter{TULk@nzult}
\setcounter{TULk@nzult}{0}
\newcommand{\TULconsultant}[1]{\stepcounter{TULk@nzult}\@namedef{\roman{TULk@nzult}@TULkonzultant}{#1}}

% Studijní program (čeština a angličtina)
\newcommand{\TUL@programCZ}{Chyb\'\i\ \textbackslash TULprogramme\{k\'od\}\{\v{c}esky\}\{anglicky\}}
\newcommand{\TUL@programEN}{Study Programme}
\newcommand{\TULprogramme}[3]{\renewcommand{\TUL@programCZ}{#1 -- #2}%
\renewcommand{\TUL@programEN}{#1 -- #3}}

% Studijní obory (více oborů povoleno)
\newcounter{TUL@bor}
\setcounter{TUL@bor}{0}
\newcommand{\i@TULoborCZ}{Chyb\'\i\ \textbackslash TULbranch\{k\'od\}\{\v{c}esky\}\{anglicky\}}
\newcommand{\i@TULoborEN}{Study Branches}
\newcommand{\TULbranch}[3]{%
  \stepcounter{TUL@bor}
  \ifthenelse{\equal{#1}{}}{
    \@namedef{\roman{TUL@bor}@TULoborCZ}{#2}%
    \@namedef{\roman{TUL@bor}@TULoborEN}{#3}%
  }{
    \@namedef{\roman{TUL@bor}@TULoborCZ}{#1 -- #2}%
    \@namedef{\roman{TUL@bor}@TULoborEN}{#1 -- #3}%
  }
}

% Rok práce (výchozí aktuální rok, možnost přepsání)
\newcommand{\TUL@rok}{\the\year}
\newcommand{\TULyear}[1]{\renewcommand{\TUL@rok}{#1}}

% Identifikační číslo práce
\newcommand{\TULid}[1]{\newcommand{\TUL@id}{#1}}

% Podpůrné příkazy
\newcommand{\@ddel}{\hspace{0.5em}\rule[-0.2em]{0.75pt}{1.2em}\hspace{0.5em}}

% Prostředí pro úzký text (zarovnaný na střed s omezenou šířkou)
\newenvironment{uzky@text}{\begin{center}\begin{minipage}{0.80\textwidth}
\setlength{\parskip}{0.5\baselineskip}}{\end{minipage}\end{center}}

\AtBeginDocument{%
   % Prazdny stil po zalozeni
   \pagestyle{empty}%
}

% Číslování stránek podle jednostranného/dvoustranného režimu
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

% Definice posunutí a šířky pro grafické prvky
\newdimen{\TUL@shift}
\setlength{\TUL@shift}{21mm}
\newdimen{\TUL@wide}
\setlength{\TUL@wide}{\linewidth}
\addtolength{\TUL@wide}{2\TUL@shift}

\newcommand{\ThesisTitle}[1]{{\thispagestyle{TULheaderonly}
\addtolength{\voffset}{2mm}\sffamily

\mbox{}

\vfill

% Nadpis na titulni strance s vzchozi sirkou a odsazenim
\begin{minipage}{\textwidth}
{\noindent\large\TULHeadFont
\ifthenelse{\equal{#1}{EN}}{\TUL@levelEN}{\TUL@levelCZ}\\[\bigskipamount]
\raggedright\fontsize{18pt}{22pt}\selectfont\color{\tulcolor}\TULHeadFont
\ifthenelse{\equal{#1}{EN}}{\TUL@nazevEN}{\TUL@nazevCZ}\par}


\bigskip
\bigskip

% Tabulka s detaily o práci (autor, obory, vedoucí atd.)
\newcommand{\t@nd}{&}  % Alias pro "&"
\newcommand{\n@dpis}{\itshape}  % Styl nadpisů tabulky
\newdimen{\TUL@hodnoty}  % Šířka sloupců pro hodnoty tabulky

\newcounter{TULc@unter}

\setlength{\TUL@hodnoty}{\linewidth}
\addtolength{\TUL@hodnoty}{-15em}
\noindent\begin{tabular}{@{}p{14em}p{\TUL@hodnoty}@{}}
\ifthenelse{\equal{\TUL@kat}{Hab}}{% Specifické pro habilitační práce
  \ifthenelse{\equal{#1}{EN}}{Author}{Autor pr\'ace}: &
  \bfseries\TUL@autor \\
  \ifthenelse{\equal{#1}{EN}}{Field}{Obor}:
   & \ifthenelse{\equal{#1}{EN}}{\i@TULoborEN}{\i@TULoborCZ}
  \\
}{% Obecný formát pro ostatní práce
  \n@dpis \ifthenelse{\equal{#1}{EN}}{Study programme}{Studijn\'\i\ program}: &
  \ifthenelse{\equal{#1}{EN}}{\TUL@programEN}{\TUL@programCZ} \\
  % Výpis studijních oborů, pokud jsou definovány
  \ifthenelse{\value{TUL@bor}=0}{}{%
    \n@dpis
    \ifthenelse{\equal{#1}{EN}}
        {Study branch\ifnum\theTUL@bor>1\relax es\fi}%
        {Studijn\'\i\ obor\ifnum\theTUL@bor>1\relax y\fi}:
     & \ifthenelse{\equal{#1}{EN}}{\i@TULoborEN}{\i@TULoborCZ}
    \\
    \setcounter{TULc@unter}{1}%
    \whiledo{\value{TULc@unter} < \value{TUL@bor}}{%
        \stepcounter{TULc@unter}\t@nd % Zamaskovaný "&"
        \ifthenelse{\equal{#1}{EN}}
            {\@nameuse{\roman{TULc@unter}@TULoborEN}}%
            {\@nameuse{\roman{TULc@unter}@TULoborCZ}}\\
    }%
  }%
  % Základní informace: autor, vedoucí a konzultanti
  \n@dpis
  \ifthenelse{\equal{#1}{EN}}{Author}{Autor pr\'ace}: &
  \bfseries\TUL@autor \\
  \n@dpis
  \ifthenelse{\equal{#1}{EN}}{Supervisor}{Vedouc\'\i\ pr\'ace}: &
  \TUL@vedouci \\
  \@ifundefined{i@TULkonzultant}{}{\n@dpis
      \ifthenelse{\equal{#1}{EN}}
          {Consultant\@ifundefined{ii@TULkonzultant}{}{s}}
          {Konzultant\@ifundefined{ii@TULkonzultant}{}{i}}:
      & \i@TULkonzultant \\}
  % Výpis dalších konzultantů
  \setcounter{TULc@unter}{1}%
  \whiledo{\value{TULc@unter} < \value{TULk@nzult}}{
      \stepcounter{TULc@unter}\t@nd % Zamaskovaný "&"
      \@nameuse{\roman{TULc@unter}@TULkonzultant}\\
  }
}
% Rok a místo
\rule{0pt}{10mm} & Liberec \TUL@rok \\
\end{tabular}

\end{minipage}
\cleardoublepage
}}

% Stránka s pokyny k nahrazení zadáním
\newcommand{\Assignment}{
\mbox{}
\vfill

\begin{center}
\LARGE
\ifthenelse{\equal{\TUL@nguage}{EN}}%
{This page has to be replaced\\[0.5em]by original of an assignment.}%
{Tento list nahra\v{d}te\\[0.5em]origin\'alem zad\'an\'\i.}
\thispagestyle{empty}
\end{center}

\vfill
\cleardoublepage
% \clearpage
}

% Přípona ženského rodu pro slovesa
\newcommand{\TULfem}[1]{\ifthenelse{\equal{#1}{female}}{a}{}}

% Název práce v malých písmenech
\newcommand{\TULpraceCZ}{\lowercase\expandafter{\TUL@levelCZ}}

% Prohlášení autora v češtině
% Argument #1 určuje ženský/mužský rod pro koncovky (např. "vypracovala" pro autorku)
\newcommand{\DeclarationCZ}[1]{%
\vspace{2em}
\section*{\normalfont\color{\titlecolor}\TUL@headfnt\LARGE\raggedright Prohlášení}
\vspace{1.5em}

    Prohla\v{s}uji, \v{z}e \TULpracerod{sv\r uj}{svou}{sv\'e}
    \TULpraceou\ jsem vypracoval\TULfem{#1} samostatn\v{e} jako p\r{u}vodn\'{\i} d\'{\i}lo
    s pou\v{z}it\'{\i}m uveden\'{e} literatury%
    \ifthenelse{\equal{\TUL@kat}{Hab}}{}{ a na z\'{a}klad\v{e} konzultac\'{\i} s vedouc\'{\i}m
    \TULpracerod{m\'eho}{m\'e}{m\'ych} \TULpracee\ a konzultantem}.
    
    \ifthenelse{\equal{\TUL@kat}{Hab}}{}{Jsem si v\v{e}dom\TULfem{#1} toho, \v{z}e
    na \TULpracerod{m\r uj}{mou}{m\'e} \TULpraceou\ se pln\v{e} vztahuje z\'{a}kon
    \v{c}.~121/2000 Sb., o~pr\'{a}vu autorsk\'{e}m, zejm\'{e}na \S~60~-- \v
    skoln\'{\i} d\'{\i}lo.
    
    Beru na v\v edom\'{\i}, \v ze Technick\'a univerzita v~Liberci nezasahuje
    do m\'ych autorsk\'ych pr\'av u\v zit\'{\i}m
    \TULpracerod{m\'eho}{m\'e}{m\'ych} \TULpracee\ pro
    vnit\v rn\'{\i} pot\v rebu Technick\'{e} univerzity v~Liberci.
    
    U\v ziji-li \TULpraceou\ nebo poskytnu-li licenci
    k~\TULpracerod{jeho}{jej\'{\i}mu}{jejich} vyu\v zit\'{\i},
    jsem si v\v edom\TULfem{#1} povinnosti informovat
    o~t\'eto skute\v cnosti Technickou univerzitu v~Liberci;
    v~tomto p\v r\'{\i}pad\v e m\'a Technick\'a univerzita v~Liberci
    pr\'avo ode mne po\v zadovat \'uhradu n\'aklad\r u,
    kter\'e vynalo\v zila na vytvo\v ren\'{\i} d\'{\i}la,
    a\v z do jejich skute\v cn\'e v\'y\v se.
    
    \ifthenelse{\equal{\TUL@kat}{BP} \OR \equal{\TUL@kat}{DP} \OR
    \equal{\TUL@kat}{Dis}}{Sou\v{c}asn\v{e} \v{c}estn\v{e} prohla\v{s}uji,
    \v{z}e text elektronick\'{e} podoby pr\'{a}ce vlo\v{z}en\'{y} do IS STAG
    se shoduje s textem ti\v{s}t\v{e}n\'{e} podoby pr\'{a}ce.}{}}
    
    Beru na v\v{e}dom\'{\i}, \v{z}e \TULpracerod{m\r uj}{m\'a}{m\'e}
    \TULpraceCZ\ \TULpracerod{bude zve\v{r}ejn\v{e}n}{bude zve\v{r}ejn\v{e}na}{budou
    zve\v{r}ejn\v{e}ny} Technickou univerzitou v~Liberci v souladu s~\S~47b
    z\'{a}kona \v{c}.~111/1998 Sb., o~vysok\'{y}ch \v{s}kol\'{a}ch a
    o~zm\v{e}n\v{e} a dopln\v{e}n\'{\i} dal\v{s}\'{\i}ch z\'{a}kon\r{u} (z\'{a}kon
    o~vysok\'{y}ch \v{s}kol\'{a}ch), ve zn\v{e}n\'{\i} pozd\v{e}j\v{s}\'{\i}ch
    p\v{r}edpis\r{u}.
    
    Jsem si v\v{e}dom\TULfem{#1} n\'{a}sledk\r{u}, kter\'{e} podle z\'{a}kona
    o~vysok\'{y}ch \v{s}kol\'{a}ch mohou vypl\'{y}vat z poru\v{s}en\'{\i} tohoto
    prohl\'{a}\v{s}en\'{\i}.

\vspace{3em}
% Datum a podpis
\noindent \the\day. \the\month. \the\year
\hfill
\noindent \TUL@autor
}

% Typu práce (malá písmena, angličtina)
\newcommand{\ThesisType@EN}{\lowercase\expandafter{\TUL@levelEN}}

% Prohlášení autora v angličtině
% (Obdobné jako v češtině, ale přizpůsobeno anglickému textu a legislativě)
\newcommand{\DeclarationEN}{
\vspace{2em}
\section*{\normalfont\color{\titlecolor}\TUL@headfnt\LARGE\raggedright Declaration}
\vspace{1.5em}

    I hereby certify, I, myself, have written my \ThesisType@EN\ as an original and
    primary work using the literature listed below%
    \ifthenelse{\equal{\TUL@kat}{Hab}}{}{ and consulting it with my thesis
    supervisor and my thesis counsellor}.
    
    \ifthenelse{\equal{\TUL@kat}{Hab}}{}{I acknowledge that my \ThesisType@EN\ is
    fully governed by Act No.~121/2000 Coll., the Copyright Act, in particular
    Article~60 -- School Work.
    
    I acknowledge that the Technical University of Liberec does not infringe my
    copyrights by using my \ThesisType@EN\ for internal purposes of the Technical
    University of Liberec.
    
    I am aware of my obligation to inform the Technical University of Liberec on
    having used or granted license to use the results of my \ThesisType@EN; in
    such a case the Technical University of Liberec may require reimbursement of
    the costs incurred for creating the result up to their actual amount.
    
    \ifthenelse{\equal{\TUL@kat}{BP} \OR \equal{\TUL@kat}{DP} \OR
    \equal{\TUL@kat}{Dis}}{At the same time, I honestly declare that the text of
    the printed version of my \ThesisType@EN\ is identical with the text of the
    electronic version uploaded into the IS STAG.}{}}
    
    I acknowledge that the Technical University of Liberec will make my
    \ThesisType@EN\ public in accordance with paragraph~47b of Act No.~111/1998
    Coll., on Higher Education Institutions and on Amendment to Other Acts (the
    Higher Education Act), as amended.
    
    I am aware of the consequences which may under the Higher Education Act result
    from a breach of this declaration.

\vspace{3em}
% Datum a podpis
\noindent \the\day. \the\month. \the\year
\hfill
\noindent \TUL@autor
}

% Prohlášení (automatický výběr mezi češtinou a angličtinou na základě jazyka práce)
% #1 - Určuje rod autora (male/female) pro koncovky v češtině
\newcommand{\Declaration}[1]{
\thispagestyle{empty}
\begin{uzky@text}
\ifthenelse{\equal{\TUL@nguage}{EN}}{\DeclarationEN{#1}}{\DeclarationCZ{#1}}
\end{uzky@text}
\cleardoublepage
}

% Zahájení práce (vložení titulní strany, zadání, prohlášení nebo PDF)
% #1 = Určuje rod autora (male/female) nebo cestu k PDF pro přímé vložení
\newcommand{\ThesisStart}[1]{
\ifthenelse{\equal{#1}{female} \OR \equal{#1}{male}}{
    \ifthenelse{\equal{\TUL@nguage}{EN}}{\ThesisTitle{EN}}{\ThesisTitle{CZ}}
    % Vložení zadání pouze pro určité kategorie prací
    \ifthenelse{\equal{\TUL@kat}{BP}
            \OR \equal{\TUL@kat}{DP}
            \OR \equal{\TUL@kat}{RP}
            \OR \equal{\TUL@kat}{MP}}{\Assignment}{}
    \Declaration{#1}
    }%
{\includepdf[pages=-]{#1}} % Pokud není rod, vloží se PDF (cesta uvedena jako #1)
}

% Prostředí pro abstrakt v češtině
% #1 = Šířka textu (wide/narrow)
\newenvironment{abstractCZ}[1][narrow]{
  \vspace*{0.8em}
  \ifthenelse{\equal{#1}{wide}}%
    {\renewcommand{\endabstractCZ}{\par}}
    {\begin{uzky@text}\renewcommand{\endabstractCZ}{\end{uzky@text}}}
  \chapter*{\TUL@nazevCZ}\section*{Abstrakt}
  \vspace{0.8em}
}{}

% Prostředí pro abstrakt v angličtině
% #1 = Šířka textu (wide/narrow)
\newenvironment{abstractEN}[1][narrow]{
  \vspace*{0.8em}
  \ifthenelse{\equal{#1}{wide}}%
    {\renewcommand{\endabstractEN}{\par}}
    {\begin{uzky@text}\renewcommand{\endabstractEN}{\end{uzky@text}}}
  \chapter*{\TUL@nazevEN}\section*{Abstract}
  \vspace{0.8em}
}{}

%\newcommand{\keywordsCZ}[2][]{\ifthenelse{\equal{#1}{wide}}{}{\begin{uzky@text}}\noindent
%\textbf{Kl\'\i\v{c}ov\'a slova:} #2\ifthenelse{\equal{#1}{wide}}{}{\end{uzky@text}}}

% Prostředí pro klíčová slova v češtině
% #1 = Šířka textu (wide/narrow)
\newenvironment{keywordsCZ}[1][narrow]{\ifthenelse{\equal{#1}{wide}}%
{\renewcommand{\endkeywordsCZ}{\par}}
{\begin{uzky@text}\renewcommand{\endkeywordsCZ}{\end{uzky@text}}}
\vspace{1.0em}
\section*{Kl\'\i\v{c}ov\'a slova}
\vspace{0.8em}}{}


% Prostředí pro klíčová slova v angličtině
% #1 = Šířka textu (wide/narrow)
\newenvironment{keywordsEN}[1][narrow]{\ifthenelse{\equal{#1}{wide}}%
{\renewcommand{\endkeywordsEN}{\par}}
{\begin{uzky@text}\renewcommand{\endkeywordsEN}{\end{uzky@text}}}
\vspace{1.0em}
\section*{Keywords}
\vspace{0.8em}}{}


% Prostředí pro poděkování
% #1 = Šířka textu (wide/narrow)
\newenvironment{acknowledgement}[1][narrow]{
  \ifthenelse{\equal{#1}{wide}}%
    {\renewcommand{\endacknowledgement}{\clearpage}}
    {\begin{uzky@text}\renewcommand{\endacknowledgement}{\end{uzky@text}\clearpage}}
  \ifthenelse{\equal{\TUL@nguage}{EN}}%
    {\vspace{2em}\chapter*{Acknowledgements}\vspace{0.6em}}
    {\vspace{2em}\chapter*{Pod\v ekov\'an\'{\i}}\vspace{0.6em}}
}{}

% Preddefinovany obsah
\newcommand{\TULthesisTOC}{%
  \tableofcontents
  \pagestyle{plain}
  \clearpage
}

% Prostředí pro seznam zkratek
\newenvironment{abbrList}{\phantomsection
  % Nadpis pro seznam zkratek (podle jazyka práce)
  \ifthenelse{\equal{\TUL@nguage}{EN}}%
    {\section*{\large List of abbreviations}\vspace{-1em}}
  {\section*{\Large Seznam zkratek}\vspace{-1em}} % Same for Czech version
  \thispagestyle{plain}
  % Reset šablon pro tabulky (tabularray)
  \DefTblrTemplate{contfoot-text}{default}{}
  \DefTblrTemplate{conthead-text}{default}{}
  \DefTblrTemplate{contfoot}{default}{}
  \DefTblrTemplate{conthead}{default}{}
  \DefTblrTemplate{caption}{default}{}
  \DefTblrTemplate{capcont}{default}{}
  % Seznam zkratek ve dvou sloupcích
  \noindent\tblr[long]{column{2}={co=1}}}
{\endtblr
  \clearpage % Nová stránka po seznamu zkratek
}

% Formátování nadpisů kapitol
\titleformat{\chapter}%
{\normalfont\color{\titlecolor}\TUL@headfnt\LARGE\raggedright}
{\thechapter}{1em}{}
