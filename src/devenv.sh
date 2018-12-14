#!/bin/bash --login

#-- 
#-- devenv.sh
#--
#-- It's a small set of scripts to set up a minimal development environment
#-- 
#-- Usage: $SCRIPT_NAME <section>
#-- Sections:
# section will be listed here when help is invoked

SCRIPT_DIR=`dirname $0 `

export SCRIPT_DIR=`cd $SCRIPT_DIR && pwd`
export SCRIPT_NAME=`basename $0`
source $SCRIPT_DIR/lib/base-utils.sh

import version
import lib logging
import lib sudo-utils
import lib section-utils

info "Running $SCRIPT_NAME $VERSION"

debug "devenv script directory: $SCRIPT_DIR"

SECTION="$1"

#####################################################
# VARIABLES
#####################################################
DEV_ENV_HOME=$HOME/.devenv

#####################################################

info "Checking/creating devenv dir: $DEV_ENV_HOME"
test -e $DEV_ENV_HOME || mkdir -p $DEV_ENV_HOME

importOrFail section $SECTION || (
    (test "$SECTION" == "help" || error "Error execution '$SECTION' or section not found!") && \
    import section help
)