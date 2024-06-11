resource "null_resource" "fetch_storage_account_metadata" {
  provisioner "local-exec" {
    command = <<EOF
      az storage account show --ids ${var.storage_account_id} --query "{id:id, name:name, type:type, location:location, tags:tags}" --output json > ${var.storage_account_output_file}
    EOF
  }
}

resource "null_resource" "fetch_app_service_plan_metadata" {
  provisioner "local-exec" {
    command = <<EOF
      az appservice plan show --ids ${var.app_service_plan_id} --query "{id:id, name:name, type:type, location:location, sku:sku}" --output json > ${var.app_service_plan_output_file}
    EOF
  }
}

resource "null_resource" "fetch_vnet_metadata" {
  provisioner "local-exec" {
    command = <<EOF
      az network vnet show --ids ${var.vnet_id} --query "{id:id, name:name, type:type, location:location, addressSpace:addressSpace}" --output json > ${var.vnet_output_file}
    EOF
  }
}

resource "null_resource" "fetch_log_analytics_metadata" {
  provisioner "local-exec" {
    command = <<EOF
      az monitor log-analytics workspace show --ids ${var.log_analytics_id} --query "{id:id, name:name, type:type, location:location, customerId:customerId}" --output json > ${var.log_analytics_output_file}
    EOF
  }
}

resource "null_resource" "fetch_app_insights_metadata" {
  provisioner "local-exec" {
    command = <<EOF
      az monitor app-insights component show --ids ${var.app_insights_id} --query "{id:id, name:name, type:type, location:location, appId:appId, instrumentationKey:instrumentationKey}" --output json > ${var.app_insights_output_file}
    EOF
  }
}

resource "null_resource" "fetch_logic_app_metadata" {
  provisioner "local-exec" {
    command = <<EOF
      az logic workflow show --ids ${var.logic_app_id} --query "{id:id, name:name, type:type, location:location, provisioningState:provisioningState}" --output json > ${var.logic_app_output_file}
    EOF
  }
}
