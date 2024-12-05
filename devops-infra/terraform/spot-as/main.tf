resource "aws_autoscaling_group" "asg" {
  desired_capacity     = 2
  max_size             = 10
  min_size             = 1
  vpc_zone_identifier  = aws_subnet.public.id

  launch_configuration = aws_launch_configuration.my_launch_config.id
  health_check_type    = "EC2"
  health_check_grace_period = 300

  mixed_instances_policy {
    instances_distribution {
      spot_price        = "0.03"
      on_demand_base_capacity = 1
    }
  }

  tag {
    key                 = "Name"
    value               = "AutoScalingInstance"
    propagate_at_launch = true
  }
}

resource "aws_launch_configuration" "my_launch_config" {
  name          = "launch-config"
  image_id      = "ami-0c55b159cbfafe1f0"
  instance_type = "t3.medium"
}
