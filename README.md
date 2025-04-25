# Infrastructure code and CD-pipeline for IBA devops project

### Startup of EKS-cluster

1. Navigate to terraform directory: `chdir terraform`
1. Prepare S3-bucket for terraform backend (check values in `main.tf`)
2. Prepare all terraform dependancies: `terraform init`
3. Adjust `variables.tf` file
4. Run `terraform apply`

### Cluster setup

- Connect to a cluster: `aws eks update-kubeconfig --name your-cluster-name` (ruslan-eks-cluster)
- Install NGINX Ingress Controller: `kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v1.12.1/deploy/static/provider/cloud/deploy.yaml`
- Install kube-prometheus-stack:
<pre>
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo update
helm install monitoring -f .\kubernetes_deployments\prometheus_stack_values.yml prometheus-community/kube-prometheus-stack
</pre>


### ArgoCD setup

1. Create namespace: `kubectl create namespace argocd`
2. Install ArgoCD: `kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml`
3. Make port forwarding for local access to UI: `kubectl port-forward -n argocd svc/argocd-server 8080:443`
4. Get password: `kubectl get secret argocd-initial-admin-secret -n argocd -o yaml`
5. Authorize as admin with a password
6. Apply ArgoCD config: `kubectl apply -f .\argocd\application.yml`