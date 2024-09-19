resource "aws_instance" "terraform" {
   
    ami=  "ami-09c813fb71547fc4f"
    instance_type = "t3.micro"
    vpc_security_group_ids = [ aws_security_group.allow_ssh_terraform.id ]
     tags = {
          Name = "terraform"
     }
     #After creation of instance i want the ip address of the instace & want to store it in a file instead of displaying it publically #In this case my laptop is local.#And provisioners are of two types 1.local (where terraform is executed locally like in a linux, ansible by doing git pull)& 2.Remote(like inside mysql, backend, frontend servers. to write remote exec we should have connection block.)
     provisioner "local-exec"{
        command = "echo  ${self.private_ip} > public_ip.txt" #here self means aws_instance.terraform only.
     }

     connection {
            type     = "ssh"
            user     = "ec2-user"
            password = "DevOps321"
            host     = self.public_ip
    }
    # provisioners will execute only at the time of resource creation.
     provisioner "remote-exec" {
        #inline means we can run multiple  commands inside it . we're connecting to ec2-user so we're taking root access
        inline = [
            "sudo dnf install ansible -y",
            "sudo dnf install nginx -y",
            "sudo systemctl start nginx",
                
        ]
    }


    provisioner "remote-exec" {
        #inline means we can run multiple  commands inside it . we're connecting to ec2-user so we're taking root access
        when = destroy
        inline = [
            "sudo systemctl stop nginx",
                
        ]
    }
}
resource  "aws_security_group"  "allow_ssh_terraform" {
    name        = "allow_sshh"  #allow_ssh is already in my account so given another name like sshh
    description = "Allow port number 22 for SSH  access"

  # usually we allow everything in  egress:means outgoing traffic where ingress:incoming traffic
  egress {
     from_port        = 0
     to_port          = 0
     protocol         = "-1"
     cidr_blocks      = ["0.0.0.0/0"]
     ipv6_cidr_blocks = ["::/0"]
  } 

   ingress {
     from_port        = 22
     to_port          = 22
     protocol         = "tcp" # by default "-1" means everything or we can just mention tcp
     cidr_blocks      = ["0.0.0.0/0"] # allow from everyone
     ipv6_cidr_blocks = ["::/0"]
  } 

ingress {
     from_port        = 80
     to_port          = 80
     protocol         = "tcp" # by default "-1" means everything or we can just mention tcp
     cidr_blocks      = ["0.0.0.0/0"] # allow from everyone
     ipv6_cidr_blocks = ["::/0"]
  } 
   tags = {
    Name = "allow_sshh"
   }


} 



