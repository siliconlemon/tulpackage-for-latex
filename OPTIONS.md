# Možnosti balíčku TUL (Options)

Tento dokument popisuje všechny dostupné volby (options), které lze použít 
při načítání tříd **tulthesis** a **tularticle**.

**Příklad použití:**
```latex
\documentclass[FM, EN, twoside, margins, numbering]{tulpackage/tulthesis}
```

---

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

## 7. Číslování popisků

- **singlecapnumbers** – Průběžné číslování v celém dokumentu (Obrázek 1, Obrázek 2...) namísto číslování po kapitolách (Obrázek 1.1, 1.2...).
- **nocapnumbers** – Skryje označení typu a čísla (např. zmizí "Obrázek 1:"), zůstane pouze samotný text popisku.
