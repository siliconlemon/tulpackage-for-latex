# Konfigurace biblatexu pro použití upravených stylů (CS)

Umístěním následujícího bloku kódu do vaší preambule dosáhnete použití
upravených verzí citačních stylů namísto těch výchozích pro biblatex.

> **POZOR:** Tento projekt využívá sestavovací skript `latexmkrc` k dynamickému načítání stylů. 
  Pro správnou funkčnost je nutné dokument kompilovat pomocí nástroje `latexmk` 
  (výchozí nastavení v Overleafu). **Nepoužívejte** přímé volání kompilátoru 
  (např. `xelatex` nebo `pdflatex`), jinak bude konfigurace ignorována a načte se 
  pouze výchozí systémový styl.

```latex
% POZNÁMKA: Balík polyglossia je součástí tul.sty, zde s ním nastavujeme jazyk
\setdefaultlanguage{czech}
% Podpora českých uvozovek v citacích
\usepackage{csquotes}
% Balík biblatex načítá iso 690 konfigurace podle souboru ./latexmkrc
% Konfiguraci můžete změnit v hlavičce latexmkrc souboru (tul / ef / zotero)
% Ovlivněn bude poze styl ISO690 (ostatní zůstávají nedotčené)
\usepackage[
  backend=biber,
  style=iso-authoryear,
  sortlocale=cs_CZ,
  autolang=other,
  bibencoding=utf8
]{biblatex}
% Nalinkování cesty k souboru bibliografie
\addbibresource{./bibliography/references.bib}
```

Momentálně jsou dostupné následující možnosti (podsložky v adresáři ./biblatex)

- **iso690-zotero:** Standardní konfigurace ISO 690 kopírující nastavení Zotera.
- **iso690-tul:** Upravená konfigurace ISO 690 odpovídající souboru *TUL-iso-690-2022-ad.csl*
- **iso690-ef:** Dále upravená verze výše zmíněné *iso690-tul*, odpovídající (ač nesmyslné, tak vyžadované) konfiguraci EF TUL.

## Rozdíly verze TUL oproti standardnímu ISO 690

- **Autoři (bibliografie):** Vypisuje max. 5 autorů (pokud je jich 6 a více).
- **Autoři (citace):** Vypisuje 1 autora + et al. (pokud jsou 3 a více).
- **Formátování:** DOI jako plné URL (`https://`), dvojtečka za "Dostupné z", bez čárky před "et al.".
- **Lokalizace:** Používá zkratky "s.n." a "s. a.", předložku "z".

**Specifika pro soubory `.bib` (nové příkazy):**

- **@software**:
  - Tento typ záznamu se nově mapuje na "program".
  - Pole `howpublished` se v tomto typu automaticky vypíše s prefixem "Systémové požadavky:".
- **@movie**:
  - Nový samostatný ovladač (dříve jen alias na knihu).
  - Pole `publisher` se vypíše s prefixem "Nahrál:".
- **nick / nickname**:
  - Nová pole podporovaná u typu `@online`.
  - Automaticky se mapují do systémového pole `usera` a zobrazují se v hranatých závorkách za jménem autora.
- **Patenty**: Logika upravena tak, aby vždy preferovala autora (vynálezce) na úkor vlastníka (`holder`), i když je `holder` vyplněn.

## Rozdíly verze EF oproti stylu TUL

Verze ISO690-EF většinově kopíruje styl ISO690-TUL. Liší se ale v následujících (dosti zvláštních) bodech, 
aby odpovídala doslovnému znění fakultní směrnice o kvalifikačních pracích.

- **Časopisy:** Vynucuje použití anglických zkratek **"vol."** a **"no."** (místo standardních českých "roč." a "č."), a to i v českém textu.
- **Odkazy:** URL adresy a DOI **nejsou podtržené** (standardní styl TUL podtržení aktivně vynucuje u všech typů elektronických zdrojů).

---

# Configuring biblatex to use customized citation styles (EN)

By placing the following code block in your preamble, you can reconfigure LaTeX to use
customized versions of citation styles instead of the default ones from biblatex.

> **CAUTION:** This project uses a `latexmkrc` build script to dynamically load citation styles. 
  For this to work, you must compile the document using `latexmk` (standard on Overleaf). 
  **Do not use** direct compiler commands (e.g., `xelatex` or `pdflatex`), otherwise 
  the configuration will be ignored and LaTeX will fall back to the default system style.

```latex
% NOTE: The polyglossia package is part of tul.sty, here we set the language
\setdefaultlanguage{english}
% Biblatex loads the iso 690 config based on the ./latexmkrc
% You can change the latexmkrc config to (tul / ef / zotero), it will only affect the ISO690 styling
\usepackage[
  backend=biber,
  style=iso-authoryear,
  sortlocale=en_US,
  autolang=other,
  bibencoding=utf8
]{biblatex}
% Link to the bibliography file path
\addbibresource{./bibliography/references.bib}
```

The following options are currently available (subdirectories in `./biblatex`):

- **iso690-zotero:** Standard ISO 690 configuration, matching the default Zotero style
- **iso690-tul:** Modified ISO 690 configuration corresponding to the *TUL-iso-690-2022-ad.csl* file
- **iso690-ef:** Further modified version of the aforementioned *iso690-tul*, corresponding to the (albeit nonsensical, yet required) configuration of EF TUL

## Differences between ISO 690 and the TUL version

- **Authors (Bibliography):** Lists max. 5 authors (if there are 6 or more).
- **Authors (Citations):** Lists 1 author + et al. (if there are 3 or more).
- **Formatting:** DOI as full URL (`https://`), colon after "Available at", no comma before "et al.".
- **Localization:** Uses Latin abbreviations "s.n." and "s. a.", preposition "z" (from) [irrelevant for the English config].

**Specifics for `.bib` file (new commands):**

- **@software**:
  - This entry type now maps to "program".
  - The `howpublished` field in this type is automatically prefixed with "System requirements:".

- **@movie**:
  - New standalone driver (previously just an alias to book).
  - The `publisher` field is printed with the prefix "Recorded by:".

- **nick / nickname**:
  - Newly supported fields for the `@online` type.
  - Automatically mapped to the system field `usera` and displayed in square brackets after the author's name.

- **Patents**:
  - Logic adjusted to always prefer the author (inventor) over the owner (`holder`), even if `holder` is populated.

## Differences between the TUL style and the EF version

The ISO690-EF version mostly copies the ISO690-TUL style. However, it differs in the following (rather peculiar) points to comply with the literal wording of the faculty directive on final theses.

- **Periodicals:** Forces the use of English abbreviations **"vol."** and **"no."** (instead of the standard Czech "roč." and "č."), even within Czech text [irrelevant for the English config].
- **Links:** URLs and DOIs are **not underlined** (whereas the standard TUL style actively enforces underlining for all electronic source types).
