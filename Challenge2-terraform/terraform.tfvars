subscription_id = "f544954d-10d1-46c6-813b-0e86233153d7"
client_id       = "87f1e453-d7e4-47cd-bbf1-5add36ca3eb9"
client_secret   = "pjk8Q~WLUkdWP3gQ3Fifcs3-uyQP7NDuDInv5dwI"
tenant_id       = "c7b7792a-03e1-4237-afa6-d124c781ec1e"

resource_group_name    = "myrg"
resource_group_location = "East US"

account_tier             = "Standard"
account_replication_type = "LRS"

app_service_plan_name  = "myAppServicePlan"
app_service_plan_sku_tier = "WorkflowStandard"
app_service_plan_sku_size = "WS1"

vnet_name              = "myVNet"
vnet_address_space     = ["10.0.0.0/16"]
subnet_name            = "mySubnet"
subnet_address_prefixes = ["10.0.1.0/24"]

workspace_name         = "la-workspace"
app_insights_name      = "myAppInsights"



location                 = "East US"



storage_account_name     = "logicapptestsademo"
logic_app_name           = "logicapp-test-sfsg"
functions_worker_runtime = "node"
website_node_version     = "~16"
