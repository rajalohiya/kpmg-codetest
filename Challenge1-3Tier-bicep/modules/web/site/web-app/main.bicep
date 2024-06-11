param appServicePlanId string
param appname string
param location string
param appSettings array
param tags object
param kind string
param appVnetIntegrationSubnetId string = ''
param vnetRouteAllEnabled bool


resource webapp 'Microsoft.Web/sites@2023-01-01' = {
  name: appname
  location: location
  tags: tags
  kind: kind
  properties: {
    siteConfig: {
      appSettings: appSettings
      ftpsState: 'FtpsOnly'
      alwaysOn: true

    }
    clientAffinityEnabled: true
    publicNetworkAccess: 'Disabled'
    virtualNetworkSubnetId: !empty(appVnetIntegrationSubnetId) ? appVnetIntegrationSubnetId : null
    vnetRouteAllEnabled: vnetRouteAllEnabled
    httpsOnly: true
    serverFarmId: appServicePlanId
  }
  identity: {
    type: 'SystemAssigned'
  }
}

output webAppPrincipalId string = webapp.identity.principalId
output resourceId string = webapp.id
