resource "aws_security_group" "allow_ssh_ansible_nginx" {
  name        = "allow_ssh_ansible_nginx"
  description = "Allow SSH inbound traffic"
  vpc_id      = "vpc-063fc945cde94d3ab"

  ingress = [
    {
      description      = "SSH from VPC"
      from_port        = 22
      to_port          = 22
      protocol         = "tcp"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = ["::/0"]
      prefix_list_ids  = null,
      security_groups  = null,
      self             = null
    },
    {
      description      = "SSH from VPC"
      from_port        = 80
      to_port          = 80
      protocol         = "tcp"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = ["::/0"]
      prefix_list_ids  = null,
      security_groups  = null,
      self             = null
    }
  ]

  egress = [
    {
      from_port        = 0
      to_port          = 0
      protocol         = "-1"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = ["::/0"],
      description : "Libera dados da rede interna"
      prefix_list_ids = []
      security_groups = []
      self            = false
    }
  ]

  tags = {
    Name = "allow_ssh_ansible_nginx"
  }
}

output "allow_ssh_ansible_nginx" {
  value = aws_security_group.allow_ssh_ansible_nginx.id
}