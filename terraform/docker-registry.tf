resource "helm_release" "docker_registry_release" {
  name       = "docker-registry"
  namespace  = "docker-registry"
  repository = "https://helm.twun.io"
  chart      = "docker-registry"

  set {
    name  = "ingress.enabled"
    value = "true"
  }
  set {
    name  = "ingress.enabled"
    value = "true"
  }
  set {
    name  = "ingress.hosts[0]"
    value = "docker-registry.localhost"
  }
  set {
    name  = "ingress.className"
    value = "traefik"
  }
}