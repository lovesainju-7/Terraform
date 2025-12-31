# key pair for login
resource "aws_key_pair" "my_key" {
  key_name   = "${var.env}_terra_key_ec2"
  public_key = file("terra-key-ec2.pub")
}

#VPC and Security Group
resource "aws_default_vpc" "default" {

}

resource "aws_security_group" "my-secret-group" {
  name        = "${var.env}-secret-group"
  description = "Allow SSH and HTTP"
  vpc_id      = aws_default_vpc.default.id // Example of interpolation.
  // keyname    = aws_key_pair.my_key.key_name          // Example of interpolation.

  tags = {
    Name = "my-secret-group"
  }

  #inbound rules
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "SSH access from anywhere in the world"
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "HTTP access from anywhere in the world"
  }

  #outbound rules
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow all outbound traffic"
  }


}

# EC2 Instance
resource "aws_instance" "my_ec2_instance" {

  count = var.instance_count

  key_name        = aws_key_pair.my_key.key_name // Example of interpolation.
  instance_type   = var.instance_type
  security_groups = [aws_security_group.my-secret-group.name] // Example of interpolation.
  ami             = "ami-05134c8ef96964280"                   // linux ami ubuntu 20.04 in us-west-2
  root_block_device {
    volume_size = var.env == "prod" ? 20 : 10
    volume_type = "gp3"
  }

  tags = {
    Name        = "${var.env}-Custom-EC2-Instance"
    environment = var.env

  }
}
