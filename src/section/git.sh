#-- Install git tools using distro package manager

PACKAGES=`echo $(loadCollection git)`

PACKAGE_MANAGER=`getPackageManager`
warning "Using '$PACKAGE_MANAGER' as package manager to install git tools"
info "Git tools to be installed: $PACKAGES"

CMD="sudo $PACKAGE_MANAGER install -y $PACKAGES"

warning "Executing '$CMD'"
warning "Please provide your admin password"
sudo -i echo -n ""
updatePackageManagerList
$CMD