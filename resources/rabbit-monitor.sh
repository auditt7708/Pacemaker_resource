crm configure primitive RabbitMon ocf:rabbitmq:rabbit-monitor \
params servicemq="'service rabbitmq-server'" \
log_base="/var/log/rabbitmq" \
op monitor interval="10s" timeout="20s" \
op start interval="0" timeout="30" \
op stop interval="0" timeout="30" \

crm_resource --meta --resource RabbitMon --set-parameter migration-threshold -v 1
crm_resource --meta --resource RabbitMon --set-parameter failure-timeout -v 0
crm_resource --meta --resource RabbitMon --set-parameter resource-stickiness -v 100

crm configure order ClusterMon-after-RabbitMon inf: RabbitMon ClusterMon
crm configure order RabbitMon-after-ClusterIP inf: RabbitMon ClusterIP
crm configure colocation ClusterIP-RabbitMon-ClusterMon-col inf: RabbitMon ClusterIP ClusterMon