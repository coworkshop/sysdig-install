# Install sysdig Monitor, Secure and Sysdig secure for Cloud

This repo has terraform config to install Sysdig secure for Cloud, and helmfile to install sysdig Secure and Monitor

For configuration we need the accessKey and secureAPIToken  as environment variables.  
api token: https://eu1.app.sysdig.com/#/settings/user  env: SYSDIG_API_TOKEN 
secure api token:  https://eu1.app.sysdig.com/secure/#/settings/user env: SYSDIG_SECURE_API_TOKEN 


###  sysdig agent requirements:


 Port 6443 open for outbound traffic

 The agent communicates with the collector on port 6443. If you are using a firewall, you must open port 6443 for outbound traffic for the agent.


## helm install


helm install sysdig-agent --namespace sysdig-agent \
    --set global.sysdig.accessKey=$SYSDIG_API_TOKEN \
    --set agent.sysdig.settings.collector=ingest-eu1.app.sysdig.com \
    --set agent.sysdig.settings.collector_port=6443 \
    --set global.clusterConfig.name=$CLUSTER_NAME \
    --set nodeAnalyzer.nodeAnalyzer.apiEndpoint=eu1.app.sysdig.com \
    --set nodeAnalyzer.secure.vulnerabilityManagement.newEngineOnly=true \
    --set resources.limits.cpu=600m \
    --set resources.limits.memory=512Mi \
    --set resources.requests.cpu=600m \
    --set resources.requests.memory=512Mi \
    --set tolerations[0].key=use \
    --set tolerations[0].operator=Equal \
    --set tolerations[0].value=NO \
    --set tolerations[0].effect=NoSchedule \
    sysdig/sysdig-deploy


    helm install sysdig-admission-controller sysdig/admission-controller \
--create-namespace -n sysdig-admission-controller \
--set sysdig.secureAPIToken=$SYSDIG_SECURE_API_TOKEN \
--set clusterName=$CLUSTER_NAME \
--set sysdig.url=https://$SYSDIG_SECURE_ENDPOINT \
--set features.k8sAuditDetections=true 
--set tolerations[0].key=use \
--set tolerations[0].operator=Equal \
--set tolerations[0].value=NO \
--set tolerations[0].effect=NoSchedule \
