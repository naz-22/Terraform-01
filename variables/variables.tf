# preferences of variables
# 1. command line args -->syntax : terraform plan -var="instance_type=t3.large" (here instance_type is your variable name)which overrides the default variable value
# 2. terraform.tfvars ---> just type terraform plan(whatever is there in tf vars file it will return the same)
# 3. environment variables ---> syntax : $ export TF_VAR_instance_type=t3.xlarge (here instance_type is your variable name)
# 4. default
# 5. prompt :when above  all are not found by terraform then it will ask in pronpt.





variable  "ami_id"  {
    type    = string
    default =  "ami-09c813fb71547fc4f"
    description = "This is the AMI ID of devops-practice which is RHEL-9"
}

variable "instance_type"{
    type = string
    # default = "t3.micro"

}

variable "tags"{
    type = map #optional
    default = {
        Name = "backend"
        Project = "expense"
        Component = "backend"
        Environment = "DEV"
        Terraform = "true"
    }
}

variable "sg_name"{
    default = "allow_sshh"
}


variable "sg_description"{
    default = "Allow port number 22 for SSH  access"
}

variable "from_port"{
    default = 22
    type = number
}

variable "to_port"{
    default = 22
    type = number
}

variable "protocol"{
    default = "tcp"
}

variable "ingress_cidr"{
    type = list(string)
    default = ["0.0.0.0/0"] 
}