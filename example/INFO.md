# Základní informace k adresáři example (CS)

Adresář `example` slouží jako místo pro ukázky aktuální implementace příkladových souborů.
Obsahuje příklad použití třídy `tularticle.cls`, manuál vizuálního stylu + balíku `tulpackage/tul` 
a manuál pro používání třídy `tulthesis.cls`. Všechny tři jak ve formátu TEX,
tak v průběžně aktualizovaných PDF.

> **DŮLEŽITÉ:** S velkou pravděpodobností nebude možné žádný z TEX souborů ve složce kompilovat.
> Jde o chybu “file not found”, způsobenou tím, že soubory nejsou umístěny v root directory, 
> ale v podložce.

> **POZNÁMKA:** Uvnitř souboru `example-tularticle.tex` se nachází zakomentovaný patch příkazu
> `\addbibresource{...}`, který předchází šílení LSP při kontrole chyb v kódu. Pokud bude potřeba
> soubor kompilovat, přesuňte ho do root directory a umažte extra tečku před adresou BIB zdroje.

---

# Basic Information about the example Directory

The `example` directory serves as a location for samples of the current implementation.
It contains an example usage of the `tularticle.cls` class, the visual style manual + `tulpackage/tul` package,
and the usage manual for the `tulthesis.cls` class. All three are provided in both TEX format
and as continuously updated PDFs.

> **IMPORTANT:** It is highly likely that none of the TEX files in this folder will compile directly.
> This is due to a “file not found” error, caused by the files being located in a subdirectory
> rather than the root directory.

> **NOTE:** Inside the `example-tularticle.tex` file, there is a commented-out patch for the
> `\addbibresource{...}` command, which prevents the LSP from falsely flagging errors during code checks.
> If you need to compile the file, move it to the root directory and remove the extra dot before the BIB source path.
