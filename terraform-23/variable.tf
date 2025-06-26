
variable "inst_type" {
  type    = string
  default = "t2.micro"
}

variable "inst_name" {
  type    = list(string)
  default = ["web-server-1"]
}

variable "region_name" {
  type    = string
  default = ""
}
