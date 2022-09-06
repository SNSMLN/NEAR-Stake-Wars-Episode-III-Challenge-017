
source $HOME/.bash_profile

DESCRIPTION="Near node"

# create service
tee $DAEMON > /dev/null <<EOF
#! /bin/sh

# PATH should only include /usr/* if it runs after the mountnfs.sh script
PATH=/sbin:/usr/sbin:/bin:/usr/bin
DESC="near node daemon"
NAME=nearg

RSYSLOGD=rsyslogd
DAEMON=/root/bin/neard
PIDFILE=/run/neard.pid

SCRIPTNAME=/etc/init.d/$NAME

# Exit if the package is not installed
[ -x "$DAEMON" ] || exit 0

# Read configuration variable file if it is present
[ -r /etc/default/$NAME ] && . /etc/default/$NAME

# Define LSB log_* functions.
. /lib/lsb/init-functions

do_start()
{
	# Return
	#   0 if daemon has been started
	#   1 if daemon was already running
	#   other if daemon could not be started or a failure occured
	#start-stop-daemon --start --quiet --pidfile $PIDFILE --exec 'nohup $DAEMON run >> /var/log/neard/neard.log 2>&1  & ' #-- $RSYSLOGD_OPTIONS
	#start-stop-daemon --start --pidfile $PIDFILE --exec "/usr/bin/nohup $DAEMON run >> /var/log/neard/neard.log 2>&1  & " #-- $RSYSLOGD_OPTIONS
	#$DAEMON run >> /var/log/neard/neard.log 2>&1 
	/usr/bin/nohup $DAEMON run >> /var/log/neard/neard.log 2>&1  &
}

do_stop()
{
	# Return
	#   0 if daemon has been stopped
	#   1 if daemon was already stopped
	#   other if daemon could not be stopped or a failure occurred
	#start-stop-daemon --stop --quiet --retry=TERM/30/KILL/5 --pidfile $PIDFILE --exec $DAEMON
	killall $DAEMON
}


case "$1" in
  start)
	log_daemon_msg "Starting $DESC" #"$RSYSLOGD"
	do_start
	;;

  stop)
	log_daemon_msg "Stopping $DESC" #"$RSYSLOGD"
	do_stop
	;;

  restart)
	$0 stop
	wait
	$0 start
	;;


  status)
	status_of_proc -p $PIDFILE $DAEMON $RSYSLOGD && exit 0 || exit $?
	;;
  *)

	echo "Usage: $SCRIPTNAME {start|stop|restart|status}" >&2
	exit 3
	;;
esac

:

EOF

