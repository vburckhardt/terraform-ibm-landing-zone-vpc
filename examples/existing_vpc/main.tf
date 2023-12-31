##############################################################################
# Resource Group
##############################################################################

module "resource_group" {
  source  = "terraform-ibm-modules/resource-group/ibm"
  version = "1.1.4"
  # if an existing resource group is not set (null) create a new one using prefix
  existing_resource_group_name = var.existing_resource_group_name
}

module "slz_vpc" {
  source              = "../../"
  resource_group_id   = module.resource_group.resource_group_id
  region              = var.region
  create_vpc          = false
  existing_vpc_id     = var.vpc_id
  create_subnets      = false
  existing_subnet_ids = var.subnet_ids
}