variable "ami_id" {
  default = "ami-0c3fd0f5d33134a76"
}

variable "instance_count" {
  default = 1
}

variable "subnets" {
  default = {
    "0" = "subnet-b46b55ef"
    "1" = "subnet-b46b55ef"
  }
}

variable "instance_type" {
  default = "t2.micro"
}

variable "key_pair" {
  default = "key2"
}

variable "app_name" {
  default = "sampleapp"
}