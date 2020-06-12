data "aws_vpc" "main" {
  tags = {
    Name = var.environment
  }
}

data "aws_subnet" "ec2-npci" {
  vpc_id = data.aws_vpc.main.id

  tags = {
    Name = "ec2-npci"
  }
}

data "aws_subnet" "ec2-pci" {
  vpc_id = data.aws_vpc.main.id

  tags = {
    Name = "ec2-pci"
  }
}


data "aws_security_group" "ec2-npci" {
  vpc_id = data.aws_vpc.main.id

  tags = {
    Name        = "ec2-npci"
  }
}

data "aws_security_group" "ec2-pci" {
  vpc_id = data.aws_vpc.main.id

  tags = {
    Name        = "ec2-pci"
  }
}