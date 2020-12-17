terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 2.70"
    }
  }
}

provider "aws" {
  profile = "default"
  region  = var.aws_region
}


resource "aws_vpc" "terraform" {
  cidr_block       = "10.0.0.0/24"
  instance_tenancy = "default"
  enable_dns_hostnames = true

  tags = {
    Name = "terraform"
  }
}

resource "aws_subnet" "terraform" {
  vpc_id     =  aws_vpc.terraform.id
  map_public_ip_on_launch = true
  cidr_block = "10.0.0.0/24"

  tags = {
    Name = "Main"
  }
}

resource "aws_default_route_table" "rt" {
  default_route_table_id = aws_vpc.terraform.default_route_table_id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = {
    Name = "main"
  }
}

resource "aws_security_group" "allow_ssh" {
  name        = "allow_ssh"
  description = "Allow ssh inbound traffic"
  vpc_id      = aws_vpc.terraform.id

  ingress {
    description = "SSH from VPC"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [aws_vpc.terraform.cidr_block, "0.0.0.0/0" ]
  }

  ingress {
    from_port = 8
    to_port = 0
    protocol = "icmp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_ssh and ping"
  }
}

resource "aws_key_pair" "terraformcluster" {
  key_name   = "terraform"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDM/LV7yTkKjXJbKl/ity2ccbrI6NzCJMBC4yFRM5WKGlQeoJiKkGJxbzwhFULJc7QcjF1RQ4lcoReXPOc2H9q9kx5aqymzpLMMraF6yWjN2JPRkx8VJSnwiB3O23vhKg97RPBgSJ+HbRyA+ttWGas++A8JubgScq+Cx9PDGyaQ7ZhmRKNIvG+Nu2JdDJQAEfHo38jJiwBQ7KIGec47kenK691NOyeeKhQwA5yVt0EdX4X7JpgIDxltvU3mcKn+L3kdT0UCW39gP7PTj3brQbEhcm5BPdBm1jRiasNCeQPT/REgrFVODwsOpX5vsDl3SA9VCBxY4bzqvyLmJLLmf05FtSY0VaNsDRUR4KD0iuufGRXZHo+DQsV04pl6W1bCx7Ct7bKJhCsdiqmGBBVXv+2twXRF8GTgsCIe0glzCBWmhaSYRpRjX8gX7jG0dkmwYrtLwddsdLqKp7nkVCRO7LMrrrEoVsQvEZIhyd5+rW7admWZG26OBMavF2q4Tuc13mc= ubuntu@ip-172-31-36-152"
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.terraform.id

  tags = {
    Name = "terraform"
  }
}




