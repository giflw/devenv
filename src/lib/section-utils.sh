
#-- Packages and version to install are given in collections conf files
#-- Each section has its own conf files
#-- Conf files can have package names and versions, in the following format:
#--     packageName=packageVersion
#--     packageName
#--     (one package per line, no restrictions for repeating packages)
#--     (version is not mandatory for this utility, but may be for the package manager used to install)


# loads given collection
function loadCollection {
    local collection=$1
    cat $SCRIPT_DIR/collection/$collection.conf
}

##
# for each item in section collection, execute a given command
#
##
function forEachItemInCollection {
    local collection=$1
    local command=$2
    for item in `loadCollection $collection`; do
        local name=${item%%=*}
        local version=`[[ "$item" == *"="* ]] && echo ${item#*=}`
        version=`test "$version" != "latest" && echo $version`
        $command $name $version
    done  
}
