# CLAUDE.md - AI Assistant Guidelines

This document provides guidance for AI assistants working with this codebase.

## Project Overview

This is an **Infrastructure-as-Code (IaC) monorepo** for managing Kubernetes infrastructure on Alibaba Cloud. It provisions an ACK (Alibaba Cloud Container Service for Kubernetes) cluster with supporting GitOps tooling.

**Purpose**: Deploy and manage a managed Kubernetes cluster on Alibaba Cloud with ArgoCD for GitOps-based application deployment.

## Repository Structure

```
llm-app-monorepo/
├── infrastructure/              # Terraform - Alibaba Cloud ACK cluster
│   ├── main.tf                  # VPC, vSwitches, Security Groups, K8s Cluster, Node Pools
│   ├── ack.tf                   # ACK service activation and RAM role configuration
│   ├── variables.tf             # Input variables with defaults
│   ├── providers.tf             # Terraform provider configuration (alicloud v1.243.0)
│   ├── outputs.tf               # Output values (VPC IDs, cluster IDs, etc.)
│   ├── import.tf                # Optional resource import statements
│   └── .terraform.lock.hcl      # Provider version lock file
├── k8s-bootstrap/               # Kubernetes bootstrapping resources
│   └── argocd/                  # ArgoCD and Dashboard configuration
│       ├── argocd-values.yaml   # ArgoCD Helm values (NodePort 30080)
│       ├── argocd-ingress.yaml  # Ingress for argocd.local
│       ├── clusterrolebinding.yaml
│       ├── dashboard-adminuser.yaml
│       └── kubernetes-dashboard-ingress.yaml
├── README.md
├── CLAUDE.md                    # This file
└── .gitignore
```

## Tech Stack

| Component       | Technology                          | Details                     |
|-----------------|-------------------------------------|-----------------------------|
| Infrastructure  | Terraform                           | alicloud provider v1.243.0  |
| Cloud Provider  | Alibaba Cloud                       | Region: ap-southeast-3 (KL) |
| Orchestration   | Kubernetes (ACK)                    | v1.32.1-aliyun.1            |
| GitOps          | ArgoCD                              | Via Helm chart              |
| Ingress         | NGINX Ingress Controller            | For routing                 |
| Dashboard       | Kubernetes Dashboard                | Web UI                      |

## Common Commands

### Terraform (Infrastructure)

Always run from the `infrastructure/` directory:

```bash
# Initialize Terraform working directory
terraform init

# Validate configuration syntax
terraform validate

# Preview infrastructure changes
terraform plan

# Apply infrastructure changes
terraform apply

# Destroy infrastructure (use with caution)
terraform destroy
```

### Required Environment Variables

```bash
export ALICLOUD_ACCESS_KEY="your-access-key"
export ALICLOUD_SECRET_KEY="your-secret-key"
export ALICLOUD_REGION="ap-southeast-3"
```

### Kubernetes (After cluster is provisioned)

```bash
# Get kubeconfig from ACK cluster
# Apply bootstrap resources
kubectl apply -f k8s-bootstrap/argocd/
```

## Key Configuration Details

### Network Architecture

- **VPC CIDR**: 10.0.0.0/16
- **Pod CIDR**: 172.16.0.0/16
- **Service CIDR**: 172.19.0.0/20
- **Availability Zones**: ap-southeast-3a, ap-southeast-3b (multi-AZ)

### Cluster Configuration

- **Cluster Type**: ACK Managed Standard (ack.standard)
- **Default Workers**: 1 node (configurable via variables)
- **Instance Type**: ecs.t6-c1m2.large (2 vCPU, 4 GiB RAM - Burstable)
- **System Disk**: 40GB cloud_efficiency
- **Proxy Mode**: IPVS

### Security

- 15 RAM roles configured for ACK operations
- Security group allows VPC internal traffic only
- All outbound traffic permitted

## Code Conventions

### Terraform

- **Resource naming**: Use snake_case (e.g., `llm_app_vpc`, `llm_app_vsw_az1`)
- **Variable organization**: Group related variables together in `variables.tf`
- **Outputs**: Expose useful resource attributes in `outputs.tf`
- **State management**: Do NOT commit `.tfstate` files (handled by `.gitignore`)

### Kubernetes Manifests

- **Resource naming**: Use kebab-case (e.g., `argocd-server-ingress`)
- **Namespace isolation**: Separate namespaces for different services (`argocd`, `kubernetes-dashboard`)
- **Service accounts**: Create dedicated service accounts with appropriate RBAC

### Git Workflow

- **Commit messages**: Short, descriptive messages
- **Branch naming**: Feature branches use `claude/` prefix
- **No CI/CD pipeline**: Manual terraform workflow

## Important Files to Know

| File | Purpose | When to Modify |
|------|---------|----------------|
| `infrastructure/main.tf` | Core infrastructure resources | Adding/modifying VPC, cluster, nodes |
| `infrastructure/ack.tf` | ACK-specific configuration | RAM roles, ACK service activation |
| `infrastructure/variables.tf` | Configurable parameters | Adding new configurable options |
| `k8s-bootstrap/argocd/argocd-values.yaml` | ArgoCD configuration | Modifying ArgoCD settings |

## Development Notes

### Current State

- **Stage**: Early development/proof-of-concept
- **ArgoCD**: Running in insecure mode (development only)
- **Single worker node**: Default configuration (scale up for production)

### Before Making Changes

1. **Always run `terraform plan`** before `terraform apply`
2. **Check variable defaults** in `variables.tf` before adding new resources
3. **Verify provider version compatibility** if adding new resource types
4. **Consider multi-AZ implications** when adding networking resources

### Common Issues

1. **Authentication errors**: Ensure ALICLOUD_* environment variables are set
2. **Resource limits**: Check Alibaba Cloud quotas for your account
3. **State lock issues**: Only one person should run terraform at a time

## Files to Never Commit

These are already in `.gitignore`:

- `**/.terraform/*` - Terraform working directory
- `*.tfstate*` - Terraform state files
- `.env` - Environment variables
- `crash.log` - Crash logs

## Quick Reference

```bash
# Navigate to infrastructure
cd infrastructure/

# Full terraform workflow
terraform init && terraform validate && terraform plan && terraform apply

# Check cluster outputs
terraform output

# View specific output
terraform output cluster_id
```
