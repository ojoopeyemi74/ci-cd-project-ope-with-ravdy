provider "aws" {
  region = "eu-west-2"
}

resource "aws_instance" "demo-server" {
    ami = "ami-0505148b3591e4c07"
    instance_type = "t2.micro"
    key_name = "aws-new-acct-eu-west-2-keypair"
    //security_groups = [ "demo-sg" ]
    vpc_security_group_ids = [aws_security_group.demo-sg.id]
    subnet_id = aws_subnet.dpp-public-subnet-01.id 
for_each = toset(["jenkins-master", "build-slave", "ansible"])
   tags = {
     Name = "${each.key}"
   }
}


output "instance_public_ips" {
  value = {
    for instance in aws_instance.demo-server :
    instance.tags.Name => instance.public_ip
  }
}

output "instance_private_ips" {
  value = {
    for instance in aws_instance.demo-server :
    instance.tags.Name => instance.private_ip
  }
}


