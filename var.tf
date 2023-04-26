# Defining CIDR Block for VPC
variable "access_key" {}
variable "secret_key" {}

variable "vpc_cidr" {
  default = "10.0.0.0/16"
}
# Defining CIDR Block for 1st Subnet
variable "subnet_cidr" {
  default = "10.0.1.0/24"
}
# Defining CIDR Block for 2nd Subnet
variable "subnet1_cidr" {
  default = "10.0.2.0/24"
}
# Defining CIDR Block for 3rd Subnet
variable "subnet2_cidr" {
  default = "10.0.3.0/24"
}
# Defining CIDR Block for 4th Subnet
variable "subnet3_cidr" {
  default = "10.0.4.0/24"
}
# Defining CIDR Block for 5th Subnet
variable "subnet4_cidr" {
  default = "10.0.5.0/24"
}
# Defining CIDR Block for 6th Subnet
variable "subnet5_cidr" {
  default = "10.0.6.0/24" 
}

variable "AWS_REGION" {
  default = "us-east-1"
}

variable "AMIS" {
  type = map(string)
  default = {
    us-east-1 = "ami-052efd3df9dad4825"
    us-east-2 = "ami-02d1e544b84bf7502"
  }
}

variable "server_port" {
  description = "The port the web server will be listening"
  type        = number
  default     = 80
}

variable "elb_port" {
  description = "The port the elb will be listening"
  type        = number
  default     = 80
}

