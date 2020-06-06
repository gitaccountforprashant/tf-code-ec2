resource "aws_instance" "web" {
  ami           = "	ami-0edfed9d6e9a4031b"
  instance_type = "t2.micro"

  tags = {
    Name = var.name
  }
  user_data = << EOF
  	#! /bin/bash
    docker pull prashantdec25/tomcat:latest
    docker container run -it --publish 8081:8080 cube

  EOF  
}