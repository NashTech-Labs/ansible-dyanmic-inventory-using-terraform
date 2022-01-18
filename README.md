## Ansible Dynamic Inventory Using Terraform As Upstream

Using this template, you can create your infra using Terraform and pass those servers for configuration to the Ansible downstream.

### How To Use?

1) Create your own `terraform.tfvars` in the root of this project.
2) Run:
   1) `terraform init`
   2) `terraform plan`
   3) `terraform apply`