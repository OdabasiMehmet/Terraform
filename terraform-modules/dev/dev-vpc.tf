module "tf-vpc" {
    source = "../modules"
    environment = "DEV"
    public_subnet_cidr = "10.0.7.0/24"
}

output "vpc-cidr-block" {
  value = module.tf-vpc.vpc_cidr
}

