# How to install terraform on EC2

1. Create an EC2 instance

2. SSH into the instance

3. Update the instance 
`sudo yum update -y`
`$ sudo yum install -y yum-utils`

4. Add hashicorp repo
`$ sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/AmazonLinux/hashicorp.repo`

6. Install terraform
`$ sudo yum -y install terraform`

7. Check to see it is installed properly
` $ terraform --version`