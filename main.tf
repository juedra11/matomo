terraform {
    required_providers {
      docker ={
        source = "kreuzwerker/docer"
        version = "~> 3.0.1"
      }
    }
}

provider "docker"{
    host = "unix:///var/run/docker.sock"
}

#################### NETWORKS #######################

resource "docker_network" "matomo_network"{
    name="matomo_network"
}

#################### IMAGENES #######################

resource "docker_image" "matomo"{
    name = "matomo"
}

resource "docker_image" "mariadb"{
    name="mariadb:10.6"
}

#################### CONTENEDORES #######################

resource "docker_container" "mariadb_matomo"{
    name = "${var.db_name_cont}"
    image = docker_image.mariadb.name

    networks_advanced{
        name = docker_network.matomo_network.name
    }

    env = [
        "MYSQL_ROOT_PASSWORD=${var.db_password_root}",
        "MYSQL_PASSWORD=${var.db_password}",
        "MYSQL_DATABASE=${var.db_name}",
        "MYSQL_USER=${var.db_user}",
    ]

    ports{
        internal = 3306
        external = 3303
    }

    # volumes {
    #     host_path = "./matomo_db"
    #     container_path = "/var/www/html"
    # }

}

resource "docker_container" "matomo"{
    name = "${var.matomo_name}"
    image = docker_image.matomo.name

    env = [
        "MATOMO_DATABASE_HOST=${docker_container.mariadb_matomo.name}",
        "MATOMO_DATABASE_USERNAME=${var.db_user}",
        "MATOMO_DATABASE_PASSWORD=${var.db_password}",
        "MATOMO_DATABASE_DBNAME=${var.db_name}"
    ]
    
    ports{
        internal = 80
        external = 8006
    }


    depends_on = [
        docker_container.mariadb_matomo
    ]

    volumes {
        host_path = "./matomo_data"
        container_path = "/var/www/html"
    }

}













