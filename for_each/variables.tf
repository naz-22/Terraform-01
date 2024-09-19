variable "instances" {
    type = map
    default = {
        mysql = "t3.small"   # by iterating this loop/map we have to create ec2  instances.
        backend = "t3.micro"
        frontend = "t3.micro"
    }
      
}

variable "domain_name" {
  default = "naziyadaws81.online"
}


variable "zone_id" {
  default = "Z05826553OW8WCB7B39D5"
}