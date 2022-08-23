variable "image" {
  default = "Ubuntu 14.04"
}

variable "flavor" {
  default = "m1.small"
}

variable "ssh_key_file" {
  default = "~/.ssh/apaulter@arbutus.computecanada.ca"
}

variable "ssh_user_name" {
  default = "debian"
}

variable "pool" {
  default = "public"
}