
tail -f /var/log/neard/neard.log \
| grep -v  \
-e "missing chunks for " \
-e "Failed to send telemetry data " \
-e "Processed in progress for " \
-e "Orphan in progress for " \
#-e "failed sending a broadcast message to a peer" \
#-e "Connection reset by peer" \
#| ccze -A

#-e  "  orphan for " \
#-P 'in progress for| orphan for |failed sending a broadcast message to a peer'
#| ccze -A 
