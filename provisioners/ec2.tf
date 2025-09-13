resource "aws_instance" "roboshop" {
  ami           = "ami-09c813fb71547fc4f"
  instance_type = "t3.micro"
  vpc_security_group_ids = [ aws_security_group.allow_all.id ]

  tags = {
    Name = "HelloWorld"
  }

    provisioner "local-exec" {
    command = "echo ${self.private_ip} > inventory"
    on_failure = continue
  }
  connection {
    type     = "ssh"
    user     = "ec2-user"
    password = "DevOps321"
    host     = self.public_ip
  }

  provisioner "remote-exec" {
    inline = [
      "sudo dnf install nginx -y",
       "sudo systemctl start nginx",
    ]
  }
  provisioner "remote-exec" {
    when = destroy
    inline = [
      "sudo dnf systemctl stop nginx",
    ]
  }
}
 

resource "aws_security_group" "allow_all" {
     name        = "allow_all"
      description = "allow all traffic"

      ingress {
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
        Name = "allow-all"
      }
}