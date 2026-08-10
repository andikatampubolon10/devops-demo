terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.2"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.5"
    }
  }
}

provider "docker" {
  host = "unix:///var/run/docker.sock"
}

resource "docker_image" "nginx" {
  name = "devops-demo-nginx:latest"

  build {
    context    = "."
    dockerfile = "Dockerfile"
  }
}

resource "docker_container" "nginx" {
  name       = "my-nginx-${random_pet.suffix.id}"
  image      = docker_image.nginx.image_id
  must_run   = true
  start      = true
  network_mode = "bridge"

  ports {
    internal = 80
    external = 8082
  }
}

resource "random_pet" "suffix" {
  length = 2
}