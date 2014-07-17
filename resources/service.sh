crm configure primitive Service_1 lsb:heartbeat:service_1 \
op start interval="0" timeout="20" \
op monitor timeout="5s" interval="10s" on_fail="restart"

crm configure primitive Service_2 lsb:heartbeat:service_2 \
op start interval="0" timeout="20" \
op monitor timeout="5s" interval="10s" on_fail="restart"

crm configure primitive Service_3 lsb:heartbeat:service_3 \
op start interval="0" timeout="20" \
op monitor timeout="5s" interval="10s" on_fail="restart"


crm configure colocation Service_1-Service_2-Service_3-col inf: Service_1 Service_2 Service_3
crm configure order Service_1-Service_2-Service_3-ord inf: Service_1 Service_2 Service_3