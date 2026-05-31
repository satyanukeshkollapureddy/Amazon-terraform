variable "ami" {
  description = "AMI ID of Amazon Linux"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
}

variable "key_name" {
  description = "EC2 key pair name"
  type        = string
}

variable "instance_name" {
  description = "EC2 instance name"
  type        = string
}

variable "root_ebs_volume" {
  description = "Root EBS volume size in GB"
  type        = number
}
