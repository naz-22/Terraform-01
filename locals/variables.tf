variable "instance_names" {
  type        = list(string)
  default     = ["mysql", "backend", "frontend"]
  description = "description"
}

# variable "domain_name" {
#   default = "naziyadaws81.online"
# }


# variable "zone_id" {
#   default = "Z05826553OW8WCB7B39D5"
# }

variable "environment" {
  default = "prod"
}