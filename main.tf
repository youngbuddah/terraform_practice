provider "aws" {
  region = "ap-south-1"
}

# Get latest Amazon Linux 2 AMI
data "aws_ami" "amazon_linux" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
}

# Create EC2 instances using for_each (map) from for expression
resource "aws_instance" "ec2_instances" {
  for_each = var.environments

  ami           = data.aws_ami.amazon_linux.id
  instance_type = each.value

  tags = {
    Name = "ec2-${each.key}"
    Env  = each.key
  }
}
