provider "aws" {
}

module "ec2" {
    source = "./modules/ec2"
    ec2-name =  "first-ec2"
}