### RESOURCE PROVISIONING
variable "prefix" {
  default = ""
  type = string
}

variable "suffix" {
  default = ""
  type = string
}

variable "location" {
  type = string
}

variable "kubernetes_version" {
  default = null
  type = string
}

variable "default_np_sku_size" {
  type = string
}

variable "default_np_count" {
  default = 2
  type = number
}

variable "user_np_sku_size" {
  default = "Standard_DS4_v2"
  type = string
}

variable "user_np_count" {
  default = 3
  type = number
}

variable "network_plugin" {
  default = "azure"
  type = string
}

variable "network_policy" {
  default = "calico"
  type = string
}

variable "load_balancer_sku" {
  default = "standard"
  type = string
}

variable "service_cidr" {
  default = null
  type = string
}

variable "dns_service_ip" {
  default = null
  type = string
}

variable "docker_bridge_cidr" {
  default = null
  type = string
}
