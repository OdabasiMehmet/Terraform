# MODULES HANDS ON

1. Create folders name `terraform-modules`, `modules`, `dev`, `prod` directories in the home directory and files as below.

```bash
mkdir terraform-modules && cd terraform-modules && mkdir dev modules prod && cd dev && touch dev-vpc.tf && cd ../modules && touch main.tf outputs.tf variables.tf && cd ../prod && touch prod-vpc.tf && cd ../modules
```

```txt
 terraform-modules
   ├── dev
   │   └── dev-vpc.tf
   ├── modules
   │   ├── main.tf
   │   ├── outputs.tf
   │   └── variables.tf
   └── prod
       └── prod-vpc.tf
```



2. Go to the `modules/main.tf` file, add the followings.

```
provider "aws" {
  region = "us-east-1"
}

resource "aws_vpc" "module_vpc" {
  cidr_block = var.vpc_cidr_block
  tags = {
    Name = "terraform-vpc-${var.environment}"
  }
}

resource "aws_subnet" "public_subnet" {
  cidr_block = var.public_subnet_cidr
  vpc_id = aws_vpc.module_vpc.id
  tags = {
    Name = "terraform-public-subnet-${var.environment}"
  }
}

resource "aws_subnet" "private_subnet" {
  cidr_block = var.private_subnet_cidr
  vpc_id = aws_vpc.module_vpc.id
  tags = {
    Name = "terraform-private-subnet-${var.environment}"
  }
}
```

# This is not a real public subnet. Because we didn't attach it to a internet gateway. It is the route table entries that make the subnets private or public.

3. Go to the `modules/variables.tf` file, add the followings.

```
variable "environment" {
  default = "clarusway"
}

variable "vpc_cidr_block" {
  default = "10.0.0.0/16"
  description = "this is our vpc cidr block"
}

variable "public_subnet_cidr" {
  default = "10.0.1.0/24"
  description = "this is our public subnet cidr block"
}

variable "private_subnet_cidr" {
  default = "10.0.2.0/24"
  description = "this is our private subnet cidr block"
}
```

4. Go to the `modules/outputs.tf` file, add the followings.

```
output "vpc_id" {
  value = aws_vpc.module_vpc.id
}

output "vpc_cidr" {
  value = aws_vpc.module_vpc.cidr_block
}

output "public_subnet_cidr" {
  value = aws_subnet.public_subnet.cidr_block
}

output "private_subnet_cidr" {
  value = aws_subnet.private_subnet.cidr_block
}
```

5. Go to the `dev/dev-vpc.tf` file, add the followings.

```
module "tf-vpc" {
  source = "../modules"
  environment = "DEV"
  }

output "vpc-cidr-block" {
  value = module.tf-vpc.vpc_cidr
}
```

6. Go to the `prod/prod-vpc.tf` file, add the followings.

```
module "tf-vpc" {
  source = "../modules"
  environment = "PROD"
  }

output "vpc-cidr-block" {
  value = module.tf-vpc.vpc_cidr
}
```

7. Go to the `dev` folder and run the command below.

```bash
terraform init

terraform apply
```

8. Go to the AWS console and check the VPC and subnets.

9. Go to the `prod` folder and run the command below.

```bash
terraform init

terraform apply
```

10. Go to the AWS console and check the VPC and subnets.

  

11. If everything has worked out perfect so far:
Go to the `prod` and  `dev` folders and run the command below.

```bash
terraform destroy -auto-approve