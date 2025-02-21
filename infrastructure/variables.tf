# Alibaba Cloud Variables

# Region in Kuala Lumpur
variable "region" {
  description = "The Alibaba Cloud region to deploy resources"
  default     = "ap-southeast-3"  # Kuala Lumpur
}

# Zones in Kuala Lumpur
variable "zone_1" {
  description = "The first availability zone ID"
  default     = "ap-southeast-3a"  # Zone A in Kuala Lumpur
}

variable "zone_2" {
  description = "The second availability zone ID"
  default     = "ap-southeast-3b"  # Zone B in Kuala Lumpur
}

# Network Configuration
variable "llm_app_vpc_cidr" {
  description = "The CIDR block for the VPC"
  default     = "10.0.0.0/16"
}

variable "llm_app_vsw_az1_cidr" {
  description = "The CIDR block for the vSwitch in the first availability zone"
  default     = "10.0.1.0/24"
}

variable "llm_app_vsw_az2_cidr" {
  description = "The CIDR block for the vSwitch in the second availability zone"
  default     = "10.0.2.0/24"
}
