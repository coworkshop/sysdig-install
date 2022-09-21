# Install sysdig Monitor, Secure and Sysdig secure for Cloud

This repo has terraform config to install Sysdig secure for Cloud, and helmfile to install sysdig Secure and Monitor

For configuration we need the accessKey and secureAPIToken  as environment variables.  
api token: https://eu1.app.sysdig.com/#/settings/user  env: SYSDIG_API_TOKEN 
secure api token:  https://eu1.app.sysdig.com/secure/#/settings/user env: SYSDIG_SECURE_API_TOKEN 


###  sysdig agent requirements:


 Port 6443 open for outbound traffic

 The agent communicates with the collector on port 6443. If you are using a firewall, you must open port 6443 for outbound traffic for the agent.


