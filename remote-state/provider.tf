terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.66.0"
    }
  }

  # here backend s nothing but state like tf state
  backend "s3" {   
    bucket = "naz-remote-state"
    key    = "remote-state-demo"
    region = "us-east-1"
    dynamodb_table = "81s-locking"  # here dynamodb_table filed is for locking
   }

}


provider "aws" {
  # Configuration options
  #Generally we have to give authentication info here, but if we do so and push it into github then myaccess key and secret key will be 
  #displayed /will become public which will be problem ,so  we're using aws configure cmnd in command line(in git bash/win command prompt)
 
  region="us-east-1"

}