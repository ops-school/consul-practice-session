variable "servers" {
  description = "The number of consul servers."
  default = 3
}

variable "clients" {
  description = "The number of consul client instances"
  default = 1
}

variable "consul_version" {
  description = "The version of Consul to install (server and client)."
  default     = "1.4.0"
}

variable "key_name" {
  description = "name of ssh key to attach to hosts"
}

variable "ami" {
  description = "name of ssh key to attach to hosts"
  default = "ami-0653e888ec96eab9b"
}
