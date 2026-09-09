variable "name" {
  description = "Nom logique du serveur (web, monitoring...)"
  type        = string
}

variable "ami_id" {
  type = string
}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}

variable "admin_cidr" {
  description = "CIDR autorise en SSH"
  type        = string

  validation {
    condition     = var.admin_cidr != "0.0.0.0/0"
    error_message = "admin_cidr ne peut pas etre 0.0.0.0/0 : l'acces SSH doit rester restreint."
  }
}

variable "open_ports" {
  description = "Ports TCP ouverts a tout Internet (ex : [80])"
  type        = list(number)
  default     = []
}

variable "tags" {
  type    = map(string)
  default = {}
}
