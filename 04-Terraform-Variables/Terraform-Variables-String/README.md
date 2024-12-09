In **Terraform**, **input variables** are a way to customize your infrastructure deployments by passing dynamic values into your Terraform configurations. They make your configuration flexible and reusable, allowing you to change values without altering the core logic of the code.

### Key Concepts of Input Variables in Terraform

1. **Declaring Input Variables**:
   - You declare variables using the `variable` block. You can set default values, descriptions, and types for these variables.
   
   **Example**:
   ```t
   variable "instance_type" {
     description = "The EC2 instance type"
     type        = string
     default     = "t2.micro"
   }
   ```
   In this example, `instance_type` is an input variable with a default value of `t2.micro`.

2. **Variable Types**:
   - **String**: A single value (e.g., `"t2.micro"`).
   - **Number**: A numeric value (e.g., `8080`).
   - **Bool**: A boolean value (`true` or `false`).
   - **List**: An ordered collection of values (e.g., `["t2.micro", "t2.small"]`).
   - **Map**: A collection of key-value pairs (e.g., `{name = "web-server", size = "t2.micro"}`).
   
   **Example**:
   ```t
   variable "instance_count" {
     type = number
   }

   variable "allowed_ips" {
     type = list(string)
   }

   variable "tags" {
     type = map(string)
   }
   ```

3. **Using Variables**:
   - You reference variables inside your Terraform configuration using the `var` prefix.
   
   **Example**:
   ```t
   resource "aws_instance" "example" {
     ami           = "ami-12345678"
     instance_type = var.instance_type
     count         = var.instance_count
   }
   ```

4. **Setting Variable Values**:
   There are multiple ways to set the values for input variables:
   
   - **Default Values**: If you provide a default value, the variable will use it unless explicitly overridden.
   - **Command-Line Flags**: You can specify a variable’s value at runtime using `-var` in the CLI:
     ```t
     terraform apply -var="instance_type=t2.small"
     ```
   - **`.tfvars` Files**: You can define variables in a separate file (e.g., `terraform.tfvars`, `production.tfvars`) and load them with the `-var-file` flag.
     ```t
     instance_type = "t2.large"
     instance_count = 2
     ```
     Load it with:
     ```t
     terraform apply -var-file="production.tfvars"
     ```
   - **Environment Variables**: You can set variables using environment variables with the `TF_VAR_` prefix:
     ```t
     export TF_VAR_instance_type="t2.medium"
     ```

5. **Validation**:
   - In newer versions of Terraform, you can add custom validation rules for variables to ensure they meet certain criteria.

   **Example**:
   ```t
   variable "instance_type" {
     type = string

     validation {
       condition     = contains(["t2.micro", "t2.small"], var.instance_type)
       error_message = "The instance type must be either 't2.micro' or 't2.small'."
     }
   }
   ```

6. **Descriptions**:
   - Adding descriptions to variables helps document their purpose. This is particularly useful for teams or large configurations.

   **Example**:
   ```t
   variable "vpc_id" {
     description = "The ID of the VPC where the instance will be created"
     type        = string
   }
   ```

7. **Sensitive Variables**:
   - You can mark variables as sensitive to prevent them from being displayed in logs or outputs.
   
   **Example**:
   ```t
   variable "db_password" {
     type      = string
     sensitive = true
   }
   ```

### Example of Input Variables in a Complete Terraform Configuration

```t
# Variable declarations
variable "instance_type" {
  description = "The EC2 instance type"
  type        = string
  default     = "t2.micro"
}

variable "instance_count" {
  description = "Number of instances to create"
  type        = number
  default     = 1
}

# Using the variables
resource "aws_instance" "example" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = var.instance_type
  count         = var.instance_count
}
```

### Benefits of Using Input Variables

- **Reusability**: Input variables make your Terraform code reusable across different environments (e.g., dev, staging, production) by allowing different values to be passed in.
- **Separation of Concerns**: You can keep the variable definitions and values separate from the main infrastructure configuration.
- **Consistency**: Variables help enforce consistency across the infrastructure by defining reusable values.

### Summary
Terraform input variables allow you to define dynamic infrastructure configurations that can adapt to various environments or use cases. They are crucial for creating flexible, reusable, and modular Terraform code. You can define them, pass them in different ways, and ensure they meet certain conditions using validation.