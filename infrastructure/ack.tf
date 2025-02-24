# Activate ACK. 
data "alicloud_ack_service" "open" {
    enable = "On"
    type   = "propayasgo"
}

# The RAM roles that you want to assign. 
variable "roles" {
  type = list(object({
    name            = string
    policy_document = string
    description     = string
    policy_name     = string
  }))
  default = [
    {
      name            = "AliyunCSManagedLogRole"
      policy_document = "{\"Statement\":[{\"Action\":\"sts:AssumeRole\",\"Effect\":\"Allow\",\"Principal\":{\"Service\":[\"cs.aliyuncs.com\"]}}],\"Version\":\"1\"}"
      description     = "The logging component of ACK clusters assumes this role to access your resources in other Alibaba Cloud services."
      policy_name     = "AliyunCSManagedLogRolePolicy"
    },
    {
      name            = "AliyunCSManagedCmsRole"
      policy_document = "{\"Statement\":[{\"Action\":\"sts:AssumeRole\",\"Effect\":\"Allow\",\"Principal\":{\"Service\":[\"cs.aliyuncs.com\"]}}],\"Version\":\"1\"}"
      description     = "The CMS component of ACK clusters assumes this role to access your resources in other Alibaba Cloud services."
      policy_name     = "AliyunCSManagedCmsRolePolicy"
    },
    {
      name            = "AliyunCSManagedCsiRole"
      policy_document = "{\"Statement\":[{\"Action\":\"sts:AssumeRole\",\"Effect\":\"Allow\",\"Principal\":{\"Service\":[\"cs.aliyuncs.com\"]}}],\"Version\":\"1\"}"
      description     = "The volume plug-in of ACK clusters assumes this role to access your resources in other Alibaba Cloud services."
      policy_name     = "AliyunCSManagedCsiRolePolicy"
    },
    {
      name            = "AliyunCSManagedCsiPluginRole"
      policy_document = "{\"Statement\":[{\"Action\":\"sts:AssumeRole\",\"Effect\":\"Allow\",\"Principal\":{\"Service\":[\"cs.aliyuncs.com\"]}}],\"Version\":\"1\"}"
      description     = "The volume plug-in of ACK clusters assumes this role to access your resources in other Alibaba Cloud services."
      policy_name     = "AliyunCSManagedCsiPluginRolePolicy"
    },
    {
      name            = "AliyunCSManagedCsiProvisionerRole"
      policy_document = "{\"Statement\":[{\"Action\":\"sts:AssumeRole\",\"Effect\":\"Allow\",\"Principal\":{\"Service\":[\"cs.aliyuncs.com\"]}}],\"Version\":\"1\"}"
      description     = "The volume plug-in of ACK clusters assumes this role to access your resources in other Alibaba Cloud services."
      policy_name     = "AliyunCSManagedCsiProvisionerRolePolicy"
    },
    {
      name            = "AliyunCSManagedVKRole"
      policy_document = "{\"Statement\":[{\"Action\":\"sts:AssumeRole\",\"Effect\":\"Allow\",\"Principal\":{\"Service\":[\"cs.aliyuncs.com\"]}}],\"Version\":\"1\"}"
      description     = "The VK component of ACK Serverless clusters assumes this role to access your resources in other Alibaba Cloud services."
      policy_name     = "AliyunCSManagedVKRolePolicy"
    },
    {
      name            = "AliyunCSServerlessKubernetesRole"
      policy_document = "{\"Statement\":[{\"Action\":\"sts:AssumeRole\",\"Effect\":\"Allow\",\"Principal\":{\"Service\":[\"cs.aliyuncs.com\"]}}],\"Version\":\"1\"}"
      description     = "By default, ACK clusters assume this role to access your cloud resources."
      policy_name     = "AliyunCSServerlessKubernetesRolePolicy"
    },
    {
      name            = "AliyunCSKubernetesAuditRole"
      policy_document = "{\"Statement\":[{\"Action\":\"sts:AssumeRole\",\"Effect\":\"Allow\",\"Principal\":{\"Service\":[\"cs.aliyuncs.com\"]}}],\"Version\":\"1\"}"
      description     = "The auditing feature of ACK assumes this role to access your resources in other Alibaba Cloud services."
      policy_name     = "AliyunCSKubernetesAuditRolePolicy"
    },
    {
      name            = "AliyunCSManagedNetworkRole"
      policy_document = "{\"Statement\":[{\"Action\":\"sts:AssumeRole\",\"Effect\":\"Allow\",\"Principal\":{\"Service\":[\"cs.aliyuncs.com\"]}}],\"Version\":\"1\"}"
      description     = "The network plug-in of ACK clusters assumes this role to access your resources in other Alibaba Cloud services."
      policy_name     = "AliyunCSManagedNetworkRolePolicy"
    },
    {
      name            = "AliyunCSDefaultRole"
      policy_document = "{\"Statement\":[{\"Action\":\"sts:AssumeRole\",\"Effect\":\"Allow\",\"Principal\":{\"Service\":[\"cs.aliyuncs.com\"]}}],\"Version\":\"1\"}"
      description     = "By default, ACK assumes this role to access your resources in other Alibaba Cloud services when managing ACK clusters."
      policy_name     = "AliyunCSDefaultRolePolicy"
    },
    {
      name            = "AliyunCSManagedKubernetesRole"
      policy_document = "{\"Statement\":[{\"Action\":\"sts:AssumeRole\",\"Effect\":\"Allow\",\"Principal\":{\"Service\":[\"cs.aliyuncs.com\"]}}],\"Version\":\"1\"}"
      description     = "By default, ACK clusters assume this role to access your cloud resources."
      policy_name     = "AliyunCSManagedKubernetesRolePolicy"
    },
    {
      name            = "AliyunCSManagedArmsRole"
      policy_document = "{\"Statement\":[{\"Action\":\"sts:AssumeRole\",\"Effect\":\"Allow\",\"Principal\":{\"Service\":[\"cs.aliyuncs.com\"]}}],\"Version\":\"1\"}"
      description     = "The Application Real-Time Monitoring Service (ARMS) plug-in of ACK clusters assumes this role to access your resources in other Alibaba Cloud services."
      policy_name     = "AliyunCSManagedArmsRolePolicy"
    },
    {
      name            = "AliyunCISDefaultRole"
      policy_document = "{\"Statement\":[{\"Action\":\"sts:AssumeRole\",\"Effect\":\"Allow\",\"Principal\":{\"Service\":[\"cs.aliyuncs.com\"]}}],\"Version\":\"1\"}"
      description     = "Container Intelligence Service (CIS) assumes this role to access your resources in other Alibaba Cloud services."
      policy_name     = "AliyunCISDefaultRolePolicy"
    },
    {
      name            = "AliyunOOSLifecycleHook4CSRole"
      policy_document = "{\"Statement\":[{\"Action\":\"sts:AssumeRole\",\"Effect\":\"Allow\",\"Principal\":{\"Service\":[\"oos.aliyuncs.com\"]}}],\"Version\":\"1\"}"
      description     = "Operation Orchestration Service (OOS) assumes this role to access your resources in other Alibaba Cloud services. ACK relies on OOS to scale node pools."
      policy_name     = "AliyunOOSLifecycleHook4CSRolePolicy"
    },
    {
      name            = "AliyunCSManagedAutoScalerRole"
      policy_document = "{\"Statement\":[{\"Action\":\"sts:AssumeRole\",\"Effect\":\"Allow\",\"Principal\":{\"Service\":[\"cs.aliyuncs.com\"]}}],\"Version\":\"1\"}"
      description     = "The auto scaling component of ACK clusters assumes this role to access your node pool resources in other Alibaba Cloud services."
      policy_name     = "AliyunCSManagedAutoScalerRolePolicy"
    }
  ]
}

// Query RAM roles.
data "alicloud_ram_roles" "roles" {
    policy_type = "Custom"
    name_regex  = "^Aliyun.*Role$"
}

locals {
  # Query the RAM roles that you want to assign.
  all_role_names = [for role in var.roles : role.name]
  # Query the RAM roles that already exist.
  created_role_names  = [for role in data.alicloud_ram_roles.roles.roles : role.name]
  # Compare the two sets of RAM roles to obtain the RAM roles that you want to assign but do not exist.
  complement_names = setsubtract(local.all_role_names, local.created_role_names)
  # The RAM roles that need to be created.
  complement_roles = [for role in var.roles : role if contains(local.complement_names, role.name)]
}

// Create RAM roles. 
resource "alicloud_ram_role" "role" {
  for_each    = { for r in local.complement_roles : r.name => r }
  name        = each.value.name
  document    = each.value.policy_document
  description = each.value.description
  force       = true
}

// Attach system policies to RAM roles. 
resource "alicloud_ram_role_policy_attachment" "attach" {
  for_each    = { for r in local.complement_roles : r.name => r }
  policy_name = each.value.policy_name
  policy_type = "System"
  role_name   = each.value.name
  depends_on  = [alicloud_ram_role.role]
}