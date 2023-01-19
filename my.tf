# Configuring terraform kubernetes provider with minikube context and pointing to local kube config

provider "kubernetes" {
  config_context_cluster   = "minikube"
  config_path = "~/.kube/config"
}
provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
  }
}

resource "helm_release" "postgres" {
  name       = "postgresql-server"
  namespace  = "applications-namespace"
  repository = "https://charts.bitnami.com/bitnami"
  chart      = "postgresql"

 set {
    name  = "postgresqlUsername"
    value = "myuser"
  }

  set {
    name  = "postgresqlPassword"
    value = "mypassword"
  }

  set {
    name  = "postgresqlDatabase"
    value = "mydb"
  }
}

resource "helm_release" "example" {
  name       = "my-redis-release"
  namespace  = "applications-namespace"
  repository = "https://charts.bitnami.com/bitnami"
  chart      = "redis"
  version    = "5.0.5"

  set {
    name  = "cluster.enabled"
    value = "true"
  }

  set {
    name  = "metrics.enabled"
    value = "true"
  }
}


  
