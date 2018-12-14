#-- Install node related tools
#--     To install latest lts, set on node.conf collection*:
#--         node=--lts
#--     To install latest from a specific LTS name:
#--         node=--lts=<LTS NAME>
#--         node=--lts=carbon
#--     To install a spcific version*:
#--         node=<version>
#--         node=6.15.1
#--         node=iojs-v3.3.1
#--     To install latest version*:
#--         node
#--     * 'node=' can be ommited on those cases

# configure NVM

import path nvm

function installNVM {
    local nvm_latest=`curl -X GET -L  http://api.github.com/repos/creationix/nvm/releases/latest | grep tag_name | cut -d : -f 2 | cut -d \" -f 2`
    curl -o- https://raw.githubusercontent.com/creationix/nvm/$nvm_latest/install.sh | bash
}

function nvmInstall {
    local package=$1
    local version=$2
    version=`(test "$version" && echo $version) || echo $package`
    info "Installing node $version" 
    nvm install $version
}

info "Installing NVM if needed"
(version=`nvm --version` && info "NVM $version is installed") || installNVM

forEachItemInCollection node nvmInstall

