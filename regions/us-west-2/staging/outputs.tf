output "staging_vpc_id" {
  value = module.network.vpc_id
}

output "staging_subnet_ids" {
  value = module.network.subnet_ids
}

output "staging_security_group_ids" {
  value = module.network.security_group_ids
}

output "staging_ec2_instance_id" {
  value = module.ec2.instance_id
}

output "staging_s3_bucket_id" {
  value = module.s3.bucket_id
}

output "staging_lambda_function_name" {
  value = module.lambda.lambda_function_name
}

output "staging_kms_key_arn" {
  value = module.s3.kms_key_arn
}
