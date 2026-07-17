output "alb_dns_name" {
  value       = aws_lb.external.dns_name
  description = "Public URL to access the Application Load Balancer"
}

output "vpc_id" {
  value       = aws_vpc.main.id
  description = "The ID of the production VPC"
}
