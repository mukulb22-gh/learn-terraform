variable "alb_name" {
  description = "Name for the Application Load Balancer"
}

variable "subnet_ids" {
  description = "List of subnet IDs where ALB will be placed"
  type        = list(string)
}

variable "enable_deletion_protection" {
  description = "Enable deletion protection for ALB"
  type        = bool
}

