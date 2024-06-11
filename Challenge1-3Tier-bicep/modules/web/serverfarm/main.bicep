@description('The name of the app service plan.')
param appServicePlanName string
param appServiceSKUCode string
param appServiceSKU string
param location string

resource appServicePlan 'Microsoft.Web/serverfarms@2022-09-01' = {
  name: appServicePlanName
  location: location
  sku: {
    tier: appServiceSKU
    name: appServiceSKUCode
  }
}

@description('The resource ID of the deployed app service plan.')
output resourceId string = appServicePlan.id
