# Input for EC2 Instance
variable "ami_id" {
  description = "The AMI ID to use for the instance"
  type        = string
}

variable "instance_type" {
  description = "Type of EC2 instance"
  type        = string
  default     = "t2.micro"
}

variable "instance_name" {
  description = "Name tag for the EC2 instance"
  type        = string
}

# Input for S3 Bucket
variable "bucket_name" {
  description = "Name of the S3 bucket"
  type        = string
}
