for p in $(kubectl -n apigee get pods -l app=apigee-cassandra --no-headers -o custom-columns=":metadata.name"); do
  kubectl -n apigee exec "$p" -- bash -c "nodetool -u $APIGEE_JMX_USER -pw $APIGEE_JMX_PASSWORD info" 2>&1 | tee "/tmp/k_nodetool_info_${p}_$(date +%Y.%m.%d_%H.%M.%S).txt"
  kubectl -n apigee exec "$p" -- bash -c "nodetool -u $APIGEE_JMX_USER -pw $APIGEE_JMX_PASSWORD describecluster" 2>&1 | tee "/tmp/k_nodetool_describecluster_${p}_$(date +%Y.%m.%d_%H.%M.%S).txt"
  kubectl -n apigee exec "$p" -- bash -c "nodetool -u $APIGEE_JMX_USER -pw $APIGEE_JMX_PASSWORD failuredetector" 2>&1 | tee "/tmp/k_nodetool_failuredetector_${p}_$(date +%Y.%m.%d_%H.%M.%S).txt"
  kubectl -n apigee exec "$p" -- bash -c "nodetool -u $APIGEE_JMX_USER -pw $APIGEE_JMX_PASSWORD status" 2>&1 | tee "/tmp/k_nodetool_status_${p}_$(date +%Y.%m.%d_%H.%M.%S).txt"
  kubectl -n apigee exec "$p" -- bash -c "nodetool -u $APIGEE_JMX_USER -pw $APIGEE_JMX_PASSWORD gossipinfo" 2>&1 | tee "/tmp/k_nodetool_gossipinfo_${p}_$(date +%Y.%m.%d_%H.%M.%S).txt"
  kubectl -n apigee exec "$p" -- bash -c "nodetool -u $APIGEE_JMX_USER -pw $APIGEE_JMX_PASSWORD netstats" 2>&1 | tee "/tmp/k_nodetool_netstats_${p}_$(date +%Y.%m.%d_%H.%M.%S).txt"
  kubectl -n apigee exec "$p" -- bash -c "nodetool -u $APIGEE_JMX_USER -pw $APIGEE_JMX_PASSWORD proxyhistograms" 2>&1 | tee "/tmp/k_nodetool_proxyhistograms_${p}_$(date +%Y.%m.%d_%H.%M.%S).txt"
  kubectl -n apigee exec "$p" -- bash -c "nodetool -u $APIGEE_JMX_USER -pw $APIGEE_JMX_PASSWORD tpstats" 2>&1 | tee "/tmp/k_nodetool_tpstats_${p}_$(date +%Y.%m.%d_%H.%M.%S).txt"
  kubectl -n apigee exec "$p" -- bash -c "nodetool -u $APIGEE_JMX_USER -pw $APIGEE_JMX_PASSWORD gcstats" 2>&1 | tee "/tmp/k_nodetool_gcstats_${p}_$(date +%Y.%m.%d_%H.%M.%S).txt"
  kubectl -n apigee exec "$p" -- bash -c "nodetool -u $APIGEE_JMX_USER -pw $APIGEE_JMX_PASSWORD version" 2>&1 | tee "/tmp/k_nodetool_version_${p}_$(date +%Y.%m.%d_%H.%M.%S).txt"
  kubectl -n apigee exec "$p" -- bash -c "nodetool -u $APIGEE_JMX_USER -pw $APIGEE_JMX_PASSWORD ring" 2>&1 | tee "/tmp/k_nodetool_ring_${p}_$(date +%Y.%m.%d_%H.%M.%S).txt"
  kubectl -n apigee exec "$p" -- bash -c "nodetool -u $APIGEE_JMX_USER -pw $APIGEE_JMX_PASSWORD cfstats" 2>&1 | tee "/tmp/k_nodetool_cfstats_${p}_$(date +%Y.%m.%d_%H.%M.%S).txt"
done
