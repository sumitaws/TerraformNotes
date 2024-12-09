In Terraform, provisioners are used to execute scripts or commands on the target machine after the resource has been created or modified. Provisioners are generally used to bootstrap or configure a resource once it's up.

Terraform supports the following provisioners:
1. File
2. Local-Exec
3. Remote-Exec
4. Null Resource with Provisioners

## File Provisioner
The file provisioner is used to copy files or directories from the machine where Terraform is running to the target resource, such as an EC2 instance or any other virtual machine.

```t
resource "aws_instance" "example" {
  ami           = "ami-12345678"
  instance_type = "t2.micro"

  provisioner "file" {
    source      = "local_script.sh"
    destination = "/tmp/remote_script.sh"
  }
}
```
### Source: Path of the file or directory to be copied from the local machine.
### Destination: Path where the file or directory should be copied on the remote machine.

## Local-Exec Provisioner
The local-exec provisioner runs a command locally (on the machine where Terraform is executed), rather than on the resource itself.

```t
resource "aws_instance" "example" {
  ami           = "ami-12345678"
  instance_type = "t2.micro"

  provisioner "local-exec" {
    command = "echo ${self.public_ip} > ip_address.txt"
  }
}
```
Runs a command locally, e.g., to save the instance’s public IP to a file on the local machine.

### Remote-Exec Provisioner
The remote-exec provisioner is used to execute commands on the remote resource, such as a virtual machine (e.g., an EC2 instance). This provisioner requires that you can SSH into the instance or otherwise connect to it.

```t
resource "aws_instance" "example" {
  ami           = "ami-12345678"
  instance_type = "t2.micro"

  connection {
    type     = "ssh"
    user     = "ec2-user"
    private_key = file("~/.ssh/id_rsa")
    host     = self.public_ip
  }

  provisioner "remote-exec" {
    inline = [
      "sudo apt-get update",
      "sudo apt-get install -y nginx"
    ]
  }
}
```
* Connection block: Specifies how to connect to the remote machine (e.g., via SSH).
* Inline: A list of commands that will run sequentially on the remote instance.

## Null Resource with Provisioners
The null_resource is a resource that has no infrastructure but can use provisioners for orchestration or tasks that don’t directly depend on any other resource. It can be useful to trigger actions when something else changes.

```t
resource "null_resource" "example" {
  provisioner "local-exec" {
    command = "echo 'Hello, World!'"
  }

  triggers = {
    create_time = timestamp()
  }
}
```
In this example:
A null_resource runs a local-exec provisioner that prints "Hello, World!" whenever triggered (in this case, based on the current timestamp).

Provisioners should be used as a last resort. Terraform is declarative, meaning the primary focus is on describing the end state of infrastructure. Provisioners introduce an imperative element, which can make infrastructure harder to manage or track.

Failure Behavior: Provisioners can fail, and the behavior on failure can be controlled using on_failure = continue (by default, Terraform will fail if a provisioner fails).

### Lifecycle of Provisioners
Provisioners can be attached to a resource, and you can specify when they are executed:

#### Creation-time provisioners: Executed when the resource is created.
#### Destruction-time provisioners: Executed when the resource is destroyed (use the when = destroy argument).

Example of a destruction-time provisioner:
```T
provisioner "local-exec" {
  when    = "destroy"
  command = "echo 'Resource is being destroyed'"
}
```