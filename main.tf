resource "aws_instance" "amazon" {
  ami           = var.ami
  instance_type = var.instance_type
  key_name      = var.key_name

  vpc_security_group_ids = [aws_security_group.sg.id]

  root_block_device {
    volume_size = var.root_ebs_volume
  }

  tags = {
    Name = var.instance_name
  }
}

resource "aws_security_group" "sg" {
  name = "security-group"

  dynamic "ingress" {
    for_each = [22, 80, 443, 8080, 3000, 9000]

    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
