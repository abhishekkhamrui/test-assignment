variable "vpc_id" {
  type = string
}

variable "description" {
  type    = string
  default = "This security group is for ssh only"
}

variable "subnets" {
  type = list
}

variable "target_ids" {
  type = string
}

variable "Name" {
  type = string
}

variable "port" {
  type    = string
  default = "80"
}

variable "protocol" {
  type    = string
  default = "HTTP"
}

variable "target_type" {
  type    = string
  default = "instance"
}

variable "health_check_intervals" {
  type    = string
  default = "5"
}

variable "health_check_path" {
  type    = string
  default = "/"
}

variable "health_check_protocol" {
  type    = string
  default = "HTTP"
}

variable "health_check_timeout" {
  type    = string
  default = "3"
}

variable "healthy_threshold" {
  type    = string
  default = "2"
}

variable "unhealthy_threshold" {
  type    = string
  default = "3"
}

variable "aws_lb_internal" {
  type    = string
  default = "false"
}

variable "listner_port" {
  type    = string
  default = "80"
}

variable "listner_protocol" {
  type    = string
  default = "HTTP"
}

variable "listner_type" {
  type    = string
  default = "forward"
}

variable "attached_instance_count" {
  type = string
}
