# Basic flow for a simple terraform file

1. Create a directory for the new project
`mkdir myterraform_folder`

2. Touch a .tf file
`touch example.tf`

3. Edit the file with an editor
`vim example.tf `

4. Enter provider info and then resource info for the resources to be created (Make sure that you have previously configured cli for aws with aws configure)

```bash
provider "aws" {
    access_key = ""
    secret_key = ""
    profile = "default"
    region = "us-east-1"
}
resource "aws_instance" "tf-instance" {
    ami = "........"
    instance_type = "t2.micro"
}
```
5. initialize the directory 
`terraform init`

6. Check the formatting
`terraform fmt`

7. Validate the file
`terraform validate`

8. Apply the changes

`terraform apply` # Click yes on prompt

9. Display the results

`terraform show`

10. If you want to modify the resources jsut edit the .tf file
`vim example.tf`

11. Re-apply the changes
`terraform apply`

12. If you want to do a clean up and terminate everything
`terraform destroy`
