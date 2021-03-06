# Terraform module to deploy Ec2 instances in PCI or NPCI vpc

This module:
- Create EC2 instances 
- Recieve vpc, subnet, security grps data based on PCI or NPCI
- can take many parameters like ami-name, instance_size etc

# Usage

- We pass different parameters to main.tf using terraform.tfvars file
- These parameters can also be passed in env variable or commandline (`-- var`)
- Example of `.tfvars` file
```
pci                     = true
environment             = "staging"
# give ips for your instance
pci_ip                  = "172.31.80.5"
npci_ip                 = "172.31.48.5"
app_name                = "web"
ami-name                = "ami-098f16afa9edf40be"
instance_type           = "t2.micro"
ebs_optimized           = false
disable_api_termination = false
ssh_key_pair            = "newkey"
monitoring              = false
source_dest_check       = true
ipv6_address_count      = 0
# put your local machine pub key here so that it can be added in ec2 authorized key.
pubkey                  = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQD3F6tyPEFEzV0LX3X8BsXdMsQz1x2cEikKDEY0aIj41qgxMCP/iteneqXSIFZBp5vizPvaoIR3Um9xK7PGoW8giupGn+EPuxIA4cDM4vzOqOkiMPhz5XK0whEjkVzTo4+S0puvDZuwIsdiW9mxhJc7tgBNL0cYlWSYVkz4G/fslNfRPW5mYAM49f4fhtxPb5ok4Q2Lg9dPKVHO/Bgeu5woMc7RY0p1ej6D4CKFE6lymSDJpW0YHX/wqE9+cfEauh7xZcG0q9t2ta6F6fmX0agvpFyZo8aFbXeUBr7osSCJNgvavWbM/06niWrOvYX2xwWdhXmXSrbX8ZbabVohBK41 email@example.com"
```

