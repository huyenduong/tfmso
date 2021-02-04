variable "username" {}
variable "password" {}
variable "url" {}


variable "tfschema" {
    type = string
    default = "tfschema"
}

variable "shared_temp" {
    type = string
    default = "shared_temp"
}

variable "site1_temp" {
    type = string
    default = "site1_temp"
}

variable "site2_temp" {
    type = string
    default = "site2_temp"
}

variable "vrf1" {
    type = string
    default = "vrf1"
  
}

variable "vrf1_display" {
    type = string
    default = "vrf1"
}

variable "bd1" {
    type = string
    default = "bd1"
  
}

variable "bd2" {
    type = string
    default = "bd2"
  
}

variable "bd1Subnet" {
    type = string
    default = "192.168.81.1/24"
}

variable "bd2Subnet" {
    type = string
    default = "192.168.82.1/24"
}

variable "apName" {
    type = string
    default = "ap1"
  
}

variable "epgName1" {
    type = string
    default = "epg1"
}


variable "epgName2" {
    type = string
    default = "epg2"
}

variable "vmmDomain" {
    type = string
    default = "mso"
  
}

variable "provider_profile_dn" {
   default = "uni/vmmp-VMware"
}

variable "icmpFilter" {
    type = string
    default = "icmp"
}

variable "icmpFilterEntry" {
    type = string
    default = "icmp"
}

variable "httpFilter" {
    type = string
    default = "http"
}

variable "httpFilterEntry" {
    type = string
    default = "http"
}

variable "epg1_epg2_contract" {
    type = string
    default = "epg1_epg2_contract"
}

variable "icmp_http_subject" {
    type = string
    default = "icmp_http_subject"
}

variable "tenant_dn" {
   default = "uni"
}