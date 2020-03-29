provider "aws" {
  region  = "ap-northeast-1"
  version = "2.12.0"
  profile = "tf-profile"
}

terraform {
  required_version = ">= 0.12"

  backend "s3" {
    bucket  = "tf-bucket11"
    region  = "ap-northeast-1"
    key     = "ec2/terraform.tfstate"
    encrypt = true
    profile = "tf-profile"
  }
}

data "terraform_remote_state" "security_group" {
  backend = "s3"

  config = {
    bucket  = "tf-bucket11"
    region  = "ap-northeast-1"
    key     = "security_group/terraform.tfstate"
    profile = "tf-profile"
  }
}

resource "aws_instance" "ec2" {
  count                  = var.instance_count
  ami                    = var.ami_id
  instance_type          = var.instance_type
  key_name               = var.key_pair
  subnet_id              = lookup(var.subnets, count.index % 2)
  vpc_security_group_ids = [data.terraform_remote_state.security_group.outputs.ec2_sg_id]

  tags = {
    Name = "${var.app_name}_${count.index + 1}"
  }
}

output "instance_ids" {
  value = {
    for instance in aws_instance.ec2 :
    instance.id => instance.private_ip
  }
}

output "instance_count" {
  value = var.instance_count
}
