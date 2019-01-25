provider "docker" {
}

data "docker_registry_image" "solr" {
  name = "${local.solrRepo}:${local.solrTag}"
}

resource "docker_image" "solr" {
  name          = "${data.docker_registry_image.solr.name}"
  pull_triggers = ["${data.docker_registry_image.solr.sha256_digest}"]
}

data "docker_registry_image" "postgres" {
  name = "${local.postgresRepo}:${local.postgresTag}"
}

resource "docker_image" "postgres" {
  name          = "${data.docker_registry_image.postgres.name}"
  pull_triggers = ["${data.docker_registry_image.postgres.sha256_digest}"]
}

data "docker_registry_image" "redis" {
  name = "${local.redisRepo}:${local.redisTag}"
}

resource "docker_image" "redis" {
  name          = "${data.docker_registry_image.redis.name}"
  pull_triggers = ["${data.docker_registry_image.redis.sha256_digest}"]
}

resource "docker_container" "solr" {
  image = "${docker_image.solr.latest}"
  name  = "ckan_solr-${replace(path.root, "/", ".")}.${replace(local.installPath, "/", ".")}"
  env = [
    "SOLR_CORE=${local.solrCore}"
  ]
  volumes = [{
    host_path = "${local.solrFolder}"
    container_path = "/opt/solr/server/solr/${local.solrCore}"
  }]

  ports {
    internal = 8983
    external = "${local.solrPort}"
  }

  provisioner "local-exec"{
    command = "${local.solrInitCommand}"
  }

}

resource "docker_container" "postgres" {
  image = "${docker_image.postgres.latest}"
  name  = "ckan_postgres-${replace(path.root, "/", ".")}.${replace(local.installPath, "/", ".")}"
  env = [
    "POSTGRES_DB=${local.postgresDb}",
    "POSTGRES_USER=${local.postgresUser}",
    "POSTGRES_PASSWORD=${local.postgresPass}"
  ]

  volumes {
    host_path = "${local.dbFolder}"
    container_path = "/dbDump"
  }

  ports {
    internal = 5432
    external = "${local.postgresPort}"
  }

  provisioner "local-exec"{
    command = "${local.postgresInitCommand}"
  }
}

resource "local_file" "solrconfig"{
  filename = "${local.solrFolder}/conf/solrconfig.xml"
  content = "${local.solrConf}"
}

resource "docker_container" "redis" {
  image = "${docker_image.redis.latest}"
  name  = "ckan_redis-${replace(path.root, "/", ".")}.${replace(local.installPath, "/", ".")}"

  ports {
    internal = 6379
    external = "${local.redisPort}"
  }
}