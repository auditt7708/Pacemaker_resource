#!/bin/sh

cat > /etc/logrotate.d/heartbeat-debug <<'endmsg'
/var/log/cluster/ha-debug.log {
        daily
        missingok
        rotate 30
        compress
        delaycompress
        notifempty
        sharedscripts
        postrotate
            /bin/kill -HUP `cat /var/run/syslogd.pid 2> /dev/null` 2> /dev/null || true
            /bin/kill -HUP `cat /var/run/rsyslogd.pid 2> /dev/null` 2> /dev/null || true
            touch /var/log/cluster/ha-debug.log
        endscript
}
endmsg

cat > /etc/logrotate.d/heartbeat-info <<'endmsg'
/var/log/cluster/ha-info.log {
        daily
        missingok
        rotate 30
        compress
        delaycompress
        notifempty
        sharedscripts
        postrotate
            /bin/kill -HUP `cat /var/run/syslogd.pid 2> /dev/null` 2> /dev/null || true
            /bin/kill -HUP `cat /var/run/rsyslogd.pid 2> /dev/null` 2> /dev/null || true
            touch /var/log/cluster/ha-info.log
        endscript
}
endmsg

cat > /etc/logrotate.d/heartbeat-warn <<'endmsg'
/var/log/cluster/ha-warn.log {
        daily
        missingok
        rotate 30
        compress
        delaycompress
        notifempty
        sharedscripts
        postrotate
            /bin/kill -HUP `cat /var/run/syslogd.pid 2> /dev/null` 2> /dev/null || true
            /bin/kill -HUP `cat /var/run/rsyslogd.pid 2> /dev/null` 2> /dev/null || true
            touch /var/log/cluster/ha-warn.log
        endscript
}
endmsg

cat > /etc/logrotate.d/heartbeat-err <<'endmsg'
/var/log/cluster/ha-err.log {
        daily
        missingok
        rotate 30
        compress
        delaycompress
        notifempty
        sharedscripts
        postrotate
            /bin/kill -HUP `cat /var/run/syslogd.pid 2> /dev/null` 2> /dev/null || true
            /bin/kill -HUP `cat /var/run/rsyslogd.pid 2> /dev/null` 2> /dev/null || true
            touch /var/log/cluster/ha-err.log
        endscript
}
endmsg


logrotate /etc/logrotate.d/heartbeat-info -d
logrotate /etc/logrotate.d/heartbeat-info -f

logrotate /etc/logrotate.d/heartbeat-debug -d
logrotate /etc/logrotate.d/heartbeat-debug -f

logrotate /etc/logrotate.d/heartbeat-warn -d
logrotate /etc/logrotate.d/heartbeat-warn -f

logrotate /etc/logrotate.d/heartbeat-err -d
logrotate /etc/logrotate.d/heartbeat-err -f

