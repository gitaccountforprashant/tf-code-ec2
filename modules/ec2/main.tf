resource "aws_instance" "web" {
  ami           =  var.ami-name
  instance_type = "t2.micro"

  tags = {
    Name = var.ec2-name
  }

}

