module "create_pem" {
    source = "./modules/create_pem"
    key_name = var.root_key_name
    key_path = var.root_key_path
}

##module "create_sg" {
 ##   source = "./modules/create_sg"
  ##  sg_name = var.root_sg_name
##}

module "ec2_module" {
    source = "./modules/ec2_module"
    instance_type = var.root_instance_type
    key_name = module.create_pem.pem_key    #pem key is output of create_pem module,pem_key is defined in o/p of create_pem child module
   # ec2_sg_id = module.create_sg.sg_id
}

module "file_provisioner" {
    source = "./modules/file_provisioner"
    ec2_public_ip = module.ec2_module.ec2_public_ip_address ## want a value from one module then that value should be in o/p of that module to use it in another module
    ec2_user = var.root_ec2_user
    ec2_pem = var.root_key_path
    source_path = var.root_source_path
    destination_path = var.root_destination_path
}

module "remote_exec_inline_command" {
    source = "./modules/remote_exec"
    ec2_public_ip = module.ec2_module.ec2_public_ip_address  ##ec2_public_ip_address is declared in output.tf of ec2_module
    ec2_user = var.root_ec2_user
    ec2_pem = var.root_key_path
    inline_commands = var.root_inline_commands
}

module "file_provisione_copy_script" {
    source = "./modules/file_provisioner"
    ec2_public_ip = module.ec2_module.ec2_public_ip_address
    ec2_user = var.root_ec2_user
    ec2_pem = var.root_key_path
    source_path = var.root_source_path_copy_script
    destination_path = var.root_destination_path_copy_script
}  

module "remote_exec_script" {
    source = "./modules/remote_exec"
    ec2_public_ip = module.ec2_module.ec2_public_ip_address
    ec2_user = var.root_ec2_user
    ec2_pem = var.root_key_path
    inline_commands = var.root_inline_script
}