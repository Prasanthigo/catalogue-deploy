variable "project_name" {
    default = "roboshop"
}
variable "cidr_block" {
    default ="10.0.0.0/16"
}
variable "env" {
   default = "dev" 
}
variable "common_tags" {
    default = {
        Name = "Roboshop"
        Env = "Dev"
        Terraform = true
    }
}