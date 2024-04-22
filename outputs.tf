output "qa_vpc_id" {
  value = module.network.vpc_id
}

output "qa_subnet_ids" {
  value = module.network.subnet_ids
}

output "qa_security_group_ids" {
  value = module.network.security_group_ids
}

output "qa_ec2_instance_id" {
  value = module.ec2.instance_id
}

output "qa_s3_bucket_id" {
  value = module.s3.bucket_id
}

output "qa_lambda_function_name" {
  value = module.lambda.lambda_function_name
}

output "qa_kms_key_arn" {
  value = module.s3.kms_key_arn
}
