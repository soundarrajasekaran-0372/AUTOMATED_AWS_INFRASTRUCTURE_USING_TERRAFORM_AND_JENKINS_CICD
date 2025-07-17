resource "aws_instance" "myec2" {
  ami                    = var.Instance_AMI
  instance_type          = var.Instance_Type
  vpc_security_group_ids = [aws_security_group.Alb.id]
  tags = {
    Name = "CICD_Application_Server"
  }
}

resource "aws_security_group" "Alb" {
  name        = "Web-Application-Firewall"
  description = "Web-App-Firewall"

  dynamic "ingress" {
    for_each = var.Allowed_SG_Ports
    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  dynamic "egress" {
    for_each = var.Allowed_SG_Ports
    content {
      from_port   = egress.value
      to_port     = egress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
}