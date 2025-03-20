# tulpackage-for-latex

An Overleaf-ready package designed to provide the necessary styles and classes for creating LaTeX papers that adhere to the style guide of the Technical University of Liberec (TUL). This package is an adjusted version of the original `tulthesis 2.1` package, aiming for improved accessibility and ease of use, though it might include some additional features.

**Important Note:** While the package supports writing papers in English, please be aware that all comments and current documentation within the package are written in Czech.

## ✨ Key Features

This package provides the essential building blocks for creating documents following the Technical University of Liberec style guide:

📌 **`tul.sty`:** The core of the package, defining the main styles and formatting rules for all TUL documents.

📄 **`tulthesis`:** A specialized document class for theses and similar report-based documents, built upon `tul.sty` with some aesthetic refinements.

📰 **`tularticle`:** An original document class designed to streamline the creation of article-style documents using the TUL style. It simplifies the preamble setup, making it easier to write articles without the usual extra configurations.

## 🛠️ Installation and Usage

### ☁️ Overleaf

To use `tulpackage-for-latex` on Overleaf, simply follow these steps:

1.  **Download the repository:** Click on the "Code" button on the GitHub repository page and select "Download ZIP".
2.  **Upload to Overleaf:** In your Overleaf project, click on the "Add Files" button in the file panel and select "Upload". Choose the downloaded ZIP file. Overleaf will automatically unzip the package.

### 💻 Local LaTeX Distributions (e.g., TeXworks, TeXstudio)

While direct usage might be possible, you may need to ensure that the necessary LaTeX packages required by `tulpackage-for-latex` are installed on your system. These dependencies are typically managed by your LaTeX distribution (like TeX Live or MiKTeX).

#### 📄 `tulthesis` Class

**Required Packages:**

| Package        | Description                      |
|-------------|----------------------------------|
| `ifthen`    | Conditional commands             |
| `tabularray`| Modern table creation            |
| `pdfpages`  | Inserting PDF files              |
| `hyperref`  | Creating hyperlinks in the PDF document |
| `polyglossia`| Support for different languages  |
| `fontspec`  | Working with OpenType fonts      |
| `xunicode`  | Better handling of Unicode characters |
| `xltxtra`   | Additional functions for XeLaTeX |
| `tabularx`  | Tables with variable column widths |
| `makeidx`   | For creating indexes             |
| `tocloft`   | For customizing the table of contents, list of figures, and tables |
| `float`     | For better control over figures, tables, etc. |
| `graphicx`  | Inserting images                 |
| `xcolor`    | Defining and using colors        |
| `fancyhdr`  | Custom headers and footers       |
| `silence`   | Suppressing warnings             |
| `etoolbox`  | Modifying existing commands      |

**Available Options:**

| Option     | Description                                                                 |
|------------|-----------------------------------------------------------------------------|
| `article`  | Switches the base class to `article` (default is `report`)                   |
| `EN`       | Switches the document to English                                            |
| `BP`, `DP`, `Dis`, `Hab`, `Teze`, `Autoref`, `Proj`, `SP` | Sets the type of work (Bachelor's thesis, Diploma thesis, Dissertation, Habilitation thesis, Thesis, Self-citation, Project, Seminar Paper) |
| `FS`, `FT`, `FP`, `EF`, `FA`, `FM`, `FZS`, `UZS`, `CXI` | Document style according to the faculty                                   |
| `bwtitles` | Disables colored headings                                                   |
| `bw`       | Disables all colored elements, monochrome mode                               |
| `fonts`    | Uses locally stored TUL fonts                                               |
| `sfbody`   | Sans-serif font in the document body                                        |
| `sfheadings`| Sans-serif font in headings                                               |
| `nopdf`    | Deactivates PDF metadata and conditionally does not load `hyperref`          |

**Custom Commands and Options:**

* `\TUL@baseclass`: Macro to store the name of the base class
* `\TUL@levelCZ`, `\TUL@levelEN`: Text for the type of work in Czech and English
* `\TUL@kat`: Abbreviation of the work category (e.g., BP)
* `\TULpraceou`, `\TULpracee`: Declension of the work title
* `\TULpracerod`: Gender switch for the work title
* `\TULthesisType`: Command to set the type of work
* `\TUL@nazevCZ`, `\TUL@nazevEN`: Macros for the work title in CZ and EN
* `\TULtitle`: Command to set the work title
* `\TUL@autor`: Macro for the author's name
* `\TULauthor`: Command to set the author's name
* `\TUL@vedouci`: Macro for the supervisor's name
* `\TULsupervisor`: Command to set the supervisor's name
* `\TULconsultant`: Command to add a consultant
* `\TUL@programCZ`, `\TUL@programEN`: Macros for the study program
* `\TULprogramme`: Command to set the study program
* `\TULbranch`: Command to set the field of study
* `\TUL@rok`: Macro for the year of the work
* `\TULyear`: Command to set the year of the work
* `\TULid`: Command to set the identification number of the work
* `\@ddel`: Helper command
* `\begin{uzky@text} ... \end{uzky@text}`: Environment for narrow text
* `\ThesisTitle`: Command to create the title page
* `\Assignment`: Command to insert the assignment page
* `\TULfem`: Command for the feminine gender in Czech
* `\TULpraceCZ`: Work title in lowercase (Czech)
* `\DeclarationCZ`: Author's declaration in Czech
* `\ThesisType@EN`: Type of work in lowercase (English)
* `\DeclarationEN`: Author's declaration in English
* `\Declaration`: Command to insert the declaration (automatic based on language)
* `\ThesisStart`: Command to start the work
* `\begin{abstractCZ} ...`: Environment for the abstract in Czech
* `\begin{abstractEN} ...`: Environment for the abstract in English
* `\begin{keywordsCZ} ...`: Environment for keywords in Czech
* `\begin{keywordsEN} ...`: Environment for keywords in English
* `\begin{acknowledgement} ...`: Environment for acknowledgements
* `\begin{abbrList} ...`: Environment for the list of abbreviations
* `\TULthesisTOC`: Predefined table of contents

#### 📰 `tularticle` Class

**Required Packages:**

| Package        | Description                      |
|-------------|----------------------------------|
| `ifthen`    | Conditional commands             |
| `tabularray`| Modern table creation            |
| `pdfpages`  | Inserting PDF files              |
| `hyperref`  | Creating hyperlinks in the PDF document |
| `polyglossia`| Support for different languages  |
| `fontspec`  | Working with OpenType fonts      |
| `xunicode`  | Better handling of Unicode characters |
| `xltxtra`   | Additional functions for XeLaTeX |
| `tabularx`  | Tables with variable column widths |
| `makeidx`   | For creating indexes             |
| `tocloft`   | For customizing the table of contents, list of figures, and tables |
| `float`     | For better control over figures, tables, etc. |
| `graphicx`  | Inserting images                 |
| `xcolor`    | Defining and using colors        |
| `fancyhdr`  | Custom headers and footers       |
| `silence`   | Suppressing warnings             |
| `etoolbox`  | Modifying existing commands      |

**Available Options:**

| Option       | Description                                                                 |
|--------------|-----------------------------------------------------------------------------|
| `EN`         | Switches the document to English                                            |
| `FS`, `FT`, `FP`, `EF`, `FA`, `FM`, `FZS`, `UZS`, `CXI` | Document style according to the faculty                                   |
| `bwtitles`   | Disables colored headings                                                   |
| `bw`         | Disables all colored elements, monochrome mode                               |
| `fonts`      | Uses locally stored TUL fonts                                               |
| `sfbody`     | Sans-serif font in the document body                                        |
| `sfheadings` | Sans-serif font in headings                                               |
| `numbering`  | Numbers headings in the document                                            |
| `nonumbering`| Disables heading numbering (passed explicitly twice)                        |
| `margins`    | Indented from the left/right, also for single-sided printing                 |

**Custom Commands and Options:**

* `nopdf`: Deactivates PDF metadata and conditionally does not load `hyperref`
* `\TULarticleTOC`: Predefined table of contents
* `\noTULheader`: Disables the default TUL header

### 📝 Basic Usage

This package includes several example documents that demonstrate how to use the different components. You can find these in the repository:

* `manual-tul.tex`: Illustrates the usage of the core `tul.sty` with a standard document class.
* `manual-tulthesis.tex`: Provides an example of how to set up the preamble and use the `tulthesis` document class for theses and similar reports.
* `example-tularticle.tex`: Shows an example of using the `tularticle` document class for article-style documents.

These example `.tex` files provide practical demonstrations of how to configure the preamble and structure your LaTeX documents. Additionally, the repository contains the compiled PDF manuals (`manual-tul.pdf`, `manual-tulthesis.pdf`, `example-tularticle.pdf`) which offer a more detailed explanation of the intended usage and available features. Be sure to check them out! 😉

## 🎨 Customization

The `tulpackage-for-latex` offers several ways to tailor the appearance of your documents.

⚙️ **Document Class Options:** As detailed in the "Installation and Usage" section, both the `tulthesis` and `tularticle` document classes provide a range of options that can be set when you declare the document class in your LaTeX file. These options allow you to:

* Change the document style to match your specific faculty (e.g., `FS`, `FT`, `FP`).
* Toggle monochrome headings (`bwtitles`) or switch to a completely monochrome mode (`bw`).
* Control font usage (`fonts`, `sfbody`, `sfheadings`).
* And much more! Be sure to explore the list of available options for each class.

✍️ **Preamble Adjustments:** For more fine-grained control, you can further customize your document by adding standard LaTeX commands and packages in the preamble of your `.tex` file. The provided example files (`manual-tul.tex`, `manual-tulthesis.tex`, `example-tularticle.tex`) demonstrate how you can set up the preamble. Any settings left in those examples are intended to be adjusted per document based on your specific requirements.

## 📜 License

This `tulpackage-for-latex` package is distributed under the Creative Commons Attribution (CC BY) license. See the included license information in the files for more details.

## 🙏 Acknowledgements

The author of this `tulpackage-for-latex` would like to acknowledge the significant contributions of:

* **doc. RNDr. Pavel Satrapa, Ph.D.**
    * Email: Pavel.Satrapa@tul.cz
    * Phone: +420 485 351 234
    * Website: [www.root.cz/autori/pavel-satrapa/](https://www.root.cz/autori/pavel-satrapa/)

The core of this package is based on the original work of Dr. Satrapa, and his invaluable contributions are gratefully acknowledged.
