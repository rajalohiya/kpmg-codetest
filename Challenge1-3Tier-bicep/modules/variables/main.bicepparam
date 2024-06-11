using '../main.bicep'

param project = 'demo'
param environment = 'test'
param location = 'East US'
param appServiceSKU = 'Standard'
param appServiceSKUCode = 'S1'
param sqlServer_aadAdmin_group = 'AAD-GRP-DEMO-DEVOPS-ADMIN'
param sqlServer_aadAdmin_oid = '1a10763c-3ef2-4e29-a333-a4067cb5d684'
param adminUsername = '#{ vm_username }#'
param adminPassword = '#{ vm_password }#'
param sqlserverUsername = '#{ sql_username }#'
param sqlserverPassword = '#{ sql_password }#'
param vmSize = 'Standard_D2as_v4'
param sqlServer_dbs = [
  {
    dbName: 'demodb'
    dbSkuName: 'Standard'
    dbSkuTier: 'Standard'
  }
]
param webapps = ['app-${project}-${environment}']
param appserviceplandeploy = true
param SqlServerDeploy = true
param webAppDeploy = true
param vmdeploy = true
param vmName = 'vm-${project}-${environment}'
param addressPrefix = '10.0.0.0/16'
param subnetPrefix  = '10.0.1.0/24'
param imagePublisher  = 'MicrosoftWindowsServer'
param imageOffer  = 'WindowsServer'
param imageSku  = '2019-Datacenter'
param imageVersion  = 'latest'
