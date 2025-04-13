resource "aws_key_pair" "ssh-key" {
  key_name   = "ssh-key"
  public_key = file("${path.module}/id_rsa.pub")
}

locals {
  ports = [80, 22, 443, 8080, 9090, 5173]
}

resource "aws_security_group" "security-grp" {
  name        = "Security-Group"
  description = "Allowing security group"
  dynamic "ingress" {
    for_each = local.ports
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

  tags = {
    Name = "Security Group"
  }
}



#Master node (Jenkins)
resource "aws_instance" "trial" {
  ami                    = var.ami-id
  instance_type          = "t2.xlarge"
  key_name               = aws_key_pair.ssh-key.key_name
  vpc_security_group_ids = ["${aws_security_group.security-grp.id}"]
  tags = {
    Name = "Docker project"
  }
 root_block_device {
    volume_size = 30
    volume_type = "gp2"
  }
}


