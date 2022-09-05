kubectl create ns sysdig-agent
helm repo add sysdig https://charts.sysdig.com
helm repo update
helm install sysdig-agent --namespace sysdig-agent \
    --set global.sysdig.accessKey=$SYSDIG_API_TOKEN \
    --set agent.sysdig.settings.collector=ingest-eu1.app.sysdig.com \
    --set agent.sysdig.settings.collector_port=6443 \
    --set global.clusterConfig.name=$CLUSTER_NAME \
    --set nodeAnalyzer.nodeAnalyzer.apiEndpoint=eu1.app.sysdig.com \
    --set nodeAnalyzer.secure.vulnerabilityManagement.newEngineOnly=true \
    sysdig/sysdig-deploy

helm install sysdig-admission-controller sysdig/admission-controller \
--create-namespace -n sysdig-admission-controller \
--set sysdig.secureAPIToken=$SYSDIG_SECURE_API_TOKEN \
--set clusterName=$CLUSTER_NAME \
--set sysdig.url=https://$SYSDIG_SECURE_ENDPOINT \
--set features.k8sAuditDetections=true 