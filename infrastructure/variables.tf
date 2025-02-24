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


# ACK Configuration
variable "k8s_cluster_name" {
  description = "The name of the Kubernetes cluster"
  default     = "llm-app-k8s"
}

variable "k8s_master_instance_types" {
  description = "The instance types of master nodes"
  type        = list(string)
  default     = ["ecs.t6-c1m2.large", "ecs.t6-c1m2.large", "ecs.t6-c1m2.large"]  # 2 vCPU, 4 GiB RAM - Burstable instance type
}

variable "k8s_worker_instance_types" {
  description = "The instance types of worker nodes"
  type        = list(string)
  default     = ["ecs.t6-c1m2.large"]  # 2 vCPU, 4 GiB RAM - Burstable instance type
}

variable "k8s_worker_number" {
  description = "The number of worker nodes in the Kubernetes cluster"
  type        = number
  default     = 1  # Minimum number of nodes
}

variable "k8s_pod_cidr" {
  description = "The CIDR block for pods"
  default     = "172.16.0.0/16"
}

variable "k8s_service_cidr" {
  description = "The CIDR block for services"
  default     = "172.19.0.0/20"
}
