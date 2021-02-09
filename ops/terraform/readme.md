

## Readme

This repo is for spinning up a small server for this app on DigitalOcean using Terraform.

### Terraform vars

The following are needed in `./terraform.tfvars`:
```sh
do_token = "token-here"
pvt_key = "~/.ssh/your-private-key"
```

### Setup

Add the provider using `terraform init`.

Use `terraform plan` to see the plan and `terraform apply` to run.