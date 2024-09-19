resource  "aws_security_group"  "allow_ssh_terraform" {
    name        = "dynamic_demo"  #name of sg 
    description = "Allow port number 22 for SSH  access"

  # usually we allow everything in  egress:means outgoing traffic where ingress:incoming traffic
  egress {
     from_port        = 0
     to_port          = 0
     protocol         = "-1"
     cidr_blocks      = ["0.0.0.0/0"]
     ipv6_cidr_blocks = ["::/0"]
  } 
 
 # terraform will give us a varaiable with block name.dynamic means it will create the blocks repeateadly.like below ingress.
   dynamic "ingress" {
     for_each = var.ingress_rules
     content {
         from_port        = ingress.value["from_port"]
         to_port          = ingress.value["to_port"]
         protocol         = ingress.value["protocol"] # by default "-1" means everything or we can just mention tcp
         cidr_blocks      = ingress.value["cidr_blocks"] # allow from everyone
        
        }
   }

   tags = {
    Name = "allow_sshh"
   }


} 


