# llm-app-monorepo

### Architecture
```
llm-app-monorepo/
└── infrastructure/
    ├── main.tf
    ├── variables.tf
    └── outputs.tf
    └── providers.tf
    └── import.tf (optional)

```

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
terraform plan
terraform apply
```
