# Alibaba Cloud Outputs

# VPC
output "vpc_id" {
  description = "The ID of the VPC"
  value       = alicloud_vpc.vpc.id
}

# vSwitches
output "vswitch_az1_id" {
  description = "The ID of the vSwitch in the first availability zone"
  value       = alicloud_vswitch.vsw_az1.id
}

output "vswitch_az2_id" {
  description = "The ID of the vSwitch in the second availability zone"
  value       = alicloud_vswitch.vsw_az2.id
}

output "vpc_cidr" {
  description = "The CIDR block of the VPC"
  value       = alicloud_vpc.vpc.cidr_block
}

output "availability_zones" {
  description = "The availability zones used in the infrastructure"
  value = [
    alicloud_vswitch.vsw_az1.zone_id,
    alicloud_vswitch.vsw_az2.zone_id
  ]
}

