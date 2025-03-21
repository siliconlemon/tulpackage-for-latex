# tulpackage-for-latex

LaTeX balík připravený k okamžitému použití na platformě Overleaf - obsahuje styly a třídy nezbytné pro psaní prací v souladu se směrnicemi Technické univerzity v Liberci (TUL). Jedná se o upravenou verzi původního balíku `tulthesis 2.1`, u které se předpokládá vyšší přístupnost a jednodušší používání, a to i za cenu většího počtu importovaných balíčků a po provedení změn ve struktuře repozitáře.

**Důležité:** Přestože je s tímto balíkem možné psát i v anglickém jazyce, veškeré komentáře a dokumentace jsou v současné době vedeny pouze v češtině.

## ✨ Co tento balík obsahuje?

Balík poskytuje veškeré potřebné nástroje pro vytváření dokumentů odpovídajících stylu Technické univerzity v Liberci:

📌 **`tul.sty`:** Základní kámen celého balíku. Definuje hlavní styly a pravidla formátování pro všechny dokumenty TUL.

📄 **`tulthesis`:** Specializovaná třída určená pro diplomové a podobné rozsáhlejší práce. Vychází z `tul.sty` a vyznačuje se několika vylepšeními pro dosažení lepšího vzhledu.

📰 **`tularticle`:** Třída určená pro tvorbu článků ve stylu TUL. Její použití zjednodušuje nastavování preambule, čímž se umožňuje rovnou se pustit do psaní bez nutnosti provádět složité konfigurace.

## 🛠️ Instalace a použití
### ☁️ Overleaf

Pro použití tohoto `tulpackage-for-latex` na platformě Overleaf se doporučuje postupovat následovně:

1.  **Stažení repozitáře:** Na stránce repozitáře na GitHubu je třeba kliknout na tlačítko "Code" a následně vybrat možnost "Download ZIP".
2.  **Nahrání souboru do Overleafu:** Ve vlastním projektu na Overleafu je nutné kliknout na tlačítko "Add Files" a poté na "Upload". Následně se vybere stažený ZIP soubor, který Overleaf automaticky rozbalí.

### 💻 Lokální distribuce LaTeXu (TeXworks, TeXstudio apod.)

Balík by měl být použitelný i na lokálních zařízení (v TeXworks nebo TeXstudio) – měla by stačit kontrola instalace všech potřebných LaTeX balíků, na kterých `tulpackage-for-latex` závisí.

#### 📄 Třída `tulthesis`

**Požadované balíky:**

| Balík        | Popis                                       |
|--------------|---------------------------------------------|
| `ifthen`     | Podmíněné příkazy                           |
| `tabularray` | Moderní tvorba tabulek                      |
| `pdfpages`   | Vkládání PDF souborů                        |
| `hyperref`   | Vytváření hypertextových odkazů v PDF dokumentu |
| `polyglossia`| Podpora různých jazyků                      |
| `fontspec`   | Práce s OpenType fonty                      |
| `xunicode`   | Lepší práce s Unicode znaky                 |
| `xltxtra`    | Doplňkové funkce pro XeLaTeX                |
| `tabularx`   | Tabulky s proměnnou šířkou sloupců         |
| `makeidx`    | Pro vytváření rejstříků                     |
| `tocloft`    | Pro úpravu obsahu, seznamu obrázků a tabulek |
| `float`      | Pro lepší kontrolu nad obrázky, tabulkami apod. |
| `graphicx`   | Vkládání obrázků                            |
| `xcolor`     | Definice a použití barev                    |
| `fancyhdr`   | Vlastní záhlaví a zápatí                   |
| `silence`    | Potlačení varování                          |
| `etoolbox`   | Úprava existujících příkazů                 |

**Dostupné možnosti nastavení:**

| Možnost   | Popis                                                                                              |
|-----------|----------------------------------------------------------------------------------------------------|
| `article` | Základní třída je přepnuta na article (výchozí je report)                                                 |
| `EN`      | Dokument je přepnut do anglického jazyka                                                                    |
| `BP`, `DP`, `Dis`, `Hab`, `Teze`, `Autoref`, `Proj`, `SP` | Je nastaven typ práce (Bakalářská práce, Diplomová práce, Disertační práce, Habilitační práce, Teze, Autoreferát, Projekt, Seminární práce) |
| `FS`, `FT`, `FP`, `EF`, `FA`, `FM`, `FZS`, `UZS`, `CXI` | Je nastaven styl dokumentu podle fakulty                                                              |
| `bwtitles`| Barevné nadpisy jsou vypnuty                                                                             |
| `bw`      | Všechny barevné prvky jsou vypnuty, aktivován je černobílý režim                                                     |
| `fonts`   | Budou používány lokálně uložené fonty TUL                                                              |
| `sfbody`  | V těle dokumentu bude použit bezpatkový font                                                                        |
| `sfheadings`| V nadpisech bude použit bezpatkový font                                                                     |
| `nopdf`   | Metadata PDF souboru budou deaktivována a podmíněně nebude načten balík `hyperref`                                                    |

**Funkcionality třídy `tulthesis.cls`:**

* `\TUL@baseclass`: Makro, do kterého je uložen název základní třídy
* `\TUL@levelCZ`, `\TUL@levelEN`: Text označující typ práce v českém a anglickém jazyce
* `\TUL@kat`: Zkratka kategorie práce (například BP)
* `\TULpraceou`, `\TULpracee`: Deklinace názvu práce
* `\TULpracerod`: Přepínač pro určení rodu názvu práce
* `\TULthesisType`: Příkaz pro nastavení typu práce
* `\TUL@nazevCZ`, `\TUL@nazevEN`: Makra pro název práce v českém a anglickém jazyce
* `\TULtitle`: Příkaz pro nastavení názvu práce
* `\TUL@autor`: Makro pro jméno autora
* `\TULauthor`: Příkaz pro nastavení jména autora
* `\TUL@vedouci`: Makro pro jméno vedoucího práce
* `\TULsupervisor`: Příkaz pro nastavení jména vedoucího práce
* `\TULconsultant`: Příkaz pro přidání konzultanta
* `\TUL@programCZ`, `\TUL@programEN`: Makra pro studijní program
* `\TULprogramme`: Příkaz pro nastavení studijního programu
* `\TULbranch`: Příkaz pro nastavení studijního oboru
* `\TUL@rok`: Makro pro rok odevzdání práce
* `\TULyear`: Příkaz pro nastavení roku odevzdání práce
* `\TULid`: Příkaz pro nastavení identifikačního čísla práce
* `\@ddel`: Pomocný příkaz
* `\begin{uzky@text} ... \end{uzky@text}`: Prostředí pro vložení úzkého textu
* `\ThesisTitle`: Příkaz pro vytvoření titulní strany
* `\Assignment`: Příkaz pro vložení stránky se zadáním
* `\TULfem`: Příkaz pro označení ženského rodu v češtině
* `\TULpraceCZ`: Název práce malými písmeny (česky)
* `\DeclarationCZ`: Prohlášení autora v českém jazyce
* `\ThesisType@EN`: Typ práce malými písmeny (anglicky)
* `\DeclarationEN`: Prohlášení autora v anglickém jazyce
* `\Declaration`: Příkaz pro vložení prohlášení (automaticky v závislosti na jazyce)
* `\ThesisStart`: Příkaz pro zahájení práce
* `\begin{abstractCZ} ...`: Prostředí pro vložení abstraktu v češtině
* `\begin{abstractEN} ...`: Prostředí pro vložení abstraktu v angličtině
* `\begin{keywordsCZ} ...`: Prostředí pro vložení klíčových slov v češtině
* `\begin{keywordsEN} ...`: Prostředí pro vložení klíčových slov v angličtině
* `\begin{acknowledgement} ...`: Prostředí pro vložení poděkování
* `\begin{abbrList} ...`: Prostředí pro vložení seznamu zkratek
* `\TULthesisTOC`: Předdefinovaný obsah

#### 📰 Třída `tularticle`

**Požadované balíky:**

| Balík        | Popis                                       |
|--------------|---------------------------------------------|
| `ifthen`     | Podmíněné příkazy                           |
| `tabularray` | Moderní tvorba tabulek                      |
| `pdfpages`   | Vkládání PDF souborů                        |
| `hyperref`   | Vytváření hypertextových odkazů v PDF dokumentu |
| `polyglossia`| Podpora různých jazyků                      |
| `fontspec`   | Práce s OpenType fonty                      |
| `xunicode`   | Lepší práce s Unicode znaky                 |
| `xltxtra`    | Doplňkové funkce pro XeLaTeX                |
| `tabularx`   | Tabulky s proměnnou šířkou sloupců         |
| `makeidx`    | Pro vytváření rejstříků                     |
| `tocloft`    | Pro úpravu obsahu, seznamu obrázků a tabulek |
| `float`      | Pro lepší kontrolu nad obrázky, tabulkami apod. |
| `graphicx`   | Vkládání obrázků                            |
| `xcolor`     | Definice a použití barev                    |
| `fancyhdr`   | Vlastní záhlaví a zápatí                   |
| `silence`    | Potlačení varování                          |
| `etoolbox`   | Úprava existujících příkazů                 |

**Dostupné možnosti nastavení:**

| Možnost      | Popis                                                              |
|--------------|--------------------------------------------------------------------|
| `EN`         | Dokument je přepnut do anglického jazyka                                    |
| `FS`, `FT`, `FP`, `EF`, `FA`, `FM`, `FZS`, `UZS`, `CXI` | Je nastaven styl dokumentu podle fakulty                                       |
| `bwtitles`   | Barevné nadpisy jsou vypnuty                                             |
| `bw`         | Všechny barevné prvky jsou vypnuty, aktivován je černobílý režim                 |
| `fonts`      | Budou používány lokálně uložené fonty TUL                              |
| `sfbody`     | V těle dokumentu bude použit bezpatkový font                                      |
| `sfheadings` | V nadpisech bude použit bezpatkový font                                   |
| `numbering`  | Nadpisy budou číslovány                                      |
| `nonumbering`| Číslování nadpisů bude vypnuto (pro jistotu dvakrát)            |
| `margins`    | Text bude odsazen zleva/zprava, a to i pro jednostranný tisk         |

**Další funkce třídy `tularticle.cls`:**

* `nopdf`: Deaktivuje metadata PDF souboru a podmíněně nenačítá balík `hyperref`
* `\TULarticleTOC`: Předdefinovaný obsah
* `\noTULheader`: Vypne výchozí záhlaví TUL

### 📝 Jak začít s používáním?

V balíku se nachází i několik ukázkových dokumentů, které ilustrují jeho funkčnost:

* `manual-tul.tex`: Ukazuje, jak používat základní styl `tul.sty` se standardní třídou dokumentu.
* `manual-tulthesis.tex`: Zde je uveden příklad nastavení preambule a použití třídy `tulthesis` pro diplomové a podobné práce.
* `example-tularticle.tex`: Tento soubor demonstruje použití třídy `tularticle` pro tvorbu článků.

V těchto souborech je možné si prohlédnout, jak se nastavuje preambule a jak se strukturují LaTeXové dokumenty. Kromě toho jsou k dispozici i manuály ve formátu PDF (`manual-tul.pdf`, `manual-tulthesis.pdf`, `example-tularticle.pdf`), ve kterých je vše podrobněji vysvětleno, včetně všech dostupných funkcí a možností. Doporučuje se jejich prostudování.

## 🎨 Možnosti přizpůsobení

Balík `tulpackage-for-latex` poskytuje několik způsobů, jak upravit vzhled dokumentů.

⚙️ **Možnosti třídy dokumentu:** Jak již bylo zmíněno v sekci "Instalace a použití", jak třída `tulthesis`, tak `tularticle` disponují řadou možností, které lze nastavit při deklaraci třídy dokumentu v LaTeXovém souboru. Díky nim je možné:

* 🎨 Změnit styl dokumentu podle konkrétní fakulty (například `FM`, `EF`, `FS`).
* ⚫ Aktivovat či deaktivovat barevné nadpisy (`bwtitles`) nebo přepnout do zcela černobílého režimu (`bw`).
* <0xF0><0x9F><0x96><0x84> Nastavit, jaké fonty se budou používat (`fonts`, `sfbody`, `sfheadings`).
* A mnoho dalšího. Doporučuje se prozkoumat všechny dostupné možnosti.

✍️ **Úpravy v preambuli:** Pokud by tyto možnosti nepostačovaly, je možné dokument dále přizpůsobit přidáním standardních příkazů a balíků LaTeXu do preambule daného `.tex` souboru. V ukázkových souborech (`manual-tul.tex`, `manual-tulthesis.tex`, `example-tularticle.tex`) je ilustrováno, jak se preambule nastavuje. Pokud jsou příkazy používány/definovány přímo v preambulích, znamená to, že je na uživateli, jak si je nastaví.

## 📜 Licence

`tulpackage-for-latex` je šířen pod licencí Creative Commons Attribution (CC BY). Podrobnosti jsou uvedeny v licenčních informacích obsažených v souborech.

## 🙏 Poděkování

Autorství základu tohoto balíku (`tulthesis 2.1`) a tím pádem i všechny zásluhy za jeho fungování patří doktoru Pavlu Satrapovi z FM TUL. Celý `tulpackage-for-latex` je více méně jen usmolený pokus o fork.

* **doc. RNDr. Pavel Satrapa, Ph.D.**
    * E-mail: Pavel.Satrapa@tul.cz
    * Telefon: +420 485 351 234
    * Webová stránka: [www.root.cz/autori/pavel-satrapa/](https://www.root.cz/autori/pavel-satrapa/)
