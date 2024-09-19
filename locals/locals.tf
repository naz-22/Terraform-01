locals {
  domain_name = "naziyadaws81.online"
  zone_id     = "Z05826553OW8WCB7B39D5"
  instance_type = var.environment == "prod" ? "t3.medium" : "t3.micro"
 
  # we can also keep instances variable in locals but count.index won't work here in locals

}

















































