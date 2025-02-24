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

/*
# Create security group for K8s cluster
resource "alicloud_security_group" "k8s_sg" {
  security_group_name = "llm-app-k8s-sg"
  description = "Security group for Kubernetes cluster"
  vpc_id      = alicloud_vpc.vpc.id
}

# Allow all outbound traffic
resource "alicloud_security_group_rule" "allow_all_outbound" {
  type              = "egress"
  ip_protocol       = "all"
  nic_type          = "intranet"
  policy            = "accept"
  port_range        = "-1/-1"
  priority          = 1
  security_group_id = alicloud_security_group.k8s_sg.id
  cidr_ip           = "0.0.0.0/0"
}

# Allow inbound traffic within the security group
resource "alicloud_security_group_rule" "allow_internal_inbound" {
  type              = "ingress"
  ip_protocol       = "all"
  nic_type          = "intranet"
  policy            = "accept"
  port_range        = "-1/-1"
  priority          = 1
  security_group_id = alicloud_security_group.k8s_sg.id
  cidr_ip           = var.llm_app_vpc_cidr
}

# Create ACK Managed Kubernetes Cluster
resource "alicloud_cs_managed_kubernetes" "k8s_cluster" {
  name                  = var.k8s_cluster_name
  version              = "1.24.6"
  vswitch_ids          = [alicloud_vswitch.vsw_az1.id]  # Using only one AZ to minimize costs
  pod_cidr             = var.k8s_pod_cidr
  service_cidr         = var.k8s_service_cidr
  
  # Disable features to minimize costs
  new_nat_gateway      = false
  slb_internet_enabled = false
  
  # Security settings
  security_group_id    = alicloud_security_group.k8s_sg.id
}

# Create a node pool for the kubernetes cluster
resource "alicloud_cs_kubernetes_node_pool" "default_node_pool" {
  cluster_id          = alicloud_cs_managed_kubernetes.k8s_cluster.id
  node_pool_name      = "default-node-pool"
  vswitch_ids         = [alicloud_vswitch.vsw_az1.id]
  instance_types      = var.k8s_worker_instance_types
  desired_size        = var.k8s_worker_number
  
  # You might want to add these optional configurations
  system_disk_category = "cloud_efficiency"
  system_disk_size     = 40
  
  # Reference the same security group as the cluster
  security_group_ids    = [alicloud_security_group.k8s_sg.id]
}
*/