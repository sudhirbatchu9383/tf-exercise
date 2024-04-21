output "vpc_id" {
  description = "The ID of the VPC"
  value       = aws_vpc.main.id
}

output "subnet_ids" {
  description = "The IDs of the subnets"
  value       = [for subnet in aws_subnet.subnets : subnet.id]
}

output "security_group_ids" {
  description = "The IDs of the security groups"
  value       = [for sg in aws_security_group.sgs : sg.id]
}
