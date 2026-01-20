# Průvodce nastavením Zed Editoru pro LaTeX (CS)

## Jak kompilovat

Soubory **tasks.json** a **keymap.json** definují, že shift+f5 spustí kompilaci MiKTeX.

## Instalace

### **MiKTeX** (LaTeX distribuce)
- **Přes Winget:**
  ```
  winget install MiKTeX.MiKTeX
  ```
- **Ruční instalace:**
  Stáhněte "Basic Installer" (exe) z [miktex.org/download](https://miktex.org/download).

### **SumatraPDF** (PDF prohlížeč)
- **Přes Winget:**
  ```
  winget install SumatraPDF.SumatraPDF
  ```
- **Ruční instalace:**
  Stáhněte instalátor (64-bit install.exe) z [sumatrapdfreader.org](https://www.sumatrapdfreader.org/download-free-pdf-viewer).

### **Node.js** (Vyžadováno pro kontrolu pravopisu a gramatiky)
- **Přes Winget:**
  ```
  winget install OpenJS.NodeJS
  ```
- **Ruční instalace:**
  Stáhněte "LTS" verzi (msi) z [nodejs.org](https://nodejs.org/en/download).

### **Cspell** (Vyžadováno pro rozšíření Cspell)
- **Přes NPM:**
  ```
  npm install -g cspell@latest
  ```
- **Instalace českého slovníku:**
  ```
  npm install -g @cspell/dict-cs-cz
  ```

### **Perl** (Vyžadováno pro automatizaci latexmk)
- **Přes Winget:**
  ```
  winget install StrawberryPerl.StrawberryPerl
  ```
- **Ruční instalace:**
  Stáhněte doporučenou verzi (msi/exe) z [strawberryperl.com](https://strawberryperl.com/).
- **Důležité:** *Po instalaci musíte úplně restartovat Zed (a všechny terminály), aby rozpoznal nový příkaz `perl`.*

## Rozšíření
Nainstalujte je přes paletu příkazů Zed (*Ctrl+Shift+P*) napsáním "extensions" a vyhledáním podle ID.

- **LaTeX** (ID: *latex*)
- **CSpell** (ID: *cspell*)
- **LOG** (ID: *log*)

## Konfigurace

Všechny konfigurační soubory jsou umístěny v adresáři **./zed-setup**.

- **cspell.json:**
  Umístěte do adresáře **./lsp** - úlohy níže jsou založeny na příkazové řádce a odkazují sem. Tento soubor je připraven pro podporu LaTeXu, změňte "words" uvnitř podle potřeby.
  - *Musíte v souboru změnit cestu k modulu **\\@cspell\\dict-cs-cz\\cspell-ext.json**.*
- **cspell-minimal.json:**
  Toto je minimální verze, kterou můžete umístit do **C:\Users\<UŽIVATEL>\AppData\Roaming\cspell\Config\cspell.json**, aby kontrolovala jednoduché věci jako markdown soubory.
  - *Musíte v souboru změnit cestu k modulu **\\@cspell\\dict-cs-cz\\cspell-ext.json**.*
- **keymap.json:**
  Vložte obsah tohoto souboru do vaší Zed keymap konfigurace pod **zed: open keymap**. Přidává příkazy **shift-f4** a **shift-f5** pro spuštění CLI kontroly pravopisu a kompilace do PDF.
- **settings.json:**
  Nastavení odsud by měla jít do vašeho Zed settings souboru pod **zed: open settings**. Konfiguruje syntaktické kontroly pro LaTeX.
- **tasks.json:**
  Vložte poslední dvě úlohy odsud do vaší Zed tasks konfigurace pod **zed: open tasks**. Přidává úlohy, které jsou volány klávesovými zkratkami z **keymap.json**.

## Zpětná navigace v Sumatře

- Otevřete nastavení kompatibility pomocí **Settings -> Options -> Set inverse search command-line**
- Nastavte příkazovou řádku na:
  ```
  cmd /V:ON /C "set "p=%f" & zed "!p:\\?\=!""
  ```

## Běžné problémy a řešení

### **Chybějící balíčky (LaTeX Error: File '....sty' not found)**
Pokud kompilace selže s chybou indikující chybějící soubor stylu (např. `! LaTeX Error: File 'booktabs.sty' not found.`), musíte balíček nainstalovat ručně přes terminál.

**Řešení:**
1. Otevřete terminál (PowerShell).
2. Spusťte instalační příkaz s názvem balíčku:
   ```powershell
   mpm --install=<název_balíčku>
   ```

### **Poškození konfigurace/databáze MiKTeXu**
Pokud kompilace okamžitě selže, nebo pokud při pokusu o instalaci balíčků vidíte chybu **"A MiKTeX configuration file could not be loaded"**, vaše lokální databáze balíčků je pravděpodobně poškozená.

**Řešení:**
1. Otevřete Průzkumníka souborů a vložte tuto cestu do adresního řádku:
   `%LOCALAPPDATA%\Programs\MiKTeX\miktex\config\`
   *(Poznámka: Pokud jste MiKTeX nainstalovali jako Správce pro všechny uživatele, zkontrolujte místo toho `C:\ProgramData\MiKTeX\miktex\config\`).*
2. Najděte a **smažte** soubor s názvem **`package-manifests.ini`**.
3. Otevřete terminál (PowerShell) a spusťte následující příkaz pro regeneraci databáze:
   ```powershell
   mpm --update-db
   ```

---

# Setup Steps for the Zed Editor Workflow (EN)

## How to Compile

The **tasks.json** and **keymap.json** files define it so that shift+f5 run the miktex compile.

## Installations

### **MiKTeX** (LaTeX Distribution)
- **Via Winget:**
  ```
  winget install MiKTeX.MiKTeX
  ```
- **Manual Installer:**
  Download the "Basic Installer" (exe) from [miktex.org/download](https://miktex.org/download).

### **SumatraPDF** (PDF Viewer)
- **Via Winget:**
  ```
  winget install SumatraPDF.SumatraPDF
  ```
- **Manual Installer:**
  Download the installer (64-bit install.exe) from [sumatrapdfreader.org](https://www.sumatrapdfreader.org/download-free-pdf-viewer).

### **Node.js** (Required for Spell Check & Grammar)
- **Via Winget:**
  ```
  winget install OpenJS.NodeJS
  ```
- **Manual Installer:**
  Download the "LTS" version (msi) from [nodejs.org](https://nodejs.org/en/download).

### **Cspell** (Required for the Cspell Extension)
- **Via NPM:**
  ```
  npm install -g cspell@latest
  ```
- **Installing the CS dictionary:**
  ```
  npm install -g @cspell/dict-cs-cz
  ```

### **Perl** (Required for latexmk automation)
- **Via Winget:**
  ```
  winget install StrawberryPerl.StrawberryPerl
  ```
- **Manual Installer:**
  Download the recommended version (msi/exe) from [strawberryperl.com](https://strawberryperl.com/).
- **Important:** *You must fully restart Zed (and any terminals) after installing this so it recognizes the new `perl` command.*

## Extensions
Install these via the Zed Command Palette (*Ctrl+Shift+P*) by typing "extensions" and searching for the IDs.

- **LaTeX** (ID: *latex*)
- **CSpell** (ID: *cspell*)
- **LOG** (ID: *log*)

## Configuration

All the config files are placed in the **./zed-setup** directory.

- **cspell.json:**
  Put this inside the directory **./lsp** - the tasks below are based on the commandline and point here. This file is built for LaTeX support, change the "words" inside it if you wish.
  - *You will need to go into the file and change the path to the **\\@cspell\\dict-cs-cz\\cspell-ext.json** module there.*
- **cspell-minimal.json:**
  This is the minimal version that can go inside **C:\Users\<USER>\AppData\Roaming\cspell\Config\cspell.json** to make it check simple stuff like markdown files.
  - *You will need to go into the file and change the path to the **\\@cspell\\dict-cs-cz\\cspell-ext.json** module there.*
- **keymap.json:**
  Put the contents of this file inside your Zed keymap config under **zed: open keymap**. It adds the **shift-f4** and **shift-f5** commands for running a CLI spellcheck and compiling to PDF.
- **settings.json:**
  The settings from here should go inside your Zed settings file under **zed: open settings**. It configures the syntax checks for LaTeX.
- **tasks.json:**
  Paste the last two tasks from here inside your Zed tasks config under **zed: open tasks**. It adds the tasks that are called with the keybinds from **keymap.json:**.

## Sumatra Backwards Navigation

- Open the compatibility settings using **Settings -> Options -> Set inverse search command-line**
- Set the command-line to:
  ```
  cmd /V:ON /C "set "p=%f" & zed "!p:\\?\=!""
  ```

## Common Issues & Troubleshooting

### **Missing Packages (LaTeX Error: File '....sty' not found)**
If your compilation fails with an error indicating a missing style file (e.g., `! LaTeX Error: File 'booktabs.sty' not found.`), you need to install the package manually via the terminal.

**The Fix:**
1. Open your terminal (PowerShell).
2. Run the installation command using the package name:
   ```powershell
   mpm --install=<package_name>
   ```

### **MiKTeX Configuration/Database Corruption**
If the compilation fails immediately, or if you see the error **"A MiKTeX configuration file could not be loaded"** when trying to install packages, your local package database is likely corrupted.

**The Fix:**
1. Open File Explorer and paste this path into the address bar:
   `%LOCALAPPDATA%\Programs\MiKTeX\miktex\config\`
   *(Note: If you installed MiKTeX as Admin for all users, check `C:\ProgramData\MiKTeX\miktex\config\` instead).*
2. Locate and **delete** the file named **`package-manifests.ini`**.
3. Open your terminal (PowerShell) and run the following command to regenerate the database:
   ```powershell
   mpm --update-db
   ```
