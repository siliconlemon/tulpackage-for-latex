<a name="czech"></a>

# tulpackage-for-latex

[English version below](#english)

LaTeX balík připravený k okamžitému použití na platformě Overleaf i lokálně 
v desktop editorech (k dispozici je setup pro Zed). Obsahuje styly a třídy 
pro psaní dokumentů v souladu se směrnicemi Technické univerzity v Liberci (TUL). 
Projekt navazuje na původní balík `tulthesis v2.1` z dílny FM TUL, 
jde ale cestou uživatelské příjemnosti na úkor používání více balíků a nastavení.

> **Důležité:** Dokumentace je aktuálně primárně v češtině; návody v EN zatím neexistují.

## Co repo obsahuje

- **Balík `tul` (`tul.sty`)**: hlavní část balíku (styl). Definuje barvy, loga, nadpisy, 
  záhlaví/zápatí, možnosti nastavení nebo pravidla formátování.
- **Třída `tulthesis` (`tulthesis.cls`)**: třída pro závěrečné práce a podobné rozsáhlejší dokumenty.
- **Třída `tularticle` (`tularticle.cls`)**: třída pro běžné dokumenty/články ve stylu TUL, 
  s jednodušším startem bez složité preambule.

## Instalace a použití

### Overleaf

Doporučený postup je stáhnout připravený ZIP 
z [RELEASES](https://github.com/siliconlemon/tulpackage-for-latex/releases) 
a nahrát ho do projektu:

1. Stáhněte aktuální [RELEASE (verzi)](https://github.com/siliconlemon/tulpackage-for-latex/releases) ve formátu zip.
2. V Overleaf projektu klikněte na **Add files → Upload** a nahrajte ZIP.
3. Repo obsahuje šablonové soubory `thesis-template.tex` a `article-template.tex`, 
   které si můžete zkopírovat nebo přejmenovat a rovnou používat.

Kompletní seznam možností nastavení tříd/balíku, které můžete použít při inicializaci, 
najdete v [OPTIONS.md](./OPTIONS.md). Jako příklad níže uvádím inicializaci dokumentu
bakalářky/diplomky v barvách fakulty mechatroniky, v anglickém jazyce, dvoustranném tisku, s předdefinovanými okraji a číslováním podle zásad TUL.

```latex
\documentclass[FM,EN,twoside,margins,numbering]{tulpackage/tulthesis}
```

### Lokální distribuce LaTeXu (TeXworks, TeXstudio, Zed Editor, VS Code)

Balík vyžaduje překlad pomocí **XeLaTeX nebo LuaLaTeX** (pdfLaTeX není podporován).
Jako externí distribuci **LaTeXu** s podporou pro **XeLaTeX** na zařízeních Windows 
doporučuji [MiKTeX](https://miktex.org/download) (všechno uvnitř repa je v něm otestováno).

Postup nastavení pro desktop editory (aktuálně cílený na Zed; 
VS Code bude fungovat podobně) najdete v souboru [SETUP.md](./SETUP.md). 

#### Požadované balíky (společné pro `tul`, `tulthesis` i `tularticle`)
Importy jsou centralizované v souboru `tulpackage/modules/packages.tex`.

| Balík         | Popis                                           |
|---------------|-------------------------------------------------|
| `booktabs`    | Kvalitnější sazba tabulek                       |
| `caption`     | Úpravy popisků (obrázky/tabulky)                |
| `enumitem`    | Pokročilé nastavení seznamů                     |
| `etoolbox`    | Úprava/patchování existujících příkazů          |
| `fancyhdr`    | Vlastní záhlaví a zápatí                        |
| `float`       | Lepší kontrola nad plovoucími objekty           |
| `fontspec`    | Práce s OpenType fonty                          |
| `framed`      | Rámečky a orámované bloky                       |
| `fvextra`     | Rozšíření práce s verbatim / kódem              |
| `graphicx`    | Vkládání obrázků                                |
| `hyperref`    | Vytváření hypertextových odkazů v PDF dokumentu |
| `ifthen`      | Podmíněné příkazy                               |
| `makeidx`     | Pro vytváření rejstříků                         |
| `metalogo`    | Sazba log typů enginů (XeLaTeX/LuaLaTeX apod.)  |
| `parskip`     | Mezery mezi odstavci (místo odstavcové zarážky) |
| `pdfpages`    | Vkládání PDF souborů                            |
| `polyglossia` | Podpora různých jazyků                          |
| `silence`     | Potlačení varování                              |
| `tabularray`  | Moderní tvorba tabulek                          |
| `tabularx`    | Tabulky s proměnnou šířkou sloupců              |
| `titlesec`    | Úprava nadpisů                                  |
| `tocloft`     | Úprava obsahu, seznamu obrázků a tabulek        |
| `xcolor`      | Definice a použití barev                        |

#### Třída tulthesis

**Dostupné možnosti nastavení (`tulthesis`):**

- `article` – Základní třída je přepnuta na `article` (výchozí je `report`).
- `EN` – Dokument je přepnut do anglického jazyka.
- `BP`, `DP`, `Dis`, `Hab`, `Teze`, `Autoref`, `Proj`, `SP` – Je nastaven typ práce (BP, DP, Disertační, Habilitační, Teze, Autoreferát, Projekt, Seminárka).
- `FS`, `FT`, `FP`, `EF`, `FA`, `FM`, `FZS`, `UZS`, `CXI` – Je nastaven styl dokumentu podle fakulty.
- `bwtitles` – Barevné nadpisy jsou vypnuty.
- `bw` – Všechny barevné prvky jsou vypnuty, aktivován je černobílý režim.
- `fonts` – Budou používány lokálně uložené fonty TUL.
- `sfbody` – V těle dokumentu bude použit bezpatkový font.
- `sfheadings` – V nadpisech bude použit bezpatkový font.
- `nopdf` – Metadata PDF souboru budou deaktivována a podmíněně nebude načten balík `hyperref`.

**Speciální příkazy třídy `tulthesis.cls`:**

- `\TUL@baseclass`: Makro, do kterého je uložen název základní třídy
- `\TUL@levelCZ`, `\TUL@levelEN`: Text označující typ práce v českém a anglickém jazyce
- `\TUL@kat`: Zkratka kategorie práce (například BP)
- `\TULpraceou`, `\TULpracee`: Deklinace názvu práce
- `\TULpracerod`: Přepínač pro určení rodu názvu práce
- `\TULthesisType`: Příkaz pro nastavení typu práce
- `\TUL@nazevCZ`, `\TUL@nazevEN`: Makra pro název práce v českém a anglickém jazyce
- `\TULtitle`: Příkaz pro nastavení názvu práce
- `\TUL@autor`: Makro pro jméno autora
- `\TULauthor`: Příkaz pro nastavení jména autora
- `\TUL@vedouci`: Makro pro jméno vedoucího práce
- `\TULsupervisor`: Příkaz pro nastavení jména vedoucího práce
- `\TULconsultant`: Příkaz pro přidání konzultanta
- `\TUL@programCZ`, `\TUL@programEN`: Makra pro studijní program
- `\TULprogramme`: Příkaz pro nastavení studijního programu
- `\TULbranch`: Příkaz pro nastavení studijního oboru
- `\TUL@rok`: Makro pro rok odevzdání práce
- `\TULyear`: Příkaz pro nastavení roku odevzdání práce
- `\TULid`: Příkaz pro nastavení identifikačního čísla práce
- `\@ddel`: Pomocný příkaz
- `\begin{uzky@text} ... \end{uzky@text}`: Prostředí pro vložení úzkého textu
- `\ThesisTitle`: Příkaz pro vytvoření titulní strany
- `\Assignment`: Příkaz pro vložení stránky se zadáním
- `\TULfem`: Příkaz pro označení ženského rodu v češtině
- `\TULpraceCZ`: Název práce malými písmeny (česky)
- `\DeclarationCZ`: Prohlášení autora v českém jazyce
- `\ThesisType@EN`: Typ práce malými písmeny (anglicky)
- `\DeclarationEN`: Prohlášení autora v anglickém jazyce
- `\Declaration`: Příkaz pro vložení prohlášení (automaticky v závislosti na jazyce)
- `\ThesisStart`: Příkaz pro zahájení práce
- `\begin{abstractCZ} ...`: Prostředí pro vložení abstraktu v češtině
- `\begin{abstractEN} ...`: Prostředí pro vložení abstraktu v angličtině
- `\begin{keywordsCZ} ...`: Prostředí pro vložení klíčových slov v češtině
- `\begin{keywordsEN} ...`: Prostředí pro vložení klíčových slov v angličtině
- `\begin{acknowledgement} ...`: Prostředí pro vložení poděkování
- `\begin{abbreviations} ...`: Prostředí pro vložení seznamu zkratek
- `\TULthesisTOC`: Předdefinovaný obsah

#### Třída tularticle

**Dostupné možnosti nastavení (`tularticle`):**

- `EN` – Dokument je přepnut do anglického jazyka.
- `FS`, `FT`, `FP`, `EF`, `FA`, `FM`, `FZS`, `UZS`, `CXI` – Je nastaven styl dokumentu podle fakulty.
- `bwtitles` – Barevné nadpisy jsou vypnuty.
- `bw` – Všechny barevné prvky jsou vypnuty, aktivován je černobílý režim.
- `fonts` – Budou používány lokálně uložené fonty TUL.
- `sfbody` – V těle dokumentu bude použit bezpatkový font.
- `sfheadings` – V nadpisech bude použit bezpatkový font.
- `numbering` – Nadpisy budou číslovány.
- `nonumbering` – Číslování nadpisů bude vypnuto (pro jistotu dvakrát).
- `margins` – Text bude odsazen zleva/zprava, a to i pro jednostranný tisk.

**Další příkazy třídy `tularticle.cls`:**

- `nopdf`: Deaktivuje metadata PDF souboru a podmíněně nenačítá balík `hyperref`
- `\TULarticleTOC`: Předdefinovaný obsah
- `\noTULheader`: Vypne výchozí záhlaví TUL

### Jak začít

V root directory najdete soubory `thesis-template.tex` a `article-template.tex`. 
Jedná se o prázdné šablony, které si můžete zkopírovat nebo přejmenovat a rovnou začít pracovat. 

Více o používání balíku najdete v přiloženém souboru `manual-tul.pdf`.

V repositáři jsou dále i ukázkové dokumenty uvnitř složky `example/`:

- `manual-tul.tex` – použití balíku `tul` / třídy `tularticle`
- `manual-tulthesis.tex` – příklad použití třídy `tulthesis`
- `example-tularticle.tex` – jednoduchý příklad pro `tularticle`

Z výše zmíněných souborů si můžete vzít inspiraci ohledně nastavení a použití tříd **tulthesis** a **tularticle**.

> Poznámka k literatuře: Šablony počítají s použitím `biblatex` (backend `biber`), ale balík/třídy ho záměrně nenačítají natvrdo, aby si uživatel mohl zvolit vlastní styl citací a další volby.  
> Pokud chcete literaturu, přidejte si do preambule svého `.tex` souboru např.:
> ```latex
> \usepackage[backend=biber]{biblatex}
> \addbibresource{<váš soubor s bibliografií>.bib}
> ```
> a překládejte přes **biber** (Overleaf to umí, lokálně je potřeba mít biber nainstalovaný a zapnutý v toolchainu).

## Možnosti přizpůsobení

Balík `tulpackage-for-latex` poskytuje několik způsobů, jak upravit vzhled dokumentů.

**Možnosti třídy dokumentu:** Jak již bylo zmíněno v sekci "Instalace a použití", 
jak třída `tulthesis`, tak `tularticle` disponují řadou možností, které lze nastavit 
při deklaraci třídy dokumentu v LaTeXovém souboru. Díky nim je možné:

- Změnit styl dokumentu podle konkrétní fakulty (například `FM`, `EF`, `FS`).
- Aktivovat či deaktivovat barevné nadpisy (`bwtitles`) nebo přepnout do zcela černobílého režimu (`bw`).
- Nastavit, jaké fonty se budou používat (`fonts`, `sfbody`, `sfheadings`).
- A mnoho dalšího. Doporučuje se prozkoumat všechny dostupné možnosti 
  uvnitř [OPTIONS.md](./OPTIONS.md).

**Úpravy v preambuli:** Pokud by tyto možnosti nepostačovaly, je možné dokument dále přizpůsobit 
přidáním standardních příkazů a balíků LaTeXu do preambule daného `.tex` souboru. V ukázkových souborech 
(`manual-tul.tex`, `manual-tulthesis.tex`, `example-tularticle.tex`) je ilustrováno, 
jak se preambule nastavuje - ale pouze v minimální míře. Narozdíl od vzorové verze **v2.1** 
je verze **v3.0.0** (a všechny následující) stavěna tak, aby uživatele vedla co nejrychleji 
k výsledkům, které respektují školní guidelines ohledně vzhledu dokumentů.

## Licence

`tulpackage-for-latex` je šířen pod licencí Creative Commons Attribution (CC BY). 
Podrobnosti jsou uvedeny v souboru [LICENSE](./LICENSE).

## Zásluhy (původní šablona)

Repo `tulpackage-for-latex` navazuje na původní šablonu `tulthesis v2.1` (autor: doc. RNDr. Pavel Satrapa, Ph.D.), 
na které byly postavené první verze tohoto projektu. V současnosti se projekt originálu příliš nepodobá, 
ale stále funguje v duchu stejných designových principů.


<a name="english"></a>

# tulpackage-for-latex (en)

[Česká verze výše](#czech)

This LaTeX package is prepared for immediate use on Overleaf as well as locally 
in desktop editors (a Zed setup is included). It provides styles and classes for writing documents in line with 
the guidelines of the Technical University of Liberec (TUL).

The project builds on the original `tulthesis v2.1` package (FM TUL), but focuses on ease of use even if 
it means relying on more packages and defaults.
> **Important:** Documentation is currently primarily in Czech; English guides do not exist yet.

## What this repo contains

- **Package `tul` (`tul.sty`)**: the main style package. Defines colors, logos, headings, headers/footers, 
  configuration options, and formatting rules.
- **Class `tulthesis` (`tulthesis.cls`)**: a class for theses and other larger academic documents.
- **Class `tularticle` (`tularticle.cls`)**: a class for general documents/articles in the TUL style, 
  with a simpler start (minimal preamble work).

## Installation and usage

### Overleaf

The recommended approach is to download the prepared ZIP
from [RELEASES](https://github.com/siliconlemon/tulpackage-for-latex/releases)
and upload it into your project:

1. Download the latest [RELEASE (version)](https://github.com/siliconlemon/tulpackage-for-latex/releases) as a ZIP.
2. In your Overleaf project, click **Add files → Upload** and upload the ZIP.
3. The repo includes template files `thesis-template.tex` and `article-template.tex`
   which you can copy/rename and start using immediately.

A complete list of class/package initialization options is available in [OPTIONS.md](./OPTIONS.md).  
As an example, below is a thesis setup for the Faculty of Mechatronics, in English, with two-sided printing, 
predefined margins, and section numbering:

```latex
\documentclass[FM,EN,twoside,margins,numbering]{tulpackage/tulthesis}
```

### Local LaTeX distribution (TeXworks, TeXstudio, Zed Editor, VS Code)

This package requires compilation using **XeLaTeX or LuaLaTeX** (pdfLaTeX is not supported).  
On Windows, I recommend **MiKTeX** with XeLaTeX support: https://miktex.org/download 
(everything in this repo has been tested with it).

Setup steps for desktop editors (currently tailored to Zed; VS Code should work similarly) 
are described in [SETUP.md](./SETUP.md).

#### Required packages (shared for `tul`, `tulthesis`, and `tularticle`)
Imports are centralized in `tulpackage/modules/packages.tex`.

| Package       | Description                                        |
|---------------|----------------------------------------------------|
| `booktabs`    | Improved table typesetting                         |
| `caption`     | Caption customization (figures/tables)             |
| `enumitem`    | Advanced list customization                        |
| `etoolbox`    | Patching/modifying existing commands               |
| `fancyhdr`    | Custom headers and footers                         |
| `float`       | Better control over floats                         |
| `fontspec`    | OpenType font support                              |
| `framed`      | Framed / boxed blocks                              |
| `fvextra`     | Extensions for verbatim / code blocks              |
| `graphicx`    | Image inclusion                                    |
| `hyperref`    | Hyperlinks in PDF documents                        |
| `ifthen`      | Conditional commands                               |
| `makeidx`     | Index creation                                     |
| `metalogo`    | Typesetting engine logos (XeLaTeX/LuaLaTeX, etc.)  |
| `parskip`     | Paragraph spacing (instead of first-line indent)   |
| `pdfpages`    | Inclusion of PDF files                             |
| `polyglossia` | Language support                                   |
| `silence`     | Warning suppression                                |
| `tabularray`  | Modern table creation                              |
| `tabularx`    | Tables with flexible column widths                 |
| `titlesec`    | Section heading customization                      |
| `tocloft`     | TOC / list of figures / list of tables formatting  |
| `xcolor`      | Color definition and usage                         |

#### tulthesis class

**Available options (`tulthesis`):**

- `article` – Switch the base class to `article` (default is `report`).
- `EN` – Switch the document to English.
- `BP`, `DP`, `Dis`, `Hab`, `Teze`, `Autoref`, `Proj`, `SP` – Set the thesis/work type (Bachelor, Master, Dissertation, Habilitation, Thesis, Autoref, Project…).
- `FS`, `FT`, `FP`, `EF`, `FA`, `FM`, `FZS`, `UZS`, `CXI` – Set the faculty/institute styling.
- `bwtitles` – Disable colored headings.
- `bw` – Full black & white mode.
- `fonts` – Use the bundled TUL fonts.
- `sfbody` – Use a sans-serif font for the body.
- `sfheadings` – Use a sans-serif font in headings.
- `nopdf` – Disable PDF metadata and conditionally skip loading `hyperref`.

**Special commands in `tulthesis.cls`:**

- `\TUL@baseclass`: Macro storing the name of the base class
- `\TUL@levelCZ`, `\TUL@levelEN`: Work type label in Czech/English
- `\TUL@kat`: Work type shorthand (e.g. BP)
- `\TULpraceou`, `\TULpracee`: Declension helpers for the work title
- `\TULpracerod`: Switch for determining the gender of the work title
- `\TULthesisType`: Command for setting the work type
- `\TUL@nazevCZ`, `\TUL@nazevEN`: Macros for the thesis title in Czech/English
- `\TULtitle`: Command for setting the thesis title
- `\TUL@autor`: Macro for the author's name
- `\TULauthor`: Command for setting the author's name
- `\TUL@vedouci`: Macro for the supervisor's name
- `\TULsupervisor`: Command for setting the supervisor's name
- `\TULconsultant`: Command for adding a consultant
- `\TUL@programCZ`, `\TUL@programEN`: Macros for the study program
- `\TULprogramme`: Command for setting the study program
- `\TULbranch`: Command for setting the field of study
- `\TUL@rok`: Macro for the submission year
- `\TULyear`: Command for setting the submission year
- `\TULid`: Command for setting the thesis ID
- `\@ddel`: Helper command
- `\begin{uzky@text} ... \end{uzky@text}`: Environment for narrow text blocks
- `\ThesisTitle`: Command for creating the title page
- `\Assignment`: Command for inserting the assignment page
- `\TULfem`: Command for selecting feminine gender in Czech
- `\TULpraceCZ`: Thesis/work title in lowercase (Czech)
- `\DeclarationCZ`: Author declaration in Czech
- `\ThesisType@EN`: Work type in lowercase (English)
- `\DeclarationEN`: Author declaration in English
- `\Declaration`: Insert the declaration (automatic depending on language)
- `\ThesisStart`: Start the thesis (front matter)
- `\begin{abstractCZ} ...`: Czech abstract environment
- `\begin{abstractEN} ...`: English abstract environment
- `\begin{keywordsCZ} ...`: Czech keywords environment
- `\begin{keywordsEN} ...`: English keywords environment
- `\begin{acknowledgement} ...`: Acknowledgement environment
- `\begin{abbreviations} ...`: Abbreviations environment
- `\TULthesisTOC`: Predefined TOC

#### tularticle class

**Available options (`tularticle`):**

- `EN` – Switches the document to English.
- `FS`, `FT`, `FP`, `EF`, `FA`, `FM`, `FZS`, `UZS`, `CXI` – Sets the faculty/institute styling.
- `bwtitles` – Disables colored headings.
- `bw` – Full black & white mode.
- `fonts` – Uses the bundled TUL fonts.
- `sfbody` – Uses a sans-serif font in the body.
- `sfheadings` – Uses a sans-serif font in headings.
- `numbering` – Enables section numbering.
- `nonumbering` – Disables section numbering (double precaution).
- `margins` – Applies TUL-like margins (also for single-sided printing).

**Additional commands in `tularticle.cls`:**

- `nopdf`: Disables PDF metadata and conditionally does not load `hyperref`
- `\TULarticleTOC`: Predefined TOC
- `\noTULheader`: Disables the default TUL header

### Getting started

In the root directory, you can find `thesis-template.tex` and `article-template.tex`.
These are blank templates you can copy/rename and start working with immediately.

More info on using the package can be found in the included `manual-tul.pdf`.
Additionally, the repository contains example documents in the `example/` directory:

- `manual-tul.tex` – using the `tul` package / `tularticle` class
- `manual-tulthesis.tex` – example usage of the `tulthesis` class
- `example-tularticle.tex` – minimal example for `tularticle`

You can use the files above as inspiration for configuring and using **tulthesis** and **tularticle**.

> Note on references: The templates assume `biblatex` (with the `biber` backend), but the package/classes intentionally do not load it automatically, so users can choose their own citation style and options.  
> If you want a bibliography, add e.g.:
> ```latex
> \usepackage[backend=biber]{biblatex}
> \addbibresource{<your references file>.bib}
> ```
> and compile using **biber** (Overleaf supports this; locally you need biber installed and enabled in your toolchain).

## Customization options

The `tulpackage-for-latex` package provides multiple ways to customize document appearance.

**Document class options:** As mentioned in the "Installation and usage" section, 
both `tulthesis` and `tularticle` provide many initialization options. With these, you can:

- Switch styling based on faculty (e.g. `FM`, `EF`, `FS`)
- Enable/disable colored headings (`bwtitles`) or switch to full black-and-white mode (`bw`)
- Configure fonts (`fonts`, `sfbody`, `sfheadings`)
- And much more (see [OPTIONS.md](./OPTIONS.md))

**Preamble changes:** If the built-in options are not enough, you can further customize the document 
using standard LaTeX packages/commands in your `.tex` preamble. The sample files 
`manual-tul.tex`, `manual-tulthesis.tex`, `example-tularticle.tex` illustrate how the preamble 
can be configured (in a minimal way). Unlike the original **v2.1** template, version **v3.0.0** 
(and all following releases) aims to get users to results quickly while still respecting TUL styling guidelines.

## License

`tulpackage-for-latex` is distributed under the Creative Commons Attribution (CC BY) license. 
Details are available in [LICENSE](./LICENSE).

## Special credit (original template)

The `tulpackage-for-latex` repo builds on the original `tulthesis v2.1` template 
(author: doc. RNDr. Pavel Satrapa, Ph.D.), which served as the foundation for the first versions of this project. 
The project does not resemble the original too much, but it still follows the same design principles.
