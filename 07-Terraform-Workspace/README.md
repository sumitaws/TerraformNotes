# Terraform worksapces
Terraform worksapces is a very logical concept where you can have multiple states of your infrastructure configuration. To put this in simple words if you are running an infrastructure configuration in development environment then the same infrastructure can be run in the production environment.

The main benefit of terraforming workspaces we get is we can have more than one state associated with a single terraform configuration.

If you have not defined any workspace then there is always a default workspace created by terraform, so you always work in a default workspace of terraform. You can list the number of terraform workspaces by running the command terraform workspace show. Also, you can not delete the default workspace

We will be looking into below details:
How to create a new Terraform workspace
How to List all the Terraform workspaces
How to Show Terraform workspaces
How to Switch Terraform workspaces
How to use the name of Current Workspace using ${terraform.workspace} Interpolation
Terraform workspace and terraform.tfstate, terraform.tfstate.d
When to use multiple terraform workspaces?

1. How to create a new Terraform workspace
To create a terraform workspace first you make sure that you have installed terraform. After that, you simply need to run the following terraform workspace command 

```t
terraform workspace new dev 
```
Here are few points to keep in mind -

To create a workspace you must type in the keyword workspace after terraform
You must also type in new for creating a new workspace
The third and last thing is your workspace name, in the above command I have taken the workspace name as dev

1.1 Create one more workspace with name test
To get a better understanding of workspace and how it isolates then I would highly recommend creating one more workspace where we run the terraform commands respectively on each workspace without affecting their states

Here is the command for creating another workspace with the name test
```t
terraform workspace new test 
```

2. How to List all the Terraform workspaces?
Now in step 1 we have seen how to create a new workspace in terraform. But then how to list all the workspaces which we have created previously.

So to list all the available workspaces use the following terraform command -
```t
terraform workspace list 
```
The above command will list down all the available workspaces including the default workspace also

3. How to Show Terraform workspaces?
Now we know how to create a terraform workspace and how to list all the available workspace in terraform.
But is there a way to show active workspace?
Terraform provides a command terraform workspace show which can help you to show the active running workspace in which you are working.
```t
terraform workspace show
```

4. How to switch Terraform workspaces?
It might be possible that you have created multiple workspaces to isolate your infrastructure code and you want to switch between the workspaces to apply your infrastructure changes.
So to switch the workspace you should following terraform command -
```t
terraform workspace select test  
```
5. How to use the name of Current Workspace using ${terraform.workspace} Interpolation?
While working with longer terraform infrastructure code it often needed to name or tag your resources based on the environment profile such as dev, test, stage, prod, etc.

With the help of ${terraform.workspace} interpolation sequence you can use the current workspace name to define terraform locals.

Here is a simple example of provisioning a simple EC2 instance -

I have defined a terraform local instance_name
The terraform local have a name prefixed with the current workspace name .i.e. - "${terraform.workspace}-instance"
And the terraform local is used to tag the aws_instance

```t
 provider "aws" {
   region     = "eu-central-1"
   access_key = ""
   secret_key = ""
   
}

locals {
  instance_name = "${terraform.workspace}-instance" 
}

resource "aws_instance" "ec2_example" {

    ami = "ami-0767046d1677be5a0" 

    instance_type = var.instance_type

    tags = {
      Name = local.instance_name
    }
}
```
6. Terraform workspace and terraform.tfstate, terraform.tfstate.d
Whenever you work with terraform workspace and when you create multiple workspaces then you will get one directory created for each workspace inside your terraform project.

So with each workspace, you end up with its own terraform.tfstate and terraform.tfstate.d file which will help you to separate and isolate the infrastructure behavior based on your configuration settings.

7. When to use multiple terraform workspaces?
Here are some key points where I felt you should use terraform workspaces -

a) When you feel that you need a parallel, distinct copy of your infrastructure which you can test and verify in the development, test, and staging environment before putting it into the production environment.
b) Secondly terraform workspaces acts as feature branch. If you have ever worked with a versioning tool then you might be familiar with main or master where every developer merges their code from the feature branch. So assume the default workspace as your main or master and the workspaces` as your featured branch where you will test and verify your changes.
c) Do not presume that with terraform workspaces you can separate or decompose your infrastructure component. Terraform workspaces are not meant to decompose your infrastructure. If you really want to separate or decompose your infrastructure then I would recommend using a separate set of configuration and backend to achieve that.
d) If you have your infrastructure where each deployment requires you to put different setup credentials then you should not use Terraform workspaces for that.
