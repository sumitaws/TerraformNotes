# Terraform Templates
Terraform templates are typically used to define reusable configurations and dynamically render text files (e.g., configuration files) with interpolated values. The most common use case is with templatefile() or the template provider.
We go through the basics of Terraform Templates and discuss probable use cases and examples. In short, if the applications hosted on your infrastructure depend on certain configuration files – which are usually not part of the application repository – Terraform templates help manage those files in dynamic ways.

## What are Terraform templates?
Terraform templates are configuration files that define and describe the infrastructure resources required for a particular application or environment using a declarative configuration language called Hashicorp Configuration Language (HCL). 

These templates have a “.tf” extension, and they enable users to code infrastructure, ensuring consistent and reproducible deployments. 

Inside a template, users can specify different resources such as virtual machines, IAM components, storage resources, or networking components and configure their relationships and properties. When executed using the Terraform CLI, these templates are translated into a set of actions that realize the described infrastructure on the targeted provider.

Templates play an important role in automation. This lso applies to Terraform workflows as Terraform is a tool to automate infrastructure lifecycle management. Infrastructure as code (IaC) has allowed us to leverage programming principles in cloud infrastructure maintenance, introducing consistency, faster provisioning, reduced manual maintenance efforts, and, consequently, minimized risks.

In this post, we go through the basics of Terraform Templates and discuss probable use cases and examples. In short, if the applications hosted on your infrastructure depend on certain configuration files – which are usually not part of the application repository – Terraform templates help manage those files in dynamic ways.

What are Terraform templates?
Terraform templates are configuration files that define and describe the infrastructure resources required for a particular application or environment using a declarative configuration language called Hashicorp Configuration Language (HCL). 

These templates have a “.tf” extension, and they enable users to code infrastructure, ensuring consistent and reproducible deployments. 

Inside a template, users can specify different resources such as virtual machines, IAM components, storage resources, or networking components and configure their relationships and properties. When executed using the Terraform CLI, these templates are translated into a set of actions that realize the described infrastructure on the targeted provider.

If you need any help managing your Terraform infrastructure, building more complex workflows based on Terraform, and managing AWS credentials per run, instead of using a static pair on your local machine, Spacelift is a fantastic tool for this. It supports Git workflows, policy as code, programmatic configuration, context sharing, drift detection, and many more great features right out of the box.

Terraform templates benefits
Terraform offers a way to package a group of Terraform scripts as modules. Modules are reusable infrastructure components based on which additional customized infrastructure components are built. 

Modules offer a way to customize the included components using input variables. Input variables provide a way to control aspects like scale, range, type, etc., for infrastructure to be provisioned.

Terraform Templates are a great way to further extend the flexibility provided by modules. Templates manage the configuration and data files, enabling granular control and making the module more flexible and reusable.

Like modules, usage of input variables drives template files to shape the actual config or data files on the target resource.

## Key concepts for Terraform templates
Terraform templates combine a few features – templatefile function, string literals, and template files themselves.

## templatefile function
The templatefile() function accepts a couple of inputs: 

A template file (*.tftpl)
Variable – which could be a list or map.
The template file contains text in UTF-8 encoded text, representing the desired format data. For example, configuration files required by applications have different formats. These files support Terraform’s string literals, which help replace the actual values supplied in variables.

For the final configuration, variables provide a way to set values in these template files dynamically. Before runtime, make sure that the template files are available on the disk.

## File provisioners
File provisioners provide a way to copy the files from the machine where Terraform code executes to the target resource. The source attribute specifies the file’s source path on the host machine, and the destination attribute specifies the desired path where the file needs to be copied on target.