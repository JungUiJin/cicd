# Kubernetes Provider 설정
provider "kubernetes" {
  config_path = "~/.kube/config"  # 로컬 kubeconfig 파일 경로
}