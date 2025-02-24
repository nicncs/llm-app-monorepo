terraform {
  required_providers {
    alicloud = {
      source  = "aliyun/alicloud"
      version = "1.243.0"
    }
  }
}

# Configure the Alibaba Cloud Provider
provider "alicloud" {
  region = var.region
}