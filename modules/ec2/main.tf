
resource "aws_instance" "web" {
  count = var.number_of_instances

  ami   =  var.ami-name
  # depending on pci is true or false, subnet is selected: pci subnet or npci subnet
  subnet_id = var.pci ? data.aws_subnet.ec2-pci.id : data.aws_subnet.ec2-npci.id
  # depending on pci is true or false, security grps are selected: pci sg or npci sg
  vpc_security_group_ids = split(",", var.pci ? data.aws_security_group.ec2-pci.id : data.aws_security_group.ec2-npci.id)
  # below are the parameters we should provide depending on our need:
  instance_type               = var.instance_type
  ebs_optimized               = var.ebs_optimized
  disable_api_termination     = var.disable_api_termination
  # this key pair name will be fetched from aws_key_pair resource created in bottom.
  key_name                    = aws_key_pair.deployer.key_name
  monitoring                  = var.monitoring
  # we can provide ip to our instance depending pci is true or false
  private_ip                  = var.pci ? var.pci_ip : var.npci_ip
  source_dest_check           = var.source_dest_check
  # below is needed if we are giving ipv6 ip to ec2
  ipv6_address_count          = var.ipv6_address_count < 0 ? null : var.ipv6_address_count
  ipv6_addresses              = length(var.ipv6_addresses) == 0 ? null : var.ipv6_addresses


  # its will take pci if pci variable is true OR npci if pci is false
  # if envioronment is other than production this tag always false
  tags = {
    
    Name            = "${var.app_name}-${var.environment}-${var.pci ? "pci" : "npci"}" 
    Environment     = var.environment
    ProductionReady = var.environment == "production" ? true : false
  }

}

resource "aws_key_pair" "deployer" {
  key_name   = var.ssh_key_pair
  public_key = var.pubkey
}

