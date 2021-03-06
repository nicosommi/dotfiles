compresspdf() {
    echo 'Usage: compresspdf [input file] [output file] [screen|ebook|printer|prepress]'
    echo 'Required: brew install ghostscript'
    gs -sDEVICE=pdfwrite -dNOPAUSE -dQUIET -dBATCH -dPDFSETTINGS=/${3:-"screen"} -dEmbedAllFonts=true -dSubsetFonts=true -dCompatibilityLevel=1.3 -sOutputFile="$2" "$1"
}

makeItToLocalBinAsSL() {
 echo 'Usage makeItToLocalBinAsSL path/bin bin-alias'
 ln -s $1 /usr/local/bin/$2
}

