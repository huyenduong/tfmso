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

# Associate azjeff template to site azjeff

resource "mso_schema_site" "azjeff" {
  schema_id       = mso_schema.azjeff.id
  site_id         = data.mso_site.azjeff.id
  template_name   = "azjeff"
}


# Create vrf
resource "mso_schema_site_vrf" "vrf1"  {
  template_name = "azjeff"
  site_id       = data.mso_site.azjeff.id
  schema_id     = mso_schema.azjeff.id
  vrf_name      = "vrf1"
}


 resource "mso_schema_template_vrf" "vrf1" {
  schema_id       = mso_schema.azjeff.id
  template        = "azjeff"
  name            = "vrf1"
  display_name    = "vrf1"
}


resource "mso_schema_site_vrf_region_cidr" "vrf1" {
  schema_id = mso_schema.azjeff.id
  template_name = "azjeff"
  site_id = data.mso_site.azjeff.id
  vrf_name = "vrf1"
  region_name = "eastus"
  ip = "16.0.0.0/16"
  primary = true
}

resource "mso_schema_site_vrf_region_cidr_subnet" "sub1" {
  schema_id = mso_schema.azjeff.id
  template_name = "azjeff"
  site_id = data.mso_site.azjeff.id
  vrf_name = "vrf1"
  region_name = "eastus"
  cidr_ip = "16.0.0.0/16"
  ip = "16.0.1.0/24"
  zone = "1"
  usage = "gateway"
}