module "module_from_ec2_module"{
    source= "./modules/ec2_module"
    instance_type= var.instance_type
    key_name= var.key_name

}

module"module_from_s3"{
    source= "./modules/s3_module"
    bucket_name= var.bucket_name
    sse_algorithm= var.sse_algorithm

}

module "module_from_dynamodb" {
    source= "./modules/dynamodb_module"
    dynamodb_name= var.dynamodb_name
    hash_key= var.hash_key

}