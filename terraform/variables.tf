variable "project_name" {
  default = "roboshop"
}

variable "environment" {
  default = "dev"
}



variable "common_tags" {
  default = {
    name        = "roboshop"
    environment = "dev"
    terraform   = "true"
  }
}

variable "zone_name" {
  default = "pjdevops.online"
}

variable "tags" {
  default = {
    component = "catalogue"
    
  }
}
