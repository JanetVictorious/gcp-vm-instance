variable "project_id" {
  type        = string
  description = "Name of project"
}

variable "region" {
  type        = string
  description = "Region used for infrastructure"
}

variable "zone" {
  type        = string
  description = "Zone used for infrastructure"
}

variable "vm_network_name" {
  type        = string
  description = "Name of Virtual Machine network"
}

variable "vm_name" {
  type        = string
  description = "Name of Virtual Machine"
}
