resource "aws_instance" "bastion" {
  ami           = "ami-0f5ee92e2d63afc18"
  instance_type = "t3.medium"
  subnet_id     = var.public_subnet
  key_name      = var.key_name
  vpc_security_group_ids = [var.sg_id]

  tags = {
    Name       = "bastion"
    Project    = "prometheus"
    Monitoring = "false"
    Role       = "Bastion"   # <-- Added this tag for dynamic Ansible
  }
}

