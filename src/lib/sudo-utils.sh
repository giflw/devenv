
function updatePackageManagerList {
    local package_manager=`getPackageManager`
    if [ "$package_manager" == "apt-get" ]; then
        sudo $package_manager update
    fi
}

#-- This utility tries to identify the package manager
#--     Use PACKAGE_MANAGER environment variable to override if not detected correctly
#--     Tries to use apt-get (if /etc/debian_version exists) or yum otherwise

function getPackageManager {
    (
        test $PACKAGE_MANAGER && \
        echo $PACKAGE_MANAGER
    ) || (
        test -f "/etc/debian_version" && \
        echo apt-get
    ) || (
        echo yum
    )
}