# tulpackage-for-latex

This LaTeX package is prepared for immediate use on the Overleaf platform. It includes styles and classes necessary for writing theses and other academic works in accordance with the guidelines of the Technical University of Liberec (TUL). This package represents a modified version of the original `tulthesis 2.1` package, with the aim of providing increased accessibility and ease of use, potentially at the cost of a larger number of imported packages and following structural changes in the repository.

**Important Note:** Although writing in English is possible with this package, all comments and documentation are currently provided only in Czech.

## ✨ Package Contents

The package provides all the necessary tools for creating documents that comply with the style of the Technical University of Liberec:

📌 **`tul.sty`:** This is the cornerstone of the entire package. It defines the main styles and formatting rules for all TUL documents.

📄 **`tulthesis`:** A specialized class intended for diploma theses and similar extensive works. It is based on `tul.sty` and features several enhancements for improved visual appearance.

📰 **`tularticle`:** A class designed for writing articles in the TUL style. Its use simplifies the preamble setup, allowing users to start writing directly without the need for complex configurations.

## 🛠️ Installation and Usage

### ☁️ Overleaf

For the utilization of this `tulpackage-for-latex` on the Overleaf platform, the following procedure is recommended:

1.  **Repository Download:** On the repository page on GitHub, it is necessary to click the "Code" button and subsequently select the "Download ZIP" option.
2.  **File Upload to Overleaf:** Within the user's project on Overleaf, it is necessary to click the "Add Files" button and then "Upload". Subsequently, the downloaded ZIP file is selected, which Overleaf will automatically unpack.

### 💻 Local LaTeX Distribution (TeXworks, TeXstudio, etc.)

The package should also be usable on local devices (in TeXworks or TeXstudio) – a check of the installation of all necessary LaTeX packages on which `tulpackage-for-latex` depends should suffice.

#### 📄 `tulthesis` Class

**Required Packages:**

| Package      | Description                                   |
|--------------|-----------------------------------------------|
| `ifthen`     | Conditional commands                          |
| `tabularray` | Modern table creation                         |
| `pdfpages`   | Inclusion of PDF files                        |
| `hyperref`   | Creation of hyperlinks in PDF documents       |
| `polyglossia`| Support for various languages                 |
| `fontspec`   | Working with OpenType fonts                   |
| `xunicode`   | Improved handling of Unicode characters       |
| `xltxtra`    | Additional functions for XeLaTeX              |
| `tabularx`   | Tables with variable column widths             |
| `makeidx`    | For creating indexes                          |
| `tocloft`    | For adjusting the table of contents, list of figures, and list of tables |
| `float`      | For better control over figures, tables, etc. |
| `graphicx`   | Inclusion of images                           |
| `xcolor`     | Definition and use of colors                  |
| `fancyhdr`   | Custom headers and footers                    |
| `silence`    | Suppressing warnings                          |
| `etoolbox`   | Modification of existing commands             |

**Available Configuration Options:**

| Option    | Description                                                                                              |
|-----------|----------------------------------------------------------------------------------------------------------|
| `article` | Switches the base class to article (default is report)                                                      |
| `EN`      | Switches the document to the English language                                                              |
| `BP`, `DP`, `Dis`, `Hab`, `Teze`, `Autoref`, `Proj`, `SP` | Sets the type of work (Bachelor's thesis, Diploma thesis, Dissertation thesis, Habilitation thesis, Thesis, Author's abstract, Project, Seminar paper) |
| `FS`, `FT`, `FP`, `EF`, `FA`, `FM`, `FZS`, `UZS`, `CXI` | Sets the document style according to the faculty                                                          |
| `bwtitles`| Disables colored headings                                                                                  |
| `bw`      | Disables all colored elements, activates black and white mode                                            |
| `fonts`   | Locally stored TUL fonts will be used                                                                    |
| `sfbody`  | A sans-serif font will be used in the document body                                                          |
| `sfheadings`| A sans-serif font will be used in headings                                                                  |
| `nopdf`   | PDF metadata will be deactivated, and the `hyperref` package will not be loaded conditionally              |

**Functionalities of the `tulthesis.cls` Class:**

* `\TUL@baseclass`: Macro storing the name of the base class
* `\TUL@levelCZ`, `\TUL@levelEN`: Text indicating the type of work in Czech and English
* `\TUL@kat`: Abbreviation of the work category (e.g., BP)
* `\TULpraceou`, `\TULpracee`: Declension of the work title
* `\TULpracerod`: Switch for determining the gender of the work title
* `\TULthesisType`: Command for setting the type of work
* `\TUL@nazevCZ`, `\TUL@nazevEN`: Macros for the work title in Czech and English
* `\TULtitle`: Command for setting the work title
* `\TUL@autor`: Macro for the author's name
* `\TULauthor`: Command for setting the author's name
* `\TUL@vedouci`: Macro for the supervisor's name
* `\TULsupervisor`: Command for setting the supervisor's name
* `\TULconsultant`: Command for adding a consultant
* `\TUL@programCZ`, `\TUL@programEN`: Macros for the study program
* `\TULprogramme`: Command for setting the study program
* `\TULbranch`: Command for setting the field of study
* `\TUL@rok`: Macro for the year of submission
* `\TULyear`: Command for setting the year of submission
* `\TULid`: Command for setting the identification number of the work
* `\@ddel`: Auxiliary command
* `\begin{uzky@text} ... \end{uzky@text}`: Environment for inserting narrow text
* `\ThesisTitle`: Command for creating the title page
* `\Assignment`: Command for inserting the assignment page
* `\TULfem`: Command for indicating the feminine gender in Czech
* `\TULpraceCZ`: Work title in lowercase (Czech)
* `\DeclarationCZ`: Author's declaration in Czech
* `\ThesisType@EN`: Type of work in lowercase (English)
* `\DeclarationEN`: Author's declaration in English
* `\Declaration`: Command for inserting the declaration (automatically depending on the language)
* `\ThesisStart`: Command to begin the main body of the thesis
* `\begin{abstractCZ} ...`: Environment for inserting the abstract in Czech
* `\begin{abstractEN} ...`: Environment for inserting the abstract in English
* `\begin{keywordsCZ} ...`: Environment for inserting keywords in Czech
* `\begin{keywordsEN} ...`: Environment for inserting keywords in English
* `\begin{acknowledgement} ...`: Environment for inserting acknowledgements
* `\begin{abbrList} ...`: Environment for inserting the list of abbreviations
* `\TULthesisTOC`: Predefined table of contents

#### 📰 `tularticle` Class

**Required Packages:**

| Package      | Description                                   |
|--------------|-----------------------------------------------|
| `ifthen`     | Conditional commands                          |
| `tabularray` | Modern table creation                         |
| `pdfpages`   | Inclusion of PDF files                        |
| `hyperref`   | Creation of hyperlinks in PDF documents       |
| `polyglossia`| Support for various languages                 |
| `fontspec`   | Working with OpenType fonts                   |
| `xunicode`   | Improved handling of Unicode characters       |
| `xltxtra`    | Additional functions for XeLaTeX              |
| `tabularx`   | Tables with variable column widths             |
| `makeidx`    | For creating indexes                          |
| `tocloft`    | For adjusting the table of contents, list of figures, and list of tables |
| `float`      | For better control over figures, tables, etc. |
| `graphicx`   | Inclusion of images                           |
| `xcolor`     | Definition and use of colors                  |
| `fancyhdr`   | Custom headers and footers                    |
| `silence`    | Suppressing warnings                          |
| `etoolbox`   | Modification of existing commands             |

**Available Configuration Options:**

| Option       | Description                                                              |
|--------------|--------------------------------------------------------------------------|
| `EN`         | Switches the document to the English language                                  |
| `FS`, `FT`, `FP`, `EF`, `FA`, `FM`, `FZS`, `UZS`, `CXI` | Sets the document style according to the faculty                              |
| `bwtitles`   | Disables colored headings                                                      |
| `bw`         | Disables all colored elements, activates black and white mode                  |
| `fonts`      | Locally stored TUL fonts will be used                                        |
| `sfbody`     | A sans-serif font will be used in the document body                            |
| `sfheadings` | A sans-serif font will be used in headings                                     |
| `numbering`  | Headings will be numbered                                                    |
| `nonumbering`| Heading numbering will be disabled (as a double precaution)                  |
| `margins`    | Text will be indented from the left/right, even for single-sided printing |

**Additional Functionalities of the `tularticle.cls` Class:**

* `nopdf`: Deactivates PDF metadata and conditionally does not load the `hyperref` package
* `\TULarticleTOC`: Predefined table of contents
* `\noTULheader`: Disables the default TUL header

### 📝 Getting Started

Several example documents illustrating the functionality of the package are included:

* `manual-tul.tex`: Shows how to use the basic `tul.sty` style with a standard document class.
* `manual-tulthesis.tex`: Provides an example of setting up the preamble and using the `tulthesis` class for diploma theses and similar works.
* `example-tularticle.tex`: This file demonstrates the use of the `tularticle` class for writing articles.

These files allow for examination of preamble setup and the structuring of LaTeX documents. Additionally, manuals in PDF format (`manual-tul.pdf`, `manual-tulthesis.pdf`, `example-tularticle.pdf`) are available, providing a more detailed explanation of all available functions and options. Their review is recommended.

## 🎨 Customization Options

The `tulpackage-for-latex` package offers several ways to customize the appearance of documents.

⚙️ **Document Class Options:** As mentioned in the "Installation and Usage" section, both the `tulthesis` and `tularticle` classes have a number of options that can be set when declaring the document class in the LaTeX file. These options allow for:

* 🎨 Changing the document style according to the specific faculty (e.g., `FM`, `EF`, `FS`).
* ⚫ Enabling or disabling colored headings (`bwtitles`) or switching to a completely black and white mode (`bw`).
* <0xF0><0x9F><0x96><0x84> Setting which fonts will be used (`fonts`, `sfbody`, `sfheadings`).
* And much more. Exploration of all available options is recommended.

✍️ **Preamble Modifications:** If these options are insufficient, the document can be further customized by adding standard LaTeX commands and packages to the preamble of the `.tex` file. The example files (`manual-tul.tex`, `manual-tulthesis.tex`, `example-tularticle.tex`) illustrate how the preamble is set up. If commands are used/defined directly in the preambles, it signifies that their configuration is left to the user.

## 📜 License

`tulpackage-for-latex` is distributed under the Creative Commons Attribution (CC BY) license. Details are provided in the license information contained within the files.

## 🙏 Acknowledgements

The authorship of the foundation of this package (`tulthesis 2.1`) and therefore all credit for its functionality belongs to Dr. Pavel Satrapa from FM TUL. The entire `tulpackage-for-latex` is more or less just a hastily put-together attempt at a fork.

* **doc. RNDr. Pavel Satrapa, Ph.D.**
    * E-mail: Pavel.Satrapa@tul.cz
    * Phone: +420 485 351 234
    * Website: [www.root.cz/autori/pavel-satrapa/](https://www.root.cz/autori/pavel-satrapa/)
