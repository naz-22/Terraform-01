resource "aws_instance" "terraform" {
   
    ami=  var.ami_id #left side & right side values need not to be same if they ae same also its fine.
    instance_type = var.instance_type
    vpc_security_group_ids = [ aws_security_group.allow_ssh_terraform.id ]
     tags = var.tags
}
 
 resource  "aws_security_group"  "allow_ssh_terraform" {
    name        = var.sg_name  #allow_ssh is already in my account so given another name like sshh
    description = var.sg_description

  # usually we allow everything in  egress:means outgoing traffic where ingress:incoming traffic
  #the below part is called block in terraform
  egress {
     from_port        = 0
     to_port          = 0
     protocol         = "-1"
     cidr_blocks      = ["0.0.0.0/0"]
     ipv6_cidr_blocks = ["::/0"]
  } 

  ingress {
     from_port        = var.from_port
     to_port          = var.to_port
     protocol         = var.protocol # by default "-1" means everything or we can just mention tcp
     cidr_blocks      = var.ingress_cidr # allow from everyone
     ipv6_cidr_blocks = ["::/0"]
  } 

   tags = var.tags


} 



