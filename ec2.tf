# Creating 1st EC2 instance in Public Subnet
resource "aws_instance" "demoinstance" {
  ami                         = lookup(var.AMIS, var.AWS_REGION, "")
  instance_type               = "t2.micro"
  /*count                       = 1*/
  key_name = aws_key_pair.deployer.key_name
  vpc_security_group_ids      = ["${aws_security_group.demosg.id}"]
  subnet_id                   = "${aws_subnet.public-subnet-1.id}"
  associate_public_ip_address = true
  user_data                   = "${file("data.sh")}"
tags = {
  Name = "My Public Instance"
}
provisioner "file"{
    source      = "code"
    destination = "/var/www/html"

    connection {
      type        = "ssh"
      user        = "ubuntu"
      private_key = "${file("/home/sameep/pisb/share/aws/3-tire-app/deployer-key.pem")}"
      host        = "${aws_instance.demoinstance.public_ip}"
    }
  }

}
# Creating 2nd EC2 instance in Public Subnet
resource "aws_instance" "demoinstance1" {
  ami                         = lookup(var.AMIS, var.AWS_REGION, "")
  instance_type               = "t2.micro"
  /*count                       = 1*/
  key_name = aws_key_pair.deployer.key_name
  vpc_security_group_ids      = ["${aws_security_group.demosg.id}"]
  subnet_id                   = "${aws_subnet.public-subnet-2.id}"
  associate_public_ip_address = true
  user_data                   = "${file("data.sh")}"
  tags = {
  Name = "My Public Instance 2"
}
}
resource "tls_private_key" "deployer" {
  algorithm     = "RSA"
  rsa_bits      = 4096
}

resource "aws_key_pair" "deployer" {
  key_name      = "deployer-key"
  public_key    = tls_private_key.deployer.public_key_openssh

  provisioner "local-exec" {
    command = <<-EOT
      echo "${tls_private_key.deployer.private_key_pem}" > deployer-key.pem
      chmod 400 deployer-key.pem
      
    EOT
  }
}  
