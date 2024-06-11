@secure()
param adminPassword string
param project string
param environment string
param location string
param appServiceSKU string
param appServiceSKUCode string
param sqlServer_aadAdmin_group string
param sqlServer_aadAdmin_oid string
param adminUsername string
param vmSize string
param sqlServer_dbs array
param sqlserverUsername string
@secure()
param sqlserverPassword string
param webapps array
param appserviceplandeploy bool
param SqlServerDeploy bool
param webAppDeploy bool
param vmdeploy bool
param environmentName string = toLower('${project}-${environment}')
param appServicePlanName string = 'asp-${environmentName}-str'
param sqlServerName string = 'sql-${environmentName}-str'
param vmName string = 'vm-${project}-${environment}'
param addressPrefix string
param subnetPrefix string
param imagePublisher string
param imageOffer string
param imageSku string
param imageVersion string

module vnetModule './vnet/main.bicep' = {
  name: 'vnetDeployment'
  params: {
    location: location
    addressPrefix: addressPrefix
    subnetPrefix: subnetPrefix
  }
}

module appservice './web/serverfarm/main.bicep' = if (appserviceplandeploy){
  name: 'deploy-${appServicePlanName}'
  params: {
    appServicePlanName: appServicePlanName
    location: location
    appServiceSKU: appServiceSKU
    appServiceSKUCode: appServiceSKUCode
  }
}



module sqlServerModule './sql/server/main.bicep' = if (SqlServerDeploy) {
  name: 'deploy-${sqlServerName}'
  params: {
    sqlServerName: sqlServerName
    location: location
    sqlServer_aadAdmin_group: sqlServer_aadAdmin_group
    sqlServer_aadAdmin_oid: sqlServer_aadAdmin_oid
    sqlServer_dbs: sqlServer_dbs
    adminUserName: sqlserverUsername
    adminPassword: sqlserverPassword
    azureADOnlyAuthentication: false
  }
}

module webApp './web/site/web-app/main.bicep' = [for (webapp, i) in webapps: if (webAppDeploy) {
  name: 'deploy-${webapp}-${i}'
  params: {
    location: location
    appname: webapp
    kind: 'app'
    appSettings: [
      {
        name: 'WEBSITE_VNET_ROUTE_ALL'
        value: '1'
      }
    ]
    appServicePlanId: appservice.outputs.resourceId
    vnetRouteAllEnabled: false
    tags: {
      Purpose: 'integration'
      Team: 'Integration'
    }
  }
}]

module computeModule './compute/virtual-machine/windows/main.bicep' =if (vmdeploy) {
  name: 'computeDeployment'
  params: {
    location: location
    adminUsername: adminUsername
    adminPassword: adminPassword
    subnetId: vnetModule.outputs.subnetId
    vmName: vmName
    vmSize: vmSize
    imagePublisher: imagePublisher
    imageOffer: imageOffer
    imageSku: imageSku
    imageVersion: imageVersion
  }
}
