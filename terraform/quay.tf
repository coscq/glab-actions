resource "helm_release" "quay_release" {
  name       = "quay-registry"

  repository = "https://helm.twun.io"
  chart      = "docker-registry"

  set {
    name  = "ingress.enabled"
    value = "true"
  }
  set {
    name  = "ingress.hosts"
    value = "[\"docker-registry.localhost\"]"
  }
  set {
    name  = "ingress.className"
    value = "traefik"
  }
}