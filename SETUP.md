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

### **Cspell** (Required for the Cspell Extension)
- **Via NPM:**
  *npm install -g cspell@latest*
- **Installing the CS dictionary:**
  *npm install -g @cspell/dict-cs-cz*

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
