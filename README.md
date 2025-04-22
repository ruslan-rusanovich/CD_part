# Infrastructure code and CD-pipeline for IBA devops project

### Startup of EKS-cluster

1. Navigate to terraform directory: `chdir terraform`
1. Prepare S3-bucket for terraform backend (check values in `main.tf`)
2. Prepare all terraform dependancies: `terraform init`
3. Adjust `variables.tf` file
4. Run `terraform apply`

### Cluster setup

- Connect to a cluster: `aws eks update-kubeconfig --name your-cluster-name`
- Install Ingress Controller: `kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v1.12.1/deploy/static/provider/cloud/deploy.yaml`
- Install, authorize and setup ArgoCD
- Apply ArgoCD config: `kubectl apply -f .\argocd\application.yml`