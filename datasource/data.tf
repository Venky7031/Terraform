data "aws_ami" "joindevops" {
    most_recent      = true
    
     filter {
    name   = "name"
    values = ["Amazon Linux 2023"]
  }

}

output "ami_id"{
    value = data.aws_ami.joindevops

}
