# ==============================================================================
# UNIVERSAL LATEXMK CONFIGURATION
# Handles path switching for TUL/EF/Zotero styles across Windows & Overleaf
# ==============================================================================

# CHOOSE YOUR VARIANT
# Options: 'ef', 'tul', 'zotero'
$variant = 'ef';

%paths = (
    'ef'     => 'biblatex/iso690-2022-ef',
    'tul'    => 'biblatex/iso690-2022-tul',
    'zotero' => 'biblatex/iso690-2022-zotero'
);

$dir_name = $paths{$variant};

use Cwd;
$cwd = getcwd();
$cwd =~ s/\\/\//g;
$abs_target = "$cwd/$dir_name";

unless (-d $abs_target) {
    die "\n!!! CRITICAL LATEXMK ERROR !!!\nThe directory '$abs_target' does not exist.\n
    Check your \$variant setting in latexmkrc or your folder structure.\n";
}

if ($^O eq 'MSWin32') {
    # ==========================================================================
    # WINDOWS (MiKTeX) MODE
    # Forces Absolute Paths + -include-directory flag to override system DB
    # ==========================================================================

    $native_path = $abs_target;
    $native_path =~ s/\//\\/g;

    print "\n--------------------------------------------------\n";
    print "Latexmkrc: Windows Detected.\n";
    print "Target Link: $native_path\n";
    print "--------------------------------------------------\n";

    $search_flag = "-include-directory=\"$native_path\"";

    $xelatex = "xelatex $search_flag %O %S";
    $pdflatex = "pdflatex $search_flag %O %S";
    $lualatex = "lualatex $search_flag %O %S";

    $ENV{'TEXINPUTS'} = "$native_path//;" . ($ENV{'TEXINPUTS'} || "");
    $ENV{'BIBINPUTS'} = "$native_path//;" . ($ENV{'BIBINPUTS'} || "");
    $ENV{'BSTINPUTS'} = "$native_path//;" . ($ENV{'BSTINPUTS'} || "");

} else {
    # ==========================================================================
    # LINUX / OVERLEAF / MACOS MODE
    # Uses Relative Paths (./) to satisfy container permissions
    # ==========================================================================

    $rel_path = "./$dir_name";

    print "\n--------------------------------------------------\n";
    print "Latexmkrc: Unix/Overleaf Detected.\n";
    print "Target Link: $rel_path\n";
    print "--------------------------------------------------\n";

    $ENV{'TEXINPUTS'} = "$rel_path//:" . ($ENV{'TEXINPUTS'} || "");
    $ENV{'BIBINPUTS'} = "$rel_path//:" . ($ENV{'BIBINPUTS'} || "");
    $ENV{'BSTINPUTS'} = "$rel_path//:" . ($ENV{'BSTINPUTS'} || "");
}

$clean_ext = "bbl nav snm vrb run.xml";
