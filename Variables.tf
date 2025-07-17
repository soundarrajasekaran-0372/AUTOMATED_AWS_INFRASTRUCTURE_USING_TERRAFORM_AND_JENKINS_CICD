variable "Instance_AMI" {
  default = "ami-0150ccaf51ab55a51"
}

variable "Instance_Type" {
  default = "t2.micro"
}

variable "Allowed_SG_Ports" {
  type    = list(number)
  default = ["22", "80", "443"]
}