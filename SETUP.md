# Setup Steps for the Zed Editor Workflow

## How to Compile

The **tasks.json** and **keymap.json** files define it so that shift+f5 run the miktex compile.

## Installations

### **MiKTeX** (LaTeX Distribution)
- **Via Winget:**
  *winget install MiKTeX.MiKTeX*
- **Manual Installer:**
  Download the "Basic Installer" (exe) from [miktex.org/download](https://miktex.org/download).

### **SumatraPDF** (PDF Viewer)
- **Via Winget:**
  *winget install SumatraPDF.SumatraPDF*
- **Manual Installer:**
  Download the installer (64-bit install.exe) from [sumatrapdfreader.org](https://www.sumatrapdfreader.org/download-free-pdf-viewer).

### **Node.js** (Required for Spell Check & Grammar)
- **Via Winget:**
  *winget install OpenJS.NodeJS*
- **Manual Installer:**
  Download the "LTS" version (msi) from [nodejs.org](https://nodejs.org/en/download).

### **Perl** (Required for latexmk automation)

- **Via Winget:**
  *winget install StrawberryPerl.StrawberryPerl*
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
  *cmd /V:ON /C "set "p=%f" & zed "!p:\\?\=!""*
