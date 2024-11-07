############## VARIABLES PARA LOS CONTENEDORES ############################

variable "matomo_name" {
  type        = string
  default     = "matomo_test_default"
  description = "Nombre por defecto del contenedor del servicio"
}

variable "db_name_cont {
  type        = string
  default     = "db_matomo_test"
  description = "Es el nombre que se le asigna al contenedor de la base de datos que utilizará nextcloud"
}

############## VARIABLES PARA LA CONEXIÓN A BASE DE DATOS #######################

variable "db_user" {
  type        = string
  default     = "db_user"
  description = "Nombre de usuario para la base de datos"
}

variable "db_password" {
  type        = string
  default     = "db_password"
  description = "Contraseña para la base de datos"
}

variable "db_name" {
  type        = string
  default     = "db_name"
  description = "Nombre de la base de datos"
}

variable "db_user_root" {
  type        = string
  default     = "db_user_root"
  description = "Nombre de usuario para el root de la DB"
}

variable "db_password_root" {
  type        = string
  default     = "db_password_root"
  description = "Contraseña par el usuario root de la DB"
}













