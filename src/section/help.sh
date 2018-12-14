
function cleanHelpLines {
    local file=$1
    local pad=$2
    local type=`dirname $file`
    type=`basename $type`
    local section=`basename $file`
    if [ "$type" == "section" ]; then 
        local section=`basename $file`
        echo "$pad ${section%.sh}"
    fi
    local lines=`grep '^#--' $file | sed "s/#--/    $pad/g"`
    (test -n "$lines" || test "$type" == "section") && (echo "echo \"$lines\"" | bash) && echo ""
}

cleanHelpLines $SCRIPT_DIR/$SCRIPT_NAME

for file in `ls $SCRIPT_DIR/section/* | sort`; do
    cleanHelpLines $file "    "
done

for file in `ls $SCRIPT_DIR/lib/* | sort`; do
    cleanHelpLines $file
done

#-- Show this help

