module "vpc" {
  source  = "aws-ia/vpc/aws"
  version = ">= 4.2.0"

# Here we create a vpc image-builder-vpc with 2 availability zones
  name       = "image-builder-vpc"          
  cidr_block = "10.123.0.0/16"          # VPC CIDR block with 65536 IP addresses
  az_count   = 2
  subnets = {
    public  = { netmask = 24 }          # 10.123.0.0/24  256 IP addresses
    private = { netmask = 24 }          # 10.123.1.0/24  256 IP addresses
  }
}


# Create a security group for the image builder instance
module "security_group" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "5.3.0"

  name         = "instance-sg"                              # create security group for image builder instance instance-sg
  vpc_id       = module.vpc.vpc_attributes.id               # associate security group with vpc created above
  description  = "Security group for Image Builder"
  egress_rules = ["all-all"]                                # allow all outbound traffic 
}

# Create an IAM role and instance profile for the image builder instance
module "instance_profile" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-assumable-role"
  version = "5.55.0"

  trusted_role_services   = ["ec2.amazonaws.com"]          # trust ec2 service to assume this role 
  role_name               = "image-builder-role"           # name of the role
  create_role             = true
  create_instance_profile = true
  role_requires_mfa       = false
  custom_role_policy_arns = [
    "arn:aws:iam::aws:policy/EC2InstanceProfileForImageBuilder",        # attach managed policy for image builder
    "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"              # attach managed policy for ssm
  ]
}

# Create an infrastructure configuration for the image builder
resource "aws_imagebuilder_infrastructure_configuration" "infrastructure" {
  instance_types                = ["c6i.2xlarge", "c6i.4xlarge"]                            # instance types for image builder
  security_group_ids            = [module.security_group.security_group_id]                 # associate security group created above
  instance_profile_name         = module.instance_profile.iam_instance_profile_name         # associate instance profile created above
  subnet_id                     = values(module.vpc.public_subnet_attributes_by_az)[0].id   # use the first public subnet created above
  name                          = "my-pipeline-infra"
  terminate_instance_on_failure = true
}

