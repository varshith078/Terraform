data "aws_ami" "web" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
}
  
locals {
  regionName = var.region_name == "" ? "us-east-2" : var.region_name
}

resource "aws_instance" "web" {

  count = length(var.inst_name)

  ami           = data.aws_ami.web.id
  instance_type = var.inst_type


  tags = {
    Name = element(var.inst_name, count.index)
  }
}



