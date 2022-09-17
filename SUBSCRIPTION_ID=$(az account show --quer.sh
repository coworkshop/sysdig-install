SUBSCRIPTION_ID=$(az account show --query id --output tsv)
export APP_ID=c5764991-6c9c-46fd-8f7f-79e037aab4e2
set SVCP (az ad sp  show --id $APP_ID)
set APP_ID (echo $SVCP | jq -r .appId)
set OBJ_ID (az ad sp list --filter "appId eq '$APP_ID'" --output json | jq '.[0].id' -r)
set PASS_ID (echo $SVCP | jq -r .password)
set TENANT_ID (echo $SVCP | jq -r .tenant)
az role assignment create --role "User Access Administrator" --assignee-object-id $OBJ_ID --only-show-errors


appId: d02c9c65-441c-4eff-9de6-ca4ab6ee2af6
Tenant: 