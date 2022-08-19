module "secret" {
  source = "./secret"
  for_each = {
    for key, value in var.settings : key => value
    if try(value.value, null) == null && try(value.lz_key, null) == null
  }

  name  = each.value.secret_name

  #value = can(each.value.lz_key) && can(each.value.output_key) && (can(each.value.resource_key) || can(each.value.attribute_key)) ?  lookup(lookup(lookup(var.objects[each.value.lz_key], each.value.output_key), try(each.value.resource_key, ""), lookup(var.objects[each.value.lz_key], each.value.output_key)), each.vlaue.attribute_key, null)  : can(each.value.output_key) && (can(each.value.resource_key) || can(each.value.attribute_key)) ? ? lookup(lookup(var.objects[each.value.output_key], try(each.value.resource_key, ""), var.objects[each.value.output_key]), each.value.attribute_key, null) : each.value.value
  value = can(each.value.output_key) && (can(each.value.resource_key) || can(each.value.attribute_key)) ? lookup(lookup(var.objects[each.value.output_key], try(each.value.resource_key, ""), var.objects[each.value.output_key]), each.value.attribute_key, null) : each.value.value
  # for future generations: double lookup because each.value.resource_key is optional
  keyvault_id = var.keyvault.id
}

module "secret_remote" {
  source = "./secret"
  for_each = {
    for key, value in var.settings : key => value
    if try(value.value, null) == null && try(value.lz_key, null) != null
  }

  name  = each.value.secret_name

  value = can(var.remote_objects) && can(each.value.lz_key) && can(each.value.output_key) && can(each.value.resource_key) && can(each.value.attribute_key) ? lookup(lookup(lookup(var.remote_objects[each.value.output_key], each.value.lz_key), each.value.resource_key), each.value.attribute_key, null)  : each.value.value
  # for future generations: double lookup because each.value.resource_key is optional
  keyvault_id = var.keyvault.id
}

module "secret_value" {
  source = "./secret"
  for_each = {
    for key, value in var.settings : key => value
    if try(value.value, null) != null && try(value.value, null) != "" && try(value.value, null) != "dynamic"
  }

  name        = each.value.secret_name
  value       = each.value.value
  keyvault_id = var.keyvault.id
}

module "secret_immutable" {
  source = "./secret_immutable"
  for_each = {
    for key, value in var.settings : key => value
    if try(value.value, null) == ""
  }

  name  = each.value.secret_name
  value = can(each.value.output_key) && (can(each.value.resource_key) || can(each.value.attribute_key)) ? lookup(lookup(var.objects[each.value.output_key], try(each.value.resource_key, ""), var.objects[each.value.output_key]), each.value.attribute_key, null) : each.value.value
  # for future generations: double lookup because each.value.resource_key is optional
  keyvault_id = var.keyvault.id
}

module "secret_dynamic" {
  source = "./secret_dynamic"
  for_each = {
    for key, value in var.settings : key => value
    if try(value.value, null) == "dynamic"
  }

  name        = each.value.secret_name
  value       = each.value.value
  keyvault_id = var.keyvault.id
  config      = each.value.config
}
