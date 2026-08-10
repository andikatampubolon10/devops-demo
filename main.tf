terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.2"
    }
  }
}

provider "docker" {}

resource "docker_image" "app" {
  name = "devops-demo:latest"

  build {
    context    = "."
    dockerfile = "Dockerfile"
  }
}

resource "docker_container" "app" {
  name  = "devops-demo"
  image = docker_image.app.image_id

  ports {
    internal = 80
    external = 8080
  }
}