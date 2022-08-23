variable "image_id" {
  default = "79ccd58e-931a-406a-af16-7d62529b0bd2" # Debian 10
}

variable "flavor_id" {
  default = "14c9819b-1f73-48b6-a136-ffe8a6ade2ee" # 120 gig RAM, 16 core, 0.5 Terrabyte drive
}

variable "ssh_key_file" {
  default = "~/.ssh/apaulter@arbutus.computecanada.ca"
}

variable "ssh_user_name" {
  default = "debian"
}

variable "pool" {
  default = "Public-Network"
}

variable "network_name" {
  sensitive = true
}

variable "key_pair" {
  sensitive = true
}