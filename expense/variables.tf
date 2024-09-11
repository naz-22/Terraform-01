variable "instance_names" {
    type = list (string)
    default = ["mysql" , "backend" , "frontend"]
}

variable "common_tags"{
    type = map
    default = {
        Project = "expense"
        Environment = "dev"
        Terraform ="true"
    }

}

variable "zone_id"{
    default = "Z05826553OW8WCB7B39D5"
    }

variable "domain_name"{
    default = "naziyadaws81.online"
    }
