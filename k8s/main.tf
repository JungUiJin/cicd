# main.tf

terraform {
  required_providers {
    kubernetes = {
      source = "hashicorp/kubernetes"
      version = "~> 2.0"
    }
  }
}
resource "kubernetes_manifest" "secret" {
  manifest = yamldecode(file("${path.module}/secret/api_key_secret.yaml"))
}

# Vue 애플리케이션 배포 및 서비스 설정
resource "kubernetes_manifest" "vue_deployment" {
  manifest = yamldecode(file("${path.module}/vue/debook_vue_dep001.yaml"))
}

resource "kubernetes_manifest" "vue_service" {
  manifest = yamldecode(file("${path.module}/vue/debook_vue_ser001.yaml"))
}

# Spring Boot 애플리케이션 배포 및 서비스 설정
resource "kubernetes_manifest" "springboot_deployment" {
  manifest = yamldecode(file("${path.module}/boot/debook_boot_dep001.yaml"))
}

resource "kubernetes_manifest" "springboot_service" {
  manifest = yamldecode(file("${path.module}/boot/debook_boot_ser001.yaml"))
}

# MariaDB 배포 및 서비스 설정
resource "kubernetes_manifest" "mariadb_deployment" {
  manifest = yamldecode(file("${path.module}/db/mariadb/mariadb_dep.yaml"))
}

resource "kubernetes_manifest" "mariadb_service" {
  manifest = yamldecode(file("${path.module}/db/mariadb/mariadb_ser.yaml"))
}

# Redis 배포 및 서비스 설정
resource "kubernetes_manifest" "redis_deployment" {
  manifest = yamldecode(file("${path.module}/db/redis/redis_dep.yaml"))
}

resource "kubernetes_manifest" "redis_service" {
  manifest = yamldecode(file("${path.module}/db/redis/redis_ser.yaml"))
}

# MongoDB 배포 및 서비스 설정
resource "kubernetes_manifest" "mongodb_deployment" {
  manifest = yamldecode(file("${path.module}/db/mongodb/mongodb_dep.yaml"))
}

resource "kubernetes_manifest" "mongodb_service" {
  manifest = yamldecode(file("${path.module}/db/mongodb/mongodb_ser.yaml"))
}

resource "kubernetes_manifest" "ingress" {
  manifest = yamldecode(file("${path.module}/ingress/debook_ingress001.yaml"))
}
