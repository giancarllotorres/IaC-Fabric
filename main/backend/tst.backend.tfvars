tenant_id        = "$tenant_id" ##Insert your service connection here
subscription_id  = "$subscription_id" ##Insert your subscription here
resource_group_name  = "tst-$projectInput-core-rg" ##Insert your created CORE resource group here
storage_account_name = "satst$projectInputcore" ##Insert your created CORE storage account here
container_name       = "tfstate" ##Insert your created CORE cointainer here
key                  = "$projectInputtst.tfstate"
use_azuread_auth     = "true"