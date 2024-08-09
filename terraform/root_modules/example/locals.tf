# within this files is the locals block where local variables can be built from expressions and later referred to by local.name
# https://developer.hashicorp.com/terraform/language/values/locals

locals {
    vpc_network_name = "terraform-example-network-${var.env}"
}
