variable "region" {
  description = "AWS region for VMs"
  default = "us-east-1"
}

variable "servers" {
  description = "The number of consul servers."
  default = 3
}

variable "metrics_servers" {
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
  description = "ami to use - based on region"
  default = {
    "us-east-1" = "ami-0565af6e282977273"
    "us-east-2" = "ami-0653e888ec96eab9b"
  }
}

variable "metrics-ami" {
  description = "metrics ami to use - based on region"
  default = {
    "us-east-1" = "ami-0949302e6829a54d3"
  }
}
