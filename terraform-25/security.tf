locals {
  ingress_rules = [{
    port        = 22
    description = "SSH port"
    },
    {
      port        = 80
      description = "HTTP port"
  }]

}


resource "aws_security_group" "ssh_port" {
  name        = "ssh_port"
  description = "Allow SSH inbound traffic"


  dynamic "ingress" {
    for_each = local.ingress_rules

    content {
      from_port   = ingress.value.port
      to_port     = ingress.value.port
      protocol    = "tcp"
      description = ingress.value.description
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
  # Allow all outbound traffic
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "ssh_port"
  }
}
