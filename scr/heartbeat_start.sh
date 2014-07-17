LOG_DATE=`date +%Y%m%d`
SHORT_DATE=`date +"%T"`

mv "/var/log/cluster/ha-info.log" "/var/log/cluster/bak/ha-info.${LOG_DATE}_${SHORT_DATE//:/}.log"
mv "/var/log/cluster/ha-warn.log" "/var/log/cluster/bak/ha-warn.${LOG_DATE}_${SHORT_DATE//:/}.log"
mv "/var/log/cluster/ha-err.log" "/var/log/cluster/bak/ha-err.${LOG_DATE}_${SHORT_DATE//:/}.log"
mv "/var/log/cluster/ha-debug.log" "/var/log/cluster/bak/ha-debug.${LOG_DATE}_${SHORT_DATE//:/}.log"

service syslog restart
service logd restart
service heartbeat start

./heartbeat_had_log.sh
