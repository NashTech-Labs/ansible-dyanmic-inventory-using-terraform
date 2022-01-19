variable "server_list" {
  type = list(object({
    name       = string
    ip_address = string
  }))
  description = "List of servers to be configured"
}

variable "dns_suffix" {
  type        = string
  description = "Environment DNS suffix."
}

variable "ssh_privatekey" {
  type        = string
  description = "Private ssh key to connect remotely to the instance."
}

variable "username" {
  type        = string
  description = "server username"
}