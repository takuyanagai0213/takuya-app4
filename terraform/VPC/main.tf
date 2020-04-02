provider "aws" {
  region  = "ap-northeast-1"
  version = "2.12.0"
  profile = "tf-profile"
}

# VPC作成
resource "aws_vpc" "VPC_for_FishingShares" {
  cidr_block           = "10.0.0.0/16"
  instance_tenancy     = "default"
  enable_dns_support   = "true"
  enable_dns_hostnames = "true"
  tags = {
    Name = "VPC_for_FishingShares"
  }
}

# サブネット２つ作成(publicとprivate)
resource "aws_subnet" "FishingShares-subnet" {
  vpc_id            = aws_vpc.VPC_for_FishingShares.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "ap-northeast-1a"
  tags = {
    Name = "FishingShares-subnet"
  }
}
resource "aws_subnet" "FishingShares-subnet-DB" {
  vpc_id            = aws_vpc.VPC_for_FishingShares.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = "ap-northeast-1a"
  tags = {
    Name = "FishingShares-subnet-DB"
  }
}


# インターネットゲートウェイの作成
resource "aws_internet_gateway" "Gateway_for_FishigShares" {
  vpc_id = aws_vpc.VPC_for_FishingShares.id
  tags = {
    Name = "Gateway_for_FishigShares"
  }
}

# ルートテーブルの作成
resource "aws_route_table" "Table_for_FishingShares" {
  vpc_id = aws_vpc.VPC_for_FishingShares.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.Gateway_for_FishigShares.id
  }
  tags = {
    Name = "Table_for_FishingShares"
  }
}

# サブネットの関連付けでルートテーブルをパブリックサブネットに紐付け
resource "aws_route_table_association" "aws-tf-public-subnet-association" {
  subnet_id      = aws_subnet.FishingShares-subnet.id
  route_table_id = aws_route_table.Table_for_FishingShares.id
}

# EC2作成(public側)
resource "aws_instance" "fishingshares-webserver" {
  ami                     = "ami-011facbea5ec0363b"
  instance_type           = "t2.micro"
  disable_api_termination = false
  key_name = aws_key_pair.auth.key_name
  vpc_security_group_ids  = [aws_security_group.fishingshares-webserver.id]
  subnet_id               = aws_subnet.FishingShares-subnet.id

  tags = {
    Name = "fishingshares-webserver"
  }
}
variable "public_key_path" {}

resource "aws_key_pair" "auth" {
    key_name = "terraform-aws"
    public_key = file(var.public_key_path)
}

# Security Group
resource "aws_security_group" "fishingshares-webserver" {
  name        = "aws-tf-web"
  description = "aws-tf-web_sg"
  vpc_id      = aws_vpc.VPC_for_FishingShares.id
  tags = {
    Name = "fishingshares-webserver"
  }
}

# 80番ポート許可のインバウンドルール
resource "aws_security_group_rule" "inbound_http" {
  type      = "ingress"
  from_port = 80
  to_port   = 80
  protocol  = "tcp"
  cidr_blocks = [
    "0.0.0.0/0",
  ]

  # ここでweb_serverセキュリティグループに紐付け
  security_group_id = aws_security_group.fishingshares-webserver.id
}

# 22番ポート許可のインバウンドルール
resource "aws_security_group_rule" "inbound_ssh" {
  type      = "ingress"
  from_port = 22
  to_port   = 22
  protocol  = "tcp"
  cidr_blocks = [
    "0.0.0.0/0",
  ]

  # ここでweb_serverセキュリティグループに紐付け
  security_group_id = aws_security_group.fishingshares-webserver.id
}

# アウトバウンドルール
resource "aws_security_group_rule" "outbound_all" {
  type      = "egress"
  from_port = 0
  to_port   = 0
  protocol  = -1
  cidr_blocks = [
    "0.0.0.0/0",
  ]

  # ここでweb_serverセキュリティグループに紐付け
  security_group_id = aws_security_group.fishingshares-webserver.id
}

# ElasticIP
resource "aws_eip" "aws-tf-eip" {
  instance = aws_instance.fishingshares-webserver.id
  vpc      = true
}
output "example-public-ip" {
    value = aws_eip.aws-tf-eip.public_ip
}
