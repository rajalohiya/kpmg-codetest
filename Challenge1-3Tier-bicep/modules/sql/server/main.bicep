param sqlServerName string
param location string
param adminUserName string
@secure()
param adminPassword string
param sqlServer_aadAdmin_group string
param sqlServer_aadAdmin_oid string
param sqlServer_dbs array
param azureADOnlyAuthentication bool

resource sqlServer 'Microsoft.Sql/servers@2023-05-01-preview' = {
  name: sqlServerName
  location: location
  tags: {
    networkAccess: 'public'
  }
  properties: {
    administratorLogin: adminUserName
    administratorLoginPassword: adminPassword
    administrators: {
      administratorType: 'ActiveDirectory'
      principalType: 'Group'
      login: sqlServer_aadAdmin_group
      sid: sqlServer_aadAdmin_oid
      azureADOnlyAuthentication: azureADOnlyAuthentication
      tenantId: subscription().tenantId
    }
    minimalTlsVersion: '1.2'
  }
  identity: {
    type: 'SystemAssigned'
  }

  resource sqlDB 'databases'  = [for (db,index) in sqlServer_dbs: {
    name: db.dbName
    location: location
    sku: {
      name: db.dbSkuName
      tier: db.dbSkuTier
    }
    properties: {
      licenseType: 'BasePrice'
    }
  }]
}

