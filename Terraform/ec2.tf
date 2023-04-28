resource "aws_instance" "ec2_instance" {
   
    ami = "${var.ami_id}"
   
    count = "${var.number_of_instances}"
   
    subnet_id = "${var.subnet_id}"
   
    instance_type = "${var.instance_type}"
   
    key_name = "${var.ami_key_pair_name}"

    security_groups = [ aws_security_group.allow_tls.id]
} 

resource "aws_security_group" "allow_tls" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic"
  vpc_id      = var.vpc_id

  ingress {
    description      = "TLS from VPC"
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "allow_tls"
  }
}

