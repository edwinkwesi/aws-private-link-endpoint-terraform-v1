# resource "aws_vpc_endpoint" "vpce" {
#   vpc_id              = aws_vpc.service-provider.id
# #   service_name        = ""
#   vpc_endpoint_type   = "Interface"
#   security_group_ids  = concat(try([aws_security_group.sg[each.key].id], []), lookup(each.value, "security_group_ids", []))
#   subnet_ids          = lookup(each.value, "subnet_ids", [])
#   private_dns_enabled = lookup(each.value, "private_dns_enabled", false)

#   tags = merge(
#     {
#       "Name" = format(var.naming_pattern, "vpce", format("%s-endpoint", each.key))
#     },
#     lookup(each.value, "tags", []),
#   )
# }