locals {
  regionName = var.region_name == "" ? "us-east-2" : var.region_name
}

resource "aws_instance" "web" {

  count = length(var.inst_name)

  ami               = data.aws_ami.web.id
  instance_type     = var.inst_type
  security_groups   = [aws_security_group.ssh_port.name]
  availability_zone = data.aws_availability_zones.available.names[count.index]
  user_data = "${file("installhttpd.sh")}"
  key_name = "Aws7pm"

  lifecycle {
    create_before_destroy = true
  }


  tags = {
    Name = element(var.inst_name, count.index)
  }
}