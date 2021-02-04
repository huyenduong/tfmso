terraform {
  required_providers {
    mso = {
      source  = "ciscodevnet/mso"
      version = "0.1.5"
    }
  }
}

provider "mso" {
  username    = var.username
  password    = var.password
  url         = var.url
  insecure    = true
}

data "mso_site" "dmz01" {
  name  = "ACI-DMZ-Site-01"
}

data "mso_site" "azjeff" {
  name  = "AZ-JEFF"
}
# create tenant
resource "mso_tenant" "msotf" {
  name              =  "msotf"
  display_name      =  "msotf"
  description       =  "terraform msotf"

  site_associations {
    site_id = data.mso_site.azjeff.id
    vendor = "azure"
    azure_shared_account_id = var.az_subscription_id
    azure_access_type = "shared"
  }
}

# create schema

resource "mso_schema" "azjeff" {
  template_name = "azjeff"
  name  = "azjeff"
  tenant_id     = mso_tenant.msotf.id
}
