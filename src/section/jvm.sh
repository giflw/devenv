#-- Install jvm tools using SDK Man

#####################################################
# VARIABLES
#####################################################

SDK_PACKAGES_FILE=$DEV_ENV_HOME


#####################################################
# FUNCTIONS
#####################################################

function installSDKMan {
    curl -s "https://get.sdkman.io" | bash
}

##
# $package* Package name to install
# $version  Version of the package to install. If not supplied, sdk man will choose the latest
##
function sdkInstall {
    local package=$1
    local version=$2
    info "Installing $package $version"
    sdk install $package $version
}

#####################################################
# MAIN
#####################################################

# configure SDK Man
import path sdkman

info "Installing SDK Man! if needed"
(version=`echo $(sdk version)` && info "SDK Man $version is installed") || installSDKMan

forEachItemInCollection sdkman sdkInstall

