variable "availability_zone" {
  type = string
}

variable "size" {
  type    = string
  default = "20"
}

variable "ebs_type" {
  type = map
  default = {
    "gp2" = "gp2",
    "st1" = "st1"
  }
}

variable "device_name" {
  type    = string
  default = "/dev/xvdb"
}

variable "instance_id" {
  type = string
}
