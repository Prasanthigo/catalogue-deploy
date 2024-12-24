resource "aws_instance" "catalogue" {
    ami = "ami-0b4f379183e5706b9"
    instance_type = "t3.medium"
    vpc_security_group_ids = ["sg-01e1a404b2d4535f4"]
    //user_data = file("catalogue.sh")
    tags = {
        Name = "catalogue-dev-ami"
    }

}