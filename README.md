# Infrastructure code and CD-pipeline for IBA devops project

### Startup of EKS-cluster

1. Navigate to terraform directory: `chdir terraform`
1. Prepare S3-bucket for terraform backend (check values in `main.tf`)
2. Prepare all terraform dependancies: `terraform init`
3. Adjust `variables.tf` file
4. Run `terraform apply`

### Cluster setup

- Connect to a cluster: `aws eks update-kubeconfig --name your-cluster-name`
- Install and setup ArgoCD
