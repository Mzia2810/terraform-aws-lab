resource "aws_instance" "public_ec2" {
  ami           = var.ami_id
  instance_type = var.instance_type

  subnet_id              = var.public_subnet_id
  

  associate_public_ip_address = true

  tags = {
    Name = "bastion-host"
  }
}




resource "aws_instance" "private_ec2" {
  ami           = var.ami_id
  instance_type = var.instance_type

  subnet_id              = var.private_subnet_id
 

  tags = {
    Name = "app-server"
  }
}