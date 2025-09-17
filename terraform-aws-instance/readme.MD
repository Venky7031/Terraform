# AWS EC2 instance
you can create EC2 instance in joindevops by using this module

## Inputs
* ami_id(optional) - AMI ID that needs to be used by instance. Default is DevOps practice is ami-09c813fb71547fc4f
* instance_type (optional) - Instance type is used by instance. Valid values are t3.micro, t3.small, t3.medium. Default is t3.micro
* sg_ids (required) - A list of security Group IDs to attach instance
* tags (required) - A map of tags to be assosiated with instances

## Outpus
* public_ip - public IP of the instance created
* private_ip - private IP of the instance created
* instance_id - instace ID of the instance created