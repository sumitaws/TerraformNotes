## Null_Reosource
The null_resource in Terraform is a resource that does not create any real infrastructure but is useful for running provisioners and defining dependencies between resources. It acts as a placeholder for triggers or auxiliary actions in your Terraform configurations.

### Features of null_resource:
Provisioners: You can attach provisioners like local-exec or remote-exec to a null_resource. It enables you to execute commands or scripts without requiring an actual infrastructure resource.
Triggers: The triggers argument allows you to define a set of values that, when changed, cause the null_resource to be re-created. This is useful for controlling when provisioners are executed.

### Use Cases of null_resource:
1.) Triggering Actions:
Run scripts or commands that are not directly tied to any resource creation.
Example: Notify a third-party system after completing infrastructure deployment.

2.) Dependency Enforcement:
Force dependencies between unrelated resources.
Example: Ensure resource A is created before executing a script related to resource B.

3.) Custom Automation:
Automate non-infrastructure tasks.
Example: Clean up temporary files or trigger CI/CD workflows.
Testing and Prototyping:

Test provisioners or prototype scripts in Terraform without creating actual resources.
