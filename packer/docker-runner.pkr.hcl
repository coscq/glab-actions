packer {
  required_plugins {
    docker = {
      version = ">= 0.0.7"
      source  = "github.com/hashicorp/docker"
    }
  }
}

source "docker" "github-runner" {
  image  = "myoung34/github-runner:latest"
  commit = true
  changes = [
    "CMD [\"./bin/Runner.Listener\" \"run\" \"--startuptype\" \"service\"]",
    "ENTRYPOINT /entrypoint.sh"
  ]
}

build {
  name = "terraform-github-runner"
  sources = [
    "source.docker.github-runner"
  ]

  provisioner "shell" {
    inline = [
      "apt update && apt install -y wget unzip",
      "cd /tmp && wget https://releases.hashicorp.com/terraform/1.5.6/terraform_1.5.6_linux_amd64.zip",
      "unzip terraform_1.5.6_linux_amd64.zip && cp terraform /usr/bin",
    ]
  }
    post-processor "docker-tag" {
      repository = "terraform-github-runner"
      tags       = ["1.0"]
      only       = ["docker.github-runner"]
    }
}