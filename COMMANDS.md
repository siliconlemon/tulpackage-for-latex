# Přehled příkazů balíku TUL (CS)

## 1. Titulní strany

- **`\TULtitlepage{název}{autor}{vedoucí/popis}`** – Vygeneruje standardní bílou titulní stranu s logem a textem.
- **`\TULfancytitlepage{název}{autor}{vedoucí/popis}`** – Vygeneruje celobarevnou (ozdobnou) titulní stranu v barvě fakulty s bílým písmem.

## 2. Kontaktní údaje a Metadata

Tyto příkazy nastavují údaje, které se vypisují v zápatí stránky.

- **`\TULname{jméno}`** – Nastaví jméno kontaktní osoby (např. autor práce).
- **`\TULposition{funkce}`** – Nastaví funkci/roli kontaktní osoby (např. "Student").
- **`\TULmail{email}`** – Nastaví e-mailovou adresu.
- **`\TULphone{číslo}`** – Nastaví telefonní číslo.

## 3. Chytrá loga a symboly

Tyto příkazy se **automaticky mění** podle zvolené volby fakulty a jazyka při načítání balíčku.

- **`\logo`** – Vloží hlavní logo aktuální fakulty (nebo TUL).
- **`\logowh`** – Bílá varianta loga aktuální fakulty (pro tmavá pozadí).
- **`\logotext`** – Pouze textová část loga aktuální fakulty.
- **`\logotextwh`** – Bílá textová část loga.
- **`\symbolTUL`** (nebo **`\znakTUL`**) – Samostatný symbol (věž) v barvě aktuální fakulty.
- **`\darkTULbg`** – Globálně přepne všechna výše uvedená "chytrá" loga na bílé varianty (vhodné pro dokumenty s tmavým pozadím).

## 4. Statická loga a symboly

Příkazy pro vložení konkrétního loga bez ohledu na nastavení dokumentu.
> Nahraďte `[XX]` zkratkou fakulty: **TUL, FS, FT, FP, EF, FUA, FM, FZS, CXI**.

### Symboly
- **`\symbol[XX]`** (např. `\symbolFS`) – Vloží barevný symbol (ikonu) konkrétní fakulty.
- **`\symbolTULwh`** / **`\znakTULwh`** – Čistě bílý symbol TUL.
- **`\symbolTULbw`** / **`\znakTULbw`** – Černobílý (černý) symbol TUL.

### Česká loga
- **`\logo[XX]`** (např. `\logoFS`) – Plné barevné logo konkrétní fakulty (CZ verze).
- **`\logo[XX]wh`** – Bílé logo konkrétní fakulty (CZ).
- **`\logo[XX]text`** – Pouze text loga konkrétní fakulty (CZ).
- **`\logo[XX]textwh`** – Bílý text loga konkrétní fakulty (CZ).
- **`\logoTULalt`** / **`\logoTULaltwh`** – Alternativní třířádkové logo univerzity (pouze pro TUL).

### Anglická loga
- **`\ENlogo[XX]`** (např. `\ENlogoFS`) – Plné barevné logo konkrétní fakulty (EN verze).
- **`\ENlogo[XX]wh`** – Bílé logo konkrétní fakulty (EN).
- **`\ENlogo[XX]text`** – Pouze text loga konkrétní fakulty (EN).
- **`\ENlogo[XX]textwh`** – Bílý text loga konkrétní fakulty (EN).
- **`\ENlogoTULalt`** / **`\ENlogoTULaltwh`** – Alternativní třířádkové logo (EN).

## 5. Textové konstanty a Systém

- **`\verze`** – Vypíše aktuální verzi balíčku (např. "v3.0.0").
- **`\TULbibname`** – Nadpis sekce literatury ("Seznam použité literatury").
- **`\TUL`** – Vypíše celý název univerzity (dle jazyka).
- **`\CZTUL`** – Vypíše "Technická univerzita v Liberci".
- **`\ENTUL`** – Vypíše "Technical University of Liberec".
- **`\TULsoucast`** – Vypíše celý název aktuální fakulty (dle jazyka).
- **`\CZTULsoucast`** – Český název aktuální fakulty.
- **`\ENTULsoucast`** – Anglický název aktuální fakulty.
- **`\cftfigpresnum`** – Prefix v seznamu obrázků (např. "Obrázek ").
- **`\cfttabpresnum`** – Prefix v seznamu tabulek (např. "Tabulka ").

## 6. Práce s popisky

> **Poznámka:** Pro běžné obrázky a tabulky používejte standardní LaTeX příkaz `\caption{...}`. Balík TUL jej automaticky formátuje.

- **`\sourcecaption{text}`** – Vloží formátovaný text zdroje pod obrázek či tabulku ("Zdroj: text").
- **`\listingcaption{popis}`** – Vloží popisek ke kódu a automaticky přidá záznam do Seznamu zdrojových kódů.

## 7. Seznamy objektů

- **`\listoffigures`** – Vygeneruje seznam obrázků.
- **`\listoftables`** – Vygeneruje seznam tabulek.
- **`\listoflistings`** – Vygeneruje seznam zdrojových kódů.

## 8. Prostředí pro obsah a výpisy

- **`\begin{listing} ... \end{listing}`** – Prostředí pro výpis kódu (bez rámečku).
- **`\begin{slisting} ... \end{slisting}`** – "Small listing" – menší písmo, barevný text.
- **`\begin{linelisting} ... \end{linelisting}`** – Výpis kódu s vertikální čarou.
- **`\begin{tulquote} ... \end{tulquote}`** – Pomocné prostředí pro odsazený text (používají ho výpisy).
- **`\begin{abbreviations} ... \end{abbreviations}`** – Prostředí pro seznam zkratek (založeno na `tabular`).

## 9. Formátování a Vzhled

- **`\oddel`** – Grafický oddělovač (krátká tlustá čára v barvě fakulty).
- **`\TULwide`** – Přepne geometrii stránky na široký režim (menší okraje).
- **`\tulcolor`** – Alias držící název aktuální barvy fakulty (použití: `\color{\tulcolor}`).
- **`\definecolor{tul}{HTML}{...}`** – Definice základní fialové barvy.
- **`\definecolor{tul[XX]}`** – Specifické definice barev pro každou fakultu (např. `tulFS`, `tulCX`).

## 10. Styly stránek a Záhlaví

- **`\pagestyle{TUL}`** – Standardní styl (Hlavička s logem + Patička s kontakty).
- **`\pagestyle{TULnopage}`** – Standard bez čísla stránky.
- **`\pagestyle{TULheaderonly}`** – Pouze hlavička.
- **`\pagestyle{TULfooter}`** – Pouze patička (hlavička prázdná).
- **`\pagestyle{TULfooternopage}`** – Pouze patička bez čísla stránky.
- **`\TULpage`** – Zkratka pro obnovení standardního stylu (Hlavička + Patička).
- **`\TULfooter`** – Zkratka pro obnovení patičky (s číslem stránky).
- **`\TULfooternopage`** – Zkratka pro obnovení patičky (bez čísla stránky).
- **`\noTULheader`** / **`\TULheader`** – Okamžité vypnutí/zapnutí vykreslování hlavičky.
- **`\noTULfooter`** – Vyprázdnění patičky (ponechá číslo stránky).
- **`\nofootaddress`** – Odstraní adresu z patičky (ponechá číslo stránky).

## 11. Písma (Fonts)

- **`\TULMainFont`** – Přepne na hlavní písmo dokumentu (Inter nebo Merriweather).
- **`\TULHeadFont`** – Přepne na písmo nadpisů.
- **`\TULFancyFont`** – Aktivuje ozdobné písmo TUL Mono.
- **`\TULFancyFontBold`** – Tučná verze TUL Mono.
- **`\TULAltMainFont`** – Záložní hlavní písmo (standardní patkové, pokud nejsou TUL fonty).
- **`\TULAltHeadFont`** – Záložní tučné písmo pro nadpisy.

---

# TUL Package Command Overview (EN)

## 1. Title Pages

- **`\TULtitlepage{title}{author}{supervisor/desc}`** – Generates a standard white title page with logo and text.
- **`\TULfancytitlepage{title}{author}{supervisor/desc}`** – Generates a full-color (fancy) title page in the faculty color with white text.

## 2. Contact Info & Metadata

These commands set the details displayed in the page footer.

- **`\TULname{name}`** – Sets the contact person's name (e.g., thesis author).
- **`\TULposition{role}`** – Sets the position/role of the contact person (e.g., "Student").
- **`\TULmail{email}`** – Sets the email address.
- **`\TULphone{number}`** – Sets the phone number.

## 3. Smart Logos & Symbols

These commands **automatically adapt** based on the selected faculty and language options when loading the package.

- **`\logo`** – Inserts the main logo of the current faculty (or TUL).
- **`\logowh`** – White variant of the current faculty logo (for dark backgrounds).
- **`\logotext`** – Text-only part of the current faculty logo.
- **`\logotextwh`** – White text-only part of the logo.
- **`\symbolTUL`** (or **`\znakTUL`**) – Standalone symbol (tower) in the current faculty color.
- **`\darkTULbg`** – Globally switches all "smart" logos above to white variants (useful for documents with dark backgrounds).

## 4. Static Logos & Symbols

Commands to insert a specific logo regardless of document settings.
> Replace `[XX]` with the faculty abbreviation: **TUL, FS, FT, FP, EF, FUA, FM, FZS, CXI**.

### Symbols
- **`\symbol[XX]`** (e.g., `\symbolFS`) – Inserts the colored symbol (icon) of a specific faculty.
- **`\symbolTULwh`** / **`\znakTULwh`** – Pure white TUL symbol.
- **`\symbolTULbw`** / **`\znakTULbw`** – Black and white (black) TUL symbol.

### Czech Logos
- **`\logo[XX]`** (e.g., `\logoFS`) – Full colored logo of a specific faculty (CZ version).
- **`\logo[XX]wh`** – White logo of a specific faculty (CZ).
- **`\logo[XX]text`** – Text-only logo of a specific faculty (CZ).
- **`\logo[XX]textwh`** – White text-only logo of a specific faculty (CZ).
- **`\logoTULalt`** / **`\logoTULaltwh`** – Alternative three-line university logo (TUL only).

### English Logos
- **`\ENlogo[XX]`** (e.g., `\ENlogoFS`) – Full colored logo of a specific faculty (EN version).
- **`\ENlogo[XX]wh`** – White logo of a specific faculty (EN).
- **`\ENlogo[XX]text`** – Text-only logo of a specific faculty (EN).
- **`\ENlogo[XX]textwh`** – White text-only logo of a specific faculty (EN).
- **`\ENlogoTULalt`** / **`\ENlogoTULaltwh`** – Alternative three-line university logo (EN).

## 5. Text Constants & System

- **`\verze`** – Prints the current package version (e.g., "v3.0.0").
- **`\TULbibname`** – Heading for the bibliography section ("References").
- **`\TUL`** – Prints the full university name (based on language).
- **`\CZTUL`** – Prints "Technická univerzita v Liberci".
- **`\ENTUL`** – Prints "Technical University of Liberec".
- **`\TULsoucast`** – Prints the full name of the current faculty (based on language).
- **`\CZTULsoucast`** – Czech name of the current faculty.
- **`\ENTULsoucast`** – English name of the current faculty.
- **`\cftfigpresnum`** – Prefix in the list of figures (e.g., "Figure ").
- **`\cfttabpresnum`** – Prefix in the list of tables (e.g., "Table ").

## 6. Caption Commands

> **Note:** For standard figures and tables, use the standard LaTeX command `\caption{...}`. The TUL package formats it automatically.

- **`\sourcecaption{text}`** – Inserts formatted source text under a figure or table ("Source: text").
- **`\listingcaption{description}`** – Inserts a caption for the code and automatically adds an entry to the List of Listings.

## 7. Lists of Objects

- **`\listoffigures`** – Generates the list of figures.
- **`\listoftables`** – Generates the list of tables.
- **`\listoflistings`** – Generates the list of listings.

## 8. Environments for Content & Listings

- **`\begin{listing} ... \end{listing}`** – Environment for code listing (no frame).
- **`\begin{slisting} ... \end{slisting}`** – "Small listing" – smaller font, colored text.
- **`\begin{linelisting} ... \end{linelisting}`** – Code listing with a vertical line.
- **`\begin{tulquote} ... \end{tulquote}`** – Helper environment for indented text (used by listings).
- **`\begin{abbreviations} ... \end{abbreviations}`** – Environment for the list of abbreviations (based on `tabular`).

## 9. Formatting & Layout

- **`\oddel`** – Graphic separator (short thick line in faculty color).
- **`\TULwide`** – Switches geometry to wide mode (smaller margins).
- **`\tulcolor`** – Alias holding the current faculty color name (usage: `\color{\tulcolor}`).
- **`\definecolor{tul}{HTML}{...}`** – Base university purple color definition.
- **`\definecolor{tul[XX]}`** – Specific color definitions for each faculty (e.g., `tulFS`, `tulCX`).

## 10. Page Styles & Headers

- **`\pagestyle{TUL}`** – Standard style (Header with logo + Footer with contacts).
- **`\pagestyle{TULnopage}`** – Standard style without page number.
- **`\pagestyle{TULheaderonly}`** – Header only.
- **`\pagestyle{TULfooter}`** – Footer only (empty header).
- **`\pagestyle{TULfooternopage}`** – Footer only without page number.
- **`\TULpage`** – Shortcut to restore standard style (Header + Footer).
- **`\TULfooter`** – Shortcut to restore footer (with page number).
- **`\TULfooternopage`** – Shortcut to restore footer (without page number).
- **`\noTULheader`** / **`\TULheader`** – Immediately disable/enable header rendering.
- **`\noTULfooter`** – Clears the footer content (keeps page number).
- **`\nofootaddress`** – Removes the address from the footer (keeps page number).

## 11. Fonts

- **`\TULMainFont`** – Switches to the main document font (Inter or Merriweather).
- **`\TULHeadFont`** – Switches to the heading font.
- **`\TULFancyFont`** – Activates the TUL Mono fancy font.
- **`\TULFancyFontBold`** – Bold version of TUL Mono.
- **`\TULAltMainFont`** – Fallback main font (standard serif, if TUL fonts are off).
- **`\TULAltHeadFont`** – Fallback bold font for headings.
