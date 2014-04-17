crm configure primitive MpsaMon ocf:mpsa:mpsa-monitor \
params servicempsa="'service mpsa'" \
log_base="/home/mpsa_mts/mpsa/log" \
op start interval="0" timeout="60" \
op monitor interval="30s" timeout="30s"

crm_resource --meta --resource MpsaMon --set-parameter migration-threshold -v 1
crm_resource --meta --resource MpsaMon --set-parameter failure-timeout -v 0
crm_resource --meta --resource MpsaMon --set-parameter resource-stickiness -v 100

crm configure order ClusterMon-after-MpsaMon inf: MpsaMon ClusterMon
crm configure order MpsaMon-after-ClusterIP inf: MpsaMon ClusterIP
crm configure colocation ClusterIP-MpsaMon-ClusterMon-col inf: MpsaMon ClusterIP ClusterMon