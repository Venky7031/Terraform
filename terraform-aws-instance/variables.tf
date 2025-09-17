variable "ami_id" {
    default = "ami-09c813fb71547fc4f"
    type = string
    description = "AMI ID of the instance"  
}

variable "instance_type" {
    type = string
    default = "t3.micro"
    description = "Size of the instance"

    validation {
    condition = contains(["t3.micro", "t3.small", "t3.medium"], var.instance_type)
    error_message = "valid values for instance type: are t3.micro, t3.small, t3.medium"
  }
}

#it is mandatory
variable "sg_ids" {
    type = list  
}

variable "tags" {
      type = map
}