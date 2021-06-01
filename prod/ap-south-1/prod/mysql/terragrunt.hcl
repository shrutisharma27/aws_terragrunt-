locals {
 
  environment_vars = read_terragrunt_config(find_in_parent_folders("env.hcl"))

 
  env = local.environment_vars.locals.environment
}


terraform {
  source = "git::git@github.com:shrutisharma27/infrastructure_module.git//RDS?ref=v0.4.0"
}


include {
  path = find_in_parent_folders()
}


inputs = {
  name           = "mysql_${local.env}"
  instance_class = "db.t2.medium"

  allocated_storage = 100
  storage_type      = "standard"

  master_username = "admin"
 
}
