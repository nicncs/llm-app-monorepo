# Configure the Alibaba Cloud Provider
provider "alicloud" {
  region = var.region
}

# Create VPC
resource "alicloud_vpc" "vpc" {
  vpc_name   = "llm-app-vpc"
  cidr_block = var.llm_app_vpc_cidr
}

# Create vSwitch in the first availability zone
resource "alicloud_vswitch" "vsw_az1" {
  vswitch_name = "llm-app-vsw-az1"
  vpc_id       = alicloud_vpc.vpc.id
  cidr_block   = var.llm_app_vsw_az1_cidr
  zone_id      = var.zone_1

  depends_on = [alicloud_vpc.vpc]
}

# Create vSwitch in the second availability zone
resource "alicloud_vswitch" "vsw_az2" {
  vswitch_name = "llm-app-vsw-az2"
  vpc_id       = alicloud_vpc.vpc.id
  cidr_block   = var.llm_app_vsw_az2_cidr
  zone_id      = var.zone_2
    
  depends_on = [alicloud_vpc.vpc]
}
