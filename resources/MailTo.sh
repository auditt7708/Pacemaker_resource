crm configure primitive ClusterMon ocf:MailTo \
params email="user@example.com" \
params subject="AlertPacemakerRabbitMQ" \
params mail_program="nail" \
params mail_account="intervale" \
op start interval="0" timeout="30" \
op stop interval="0" timeout="30" \
op monitor interval="10" timeout="10"