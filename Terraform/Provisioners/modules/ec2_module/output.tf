output "my_instance_ipaddress" {
  value= aws_instance.my_instance.public_ip
  }