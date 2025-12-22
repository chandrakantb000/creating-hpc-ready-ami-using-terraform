module "vpc" {
  source  = "aws-ia/vpc/aws"
  version = ">= 4.2.0"

  name       = "image-builder-vpc"
  cidr_block = "10.123.0.0/16"
  az_count   = 2
  subnets = {
    public  = { netmask = 24 }
    private = { netmask = 24 }
  }
}


