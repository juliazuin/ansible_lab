provider "aws" {
  region = "us-east-1"
}
resource "aws_instance" "web" {
  ami                     = data.aws_ami.ubuntu.id
  instance_type           = "t3.micro"
  key_name                = "chave_development_julia" # key chave publica cadastrada na AWS 
  subnet_id               =  "subnet-0734ecf92f4be11fa" # vincula a subnet direto e gera o IP automático
  private_ip              = "10.10.10.100"
  vpc_security_group_ids  = [
    "${aws_security_group.allow_ssh_ansible.id}",
  ]
  root_block_device {
    encrypted = true
    kms_key_id  = "arn:aws:kms:us-east-1:534566538491:key/90847cc8-47e8-4a75-8a69-2dae39f0cc0d" #key managment service (aws) -> awsmanaged keys -> aws/ebs -> copy arn
    # volume_size = 8
  }

  tags = {
    Name = "ec2_tf_Julia"
  }
}
