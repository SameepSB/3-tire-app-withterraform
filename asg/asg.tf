
data "aws_availability_zones" "all" {}

resource "aws_launch_configuration" "asg-launch-config-sample" {
  image_id          = "ami-04b7041b4e1823120"
  instance_type = "t2.nano"
  security_groups = ["${aws_security_group.demosg.id}"]
  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_autoscaling_group" "asg-sample" {
  launch_configuration = aws_launch_configuration.asg-launch-config-sample.id
  vpc_zone_identifier       =[aws_subnet.public-subnet-1.id, aws_subnet.public-subnet-2.id]
  min_size = 2
  max_size = 5

  load_balancers    = [aws_elb.sample.name]
  health_check_type = "ELB"

  tag {
    key                 = "Name"
    value               = "terraform-asg-sample"
    propagate_at_launch = true
  }
}



