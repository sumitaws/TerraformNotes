resource "aws_instance" "terraform_ec2" {
  ami           = var.aws_ami_type
  instance_type = var.aws_instance_type
  count = var.instance_count
  associate_public_ip_address = var.enable_public_ip 

    tags = {
        Name = "terraform_ec2"
    }
}
// The count parameter is set to the length of the var.username variable.
//This means that Terraform will create as many IAM user resources as there are elements in the username list. 
//The length function is used to determine the number of elements in the list, which dynamically sets the number of IAM users to be created.
resource "aws_iam_user" "example" {
  count = length(var.username)
  name  = var.username[count.index]
}
//The name parameter is set to var.username[count.index]. 
//Here, count.index is a special variable that represents the current index in the loop created by the count parameter. 
//This allows Terraform to iterate over the username list and assign each element as the name of a new IAM user.