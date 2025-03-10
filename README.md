# llm-app-monorepo

### Architecture
```
llm-app-monorepo/
└── infrastructure/  (Alibaba Cloud Infrastructure as Code)
    ├── main.tf
    ├── variables.tf
    └── outputs.tf
    └── providers.tf
    └── import.tf (optional)
└── kubernetes/  (Local k3d Resources)
    └── local/ 
    └── base/

```

### --------

### AliCloud Infrastructure Config

```bash
export ALICLOUD_ACCESS_KEY=" "
export ALICLOUD_SECRET_KEY=" "
export ALICLOUD_REGION="ap-southeast-3"  # KL, MY region
```

### To run 
Assumes you have terraform installed and necessary Alicloud roles and permissions set  

```bash
terraform init
terraform validate
terraform plan
terraform apply
```
