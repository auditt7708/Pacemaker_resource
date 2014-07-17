crm configure primitive ClusterIP ocf:heartbeat:IPaddr2 \
params ip=192.168.10.200 \
op start interval="0" timeout="30" \
op stop interval="0" timeout="30" \
op monitor depth="0" timeout="20s" interval="5s"