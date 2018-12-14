
function buildImportPath {
    local type=$1
    local file=$2
    file=`(test -z "$file" && echo $type) || echo $type/$file `
    echo $SCRIPT_DIR/$file.sh
}

function import {
    source `buildImportPath $1 $2`
}

function importOrFail {
    local path=`buildImportPath $1 $2`
    test -f $path && source $path
}