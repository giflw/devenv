
#-- Logging:
#--     To enable DEBUG use 'DEBUG=true $SCRIPT_NAME ...'
#--     To enable TRACE use 'TRACE=true $SCRIPT_NAME ...'
#--         Trace also enables debug
#--     This also works with environment variables!


function log {
	local message=$1
	local level=$2
	local datetime=`date '+%F %T'`
	echo "$datetime [$level] -- $message"
}

function error {
	log "$1" "ERRO"
}

function warning {
	log "$1" "WARN"
}

function info {
	log "$1" "INFO"
}

function debug {
	if [ "$DEBUG" -o "$TRACE" ]; then
		log "$1" "DEBG"
	fi
}

function trace {
	if [ "$TRACE" ]; then
		log "$1" "TRCE"
	fi
}
