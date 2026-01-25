# Možnosti balíku TUL (CS)

Tento dokument popisuje všechny dostupné volby (options), které lze použít 
při načítání tříd **tulthesis** a **tularticle**.

**Příklad použití:**
```latex
\documentclass[FM, EN, twoside, margins, numbering]{tulpackage/tulthesis}
```

## 1. Výběr fakulty / ústavu

Vyberte právě jednu z následujících voleb pro nastavení příslušných barev, log a kontaktních údajů.

- **FS** – Fakulta strojní
- **FT** – Fakulta textilní
- **FP** – Fakulta přírodovědně-humanitní a pedagogická
- **EF** (nebo **FE**) – Ekonomická fakulta
- **FUA** (nebo **FA**) – Fakulta umění a architektury
- **FM** – Fakulta mechatroniky, informatiky a mezioborových studií
- **FZS** – Fakulta zdravotnických studií
- **CXI** – Ústav pro nanomateriály, pokročilé technologie a inovace

## 2. Jazyk

- **EN** – Přepne dokument do angličtiny.
- Změní se loga (anglické varianty).
- Změní se automatické texty (Figure, Table, Listing).
- Výchozí stav (bez této volby) je čeština.

## 3. Režimy dokumentu a Tisk

Tyto volby ovlivňují celkový vzhled a chování při kompilaci.

- **twoside** – Zapne **oboustranný tisk**.
- Nastaví střídání vnitřních/vnějších okrajů.
- Umístí čísla stránek střídavě k vnějšímu okraji.

- **draft** – Režim **konceptu**.
- Zobrazí černé obdélníky v místech, kde text přetéká řádek (overfull hbox).
- Urychluje kompilaci (často nenačítá plnou grafiku).

- **print** – Režim pro **barevný tisk**.
- Ponechá barevná loga a obrázky.
- **Vynutí černé odkazy** v textu a obsahu (aby v tisku nesvítily modré hyperlinky).

- **bw** – Plný **černobílý režim**.
- Převede vše do odstínů šedi (včetně log, nadpisů a odkazů).

- **bwtitles** – Pouze **černé nadpisy**.
- Loga zůstávají barevná, ale nadpisy kapitol a sekcí budou černé (místo fakultní barvy).

## 4. Zarovnání (Obrázky a Tabulky)

Výchozí chování stylu je: **Obsah vycentrovaný, popisek vycentrovaný.**

### Kompletní zarovnání (Obsah i Popisek)

Tyto volby zarovnají samotný objekt (obrázek/tabulku) **doleva** a zároveň zarovnají jeho popisek **doleva**.

- **figuresleft** – Zarovná obrázky a jejich popisky doleva.
- **tablesleft** – Zarovná tabulky a jejich popisky doleva.
- **listingsleft** – Zarovná popisky výpisů kódu doleva (samotný kód je vlevo vždy).
- **everythingleft** – **Globální přepínač** pro levé zarovnání.
    - Aktivuje zarovnání doleva pro obrázky, tabulky, rovnice i výpisy kódu.
    - Zároveň zarovná doleva všechny popisky.

### Zarovnání pouze popisků

Tyto volby nechají obsah vycentrovaný (pokud není aktivní volba výše), ale text popisku ("Obrázek 1: ...") zarovnají doleva.

- **captionsleft** – Hromadná volba pro všechny typy (obrázky, tabulky, kód).
- **figcapsleft** – Pouze popisky obrázků doleva.
- **tabcapsleft** – Pouze popisky tabulek doleva.
- **lstcapsleft** – Pouze popisky kódu doleva.

## 5. Písma (Fonts)

- **fonts** – Aktivuje načítání oficiálních fontů TUL (může a nemusí vyžadovat 
nainstalované fonty ve vašem systému).
- **sfbody** – Nastaví bezpatkové písmo pro hlavní text (tělo dokumentu).
- **sfheadings** – Nastaví bezpatkové písmo pro nadpisy (pokud není zvolena možnost *fonts*, použije se standardní Sans Serif).

## 6. Rozvržení a Formátování

- **margins** – Aplikuje definované okraje stránky dle normy TUL (doporučeno).
- **noheader** – Úplně vypne záhlaví stránky (zůstane jen číslo stránky v zápatí, pokud je nastaveno).
- **numbering** – Zapne číslování sekcí a nadpisů (1., 1.1, ...).
- Bez této volby jsou nadpisy nečíslované (vhodné pro jednoduché články).

## 7. Vzhled a číslování popisků

- **singlecapnumbers** – Průběžné číslování v celém dokumentu (Obrázek 1, Obrázek 2...) namísto číslování po kapitolách (Obrázek 1.1, 1.2...).
- **nocapnumbers** – Skryje označení typu a čísla (např. zmizí "Obrázek 1:"), zůstane pouze samotný text popisku.
- **italiccaptions** – Nastaví text popisků **kurzívou**.


---

# TUL Package Options (EN)

This document describes all available options that can be used when loading the **tulthesis** and **tularticle** classes.

**Example usage:**
```latex
\documentclass[FM, EN, twoside, margins, numbering]{tulpackage/tulthesis}
```

## 1. Faculty / Institute Selection

Select exactly one of the following options to set the appropriate colors, logos, and contact details.

- **FS** – Faculty of Mechanical Engineering
- **FT** – Faculty of Textile Engineering
- **FP** – Faculty of Science, Humanities and Education
- **EF** (or **FE**) – Faculty of Economics
- **FUA** (or **FA**) – Faculty of Art and Architecture
- **FM** – Faculty of Mechatronics, Informatics and Interdisciplinary Studies
- **FZS** – Faculty of Health Studies
- **CXI** – Institute for Nanomaterials, Advanced Technologies and Innovation

## 2. Language

- **EN** – Switches the document to English.
- Logos change (English variants).
- Automatic texts change (Figure, Table, Listing).
- The default state (without this option) is Czech.

## 3. Document Modes and Printing

These options affect the overall appearance and behavior during compilation.

- **twoside** – Enables **double-sided printing**.
- Sets alternating inner/outer margins.
- Places page numbers alternately on the outer edge.

- **draft** – **Draft** mode.
- Shows black rectangles where text overflows the line (overfull hbox).
- Speeds up compilation (often skips loading full graphics).

- **print** – Mode for **color printing**.
- Keeps colored logos and images.
- **Forces black links** in text and content (so blue hyperlinks do not appear in print).

- **bw** – Full **black and white mode**.
- Converts everything to grayscale (including logos, headings, and links).

- **bwtitles** – Only **black headings**.
- Logos remain colored, but chapter and section headings will be black (instead of the faculty color).

## 4. Alignment (Figures and Tables)

The default style behavior is: **Content centered, caption centered.**

### Complete Alignment (Content and Caption)

These options align the object itself (figure/table) **to the left** and simultaneously align its caption **to the left**.

- **figuresleft** – Aligns figures and their captions to the left.
- **tablesleft** – Aligns tables and their captions to the left.
- **listingsleft** – Aligns code listing captions to the left (the code itself is always left-aligned).
- **everythingleft** – **Global switch** for left alignment.
    - Activates left alignment for figures, tables, equations, and code listings.
    - Simultaneously aligns all captions to the left.

### Alignment of Captions Only

These options leave the content centered (unless an option above is active), but align the caption text ("Figure 1: ...") to the left.

- **captionsleft** – Bulk option for all types (figures, tables, code).
- **figcapsleft** – Only figure captions to the left.
- **tabcapsleft** – Only table captions to the left.
- **lstcapsleft** – Only code captions to the left.

## 5. Fonts

- **fonts** – Activates loading of official TUL fonts (may or may not require fonts installed on your system).
- **sfbody** – Sets sans-serif font for the main text (document body).
- **sfheadings** – Sets sans-serif font for headings (if the *fonts* option is not selected, standard Sans Serif is used).

## 6. Layout and Formatting

- **margins** – Applies defined page margins according to the TUL standard (recommended).
- **noheader** – Completely disables the page header (only the page number remains in the footer, if set).
- **numbering** – Enables numbering of sections and headings (1., 1.1, ...).
- Without this option, headings are unnumbered (suitable for simple articles).

## 7. Caption Appearance and Numbering

- **singlecapnumbers** – Continuous numbering throughout the document (Figure 1, Figure 2...) instead of numbering by chapters (Figure 1.1, 1.2...).
- **nocapnumbers** – Hides the label and number (e.g., "Figure 1:" disappears), only the caption text remains.
- **italiccaptions** – Sets caption text to **italics**.
