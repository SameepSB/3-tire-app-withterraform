# Getting the DNS of load balancer
output "lb_dns_name" {
  description = "The DNS name of the load balancer"
  value       = "${aws_lb.external-alb.dns_name}"
}

output "rds_endpoint" {
  value = "${aws_db_instance.default.endpoint}"
}

output "demoinstance1_public_IP" {
  value = aws_instance.demoinstance1.public_ip
}
output "demoinstance_public_IP" {  
  value = aws_instance.demoinstance.public_ip
} 

output "elb_dns_name" {
  value       = aws_elb.sample.dns_name
  description = "The domain name of the load balancer"
}

