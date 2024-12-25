resource "aws_instance" "catalogue" {
    ami = "ami-0b4f379183e5706b9"
    instance_type = "t3.medium"
    vpc_security_group_ids = ["sg-01e1a404b2d4535f4"]
    //user_data = file("catalogue.sh")
    tags = {
        Name = "catalogue-dev-ami"
    }

}

resource "null_resource" "catalogue" {
    triggers = {
        instance_id = "i-035179171b36275d5"
    }
    connection {
        type = "ssh"
        user = "centos"
        password = "DevOps321"
        host = "44.206.244.145"
    }
    #copy the file
    provisioner "file" {
        source = "catalogue.sh"
        destination = "/tmp/catalogue.sh"

    }

    provisioner "remote-exec" {
        inline = [
            "sudo chmod +x /tmp/catalogue.sh",
            "sudo sh /tmp/catalogue.sh ${var.app_version} ${var.env}"
        ]
    }
}

output "app_version" {
    value = var.app_version
}