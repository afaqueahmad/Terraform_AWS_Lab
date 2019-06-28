variable "web-server-region" {}
variable "aws_key_name" {}
variable "count" {}
variable "prefix" {}


provider "aws" {
version = "1.0"
        region = "${var.web-server-region}"
        shared_credentials_file = "/root/terrademo/credentials"
}

        resource "aws_vpc" "example_vpc" {
                cidr_block = "${var.vpc_cidr}"


}
        resource "aws_subnet" "example_subnet" {
        vpc_id = "${aws_vpc.example_vpc.id}"
        count = 2
        cidr_block = "${element(var.web-server-subnet,count.index)}"
        availability_zone = "${element(var.azs1,count.index)}"
}

        resource "aws_security_group" "example_sg" {
        vpc_id = "${aws_vpc.example_vpc.id}"
        name = "terraform_sg"

        ingress {
        from_port = 443
        to_port = 443
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]

}

        egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]

}

}
 resource "aws_security_group" "elb_sg" {
        name = "terraform_elb_sg"
        vpc_id = "${aws_vpc.example_vpc.id}"

        ingress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]

}

        egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
}
}

        resource "aws_internet_gateway" "gw" {
        vpc_id = "${aws_vpc.example_vpc.id}"

        tags {
        Name   = "example-IGW"
  }
}

resource "aws_instance" "web_server" {
        ami = "ami-024a64a6685d05041"
        vpc_security_group_ids = ["${aws_security_group.example_sg.id}"]
        instance_type = "t2.micro"
        subnet_id = "${element(aws_subnet.example_subnet.*.id,count.index)}"
        associate_public_ip_address = true
        key_name = "${var.aws_key_name}"
        count = "${var.count}"

        tags = {
                Name = "terraform-instance-${format("%02d",count.index)}"
}
}

        resource "aws_launch_configuration" "example_lc" {
        image_id = "ami-024a64a6685d05041"
        instance_type = "t2.micro"
 security_groups = ["${aws_security_group.example_sg.id}"]
        key_name =  "${var.aws_key_name}"
        lifecycle {
                create_before_destroy = true
        }
}

        resource "aws_autoscaling_group" "example_ag" {
        launch_configuration = "${aws_launch_configuration.example_lc.id}"
        vpc_zone_identifier  = ["${aws_subnet.example_subnet.*.id}"]
        min_size = 2
        max_size = 3
        load_balancers = ["${aws_elb.example_elb.name}"]
        health_check_type = "ELB"
        tag {
                key = "Name"
                value = "terraform_asg"
                propagate_at_launch = true
}
}


        resource "aws_elb" "example_elb" {
        name = "terraform-example-asg"
        security_groups = ["${aws_security_group.elb_sg.id}"]
        subnets = ["${aws_subnet.example_subnet.*.id}"]
        health_check {
                healthy_threshold = 2
                unhealthy_threshold = 2
                timeout = 3
                interval = 30
                target = "HTTP:8080/"
}
        listener {
        lb_port = 80
        lb_protocol = "http"
        instance_port = "8080"
        instance_protocol = "http"
}
}
