
variable "ami-name" {
  default = "ami-098f16afa9edf40be"
  type = string
}


variable "pci" {
  default = true
  type = bool
}

variable "environment" {
}

variable "app_name" {
}

variable "instance_type" {
  default = "t2.micro"
}

variable "ebs_optimized" {
  type        = bool
  description = "Launched EC2 instance will be EBS-optimized"
  default     = false
}

variable "disable_api_termination" {
  type        = bool
  description = "Enable EC2 Instance Termination Protection"
  default     = false
}

variable "ssh_key_pair" {
  type        = string
  description = "SSH key pair to be provisioned on the instance"
}

variable "monitoring" {
  type        = bool
  description = "Launched EC2 instance will have detailed monitoring enabled"
  default     = false
}

variable "source_dest_check" {
  type        = bool
  description = "Controls if traffic is routed to the instance when the destination address does not match the instance. Used for NAT or VPNs"
  default     = true
}

variable "ipv6_addresses" {
  type        = list(string)
  description = "List of IPv6 addresses from the range of the subnet to associate with the primary network interface"
  default     = []
}

variable "ipv6_address_count" {
  type        = number
  description = "Number of IPv6 addresses to associate with the primary network interface. Amazon EC2 chooses the IPv6 addresses from the range of your subnet (-1 to use subnet default)"
  default     = 0
}

variable "pci_ip" {
  type        = string
}


variable "npci_ip" {
  type        = string
}

variable "number_of_instances" {
  type        = number
  default = 1
}

variable "pubkey" {
  type        = string
}
