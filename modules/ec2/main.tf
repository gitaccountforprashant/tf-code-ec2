
resource "aws_instance" "web" {
  count = var.number_of_instances

  ami   =  var.ami-name
  subnet_id = var.pci ? data.aws_subnet.ec2-pci.id : data.aws_subnet.ec2-npci.id
  vpc_security_group_ids = split(",", var.pci ? data.aws_security_group.ec2-pci.id : data.aws_security_group.ec2-npci.id)
  instance_type               = var.instance_type
  ebs_optimized               = var.ebs_optimized
  disable_api_termination     = var.disable_api_termination
  key_name                    = aws_key_pair.deployer.key_name
  monitoring                  = var.monitoring
  private_ip                  = var.pci ? var.pci_ip : var.npci_ip
  source_dest_check           = var.source_dest_check
  ipv6_address_count          = var.ipv6_address_count < 0 ? null : var.ipv6_address_count
  ipv6_addresses              = length(var.ipv6_addresses) == 0 ? null : var.ipv6_addresses


  tags = {
    Name            = "${var.app_name}-${var.environment}-${var.pci ? "pci" : "npci"}"
    Environment     = var.environment
    ProductionReady = var.environment == "production" ? true : false
  }

}

resource "aws_key_pair" "deployer" {
  key_name   = "deployer-key"
  public_key = var.pubkey
}

