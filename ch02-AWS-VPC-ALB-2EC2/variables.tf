variable "instance_name" {
  description = "Value of the name tag for the EC2 instance"
  type        = string
  default     = "Ec2-via-tfc"

}


variable "instance_count" {
  description = "Number of EC2 instances"
  default     = 2
}