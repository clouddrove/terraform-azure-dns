## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| a\_records | List of a records to be added in azure dns zone. | <pre>list(object({<br>    name    = string<br>    ttl     = number<br>    records = list(string)<br>  }))</pre> | `[]` | no |
| cname\_records | List of cname records | <pre>list(object({<br>    name   = string<br>    ttl    = number<br>    record = string<br>  }))</pre> | `[]` | no |
| dns\_zone\_names | The public dns zone to be created for internal vnet resolution | `string` | `null` | no |
| enabled | n/a | `bool` | `true` | no |
| enabled\_dns | n/a | `bool` | `true` | no |
| environment | Environment (e.g. `prod`, `dev`, `staging`). | `string` | `""` | no |
| label\_order | Label order, e.g. sequence of application name and environment `name`,`environment`,'attribute' [`webserver`,`qa`,`devops`,`public`,] . | `list(string)` | <pre>[<br>  "name",<br>  "environment"<br>]</pre> | no |
| managedby | ManagedBy, eg ''. | `string` | `""` | no |
| name | Name  (e.g. `app` or `cluster`). | `string` | `""` | no |
| ns\_records | List of ns records | <pre>list(object({<br>    name    = string,      #(Required) The name of the DNS NS Record. Changing this forces a new resource to be created.<br>    ttl     = number,      # (Required) The Time To Live (TTL) of the DNS record in seconds.<br>    records = list(string) #(Required) A list of values that make up the NS record.<br>  }))</pre> | `[]` | no |
| private\_dns | n/a | `bool` | `false` | no |
| private\_dns\_zone\_name | The private dns zone to be created for internal vnet resolution | `string` | `null` | no |
| private\_registration\_enabled | Is auto-registration of virtual machine records in the virtual network in the Private DNS zone enabled? | `bool` | `true` | no |
| repository | Terraform current module repo | `string` | `""` | no |
| resource\_group\_name | The name of the resource group where the Azure DNS resides | `string` | `""` | no |
| soa\_record | Customize details about the root block device of the instance. See Block Devices below for details. | `list(object({}))` | `[]` | no |
| soa\_record\_private\_dns | Customize details about the root block device of the instance. See Block Devices below for details. | `list(object({}))` | `[]` | no |
| virtual\_network\_id | The name of the virtual network | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| dns\_a\_record\_fqdn | The FQDN of the DNS A Record. |
| dns\_a\_record\_id | The DNS A Record ID. |
| dns\_cname\_record\_fqdn | The FQDN of the DNS CNAME Record. |
| dns\_cname\_record\_id | The DNS CNAME Record ID. |
| dns\_ns\_record\_fqdn | The FQDN of the DNS NS Record. |
| dns\_ns\_record\_id | The DNS NS Record ID. |
| dns\_zone\_id | The DNS Zone ID. |
| dns\_zone\_max\_number\_of\_record\_sets | Maximum number of Records in the zone. Defaults to 1000. |
| dns\_zone\_name\_servers | A list of values that make up the NS record for the zone. |
| dns\_zone\_number\_of\_record\_sets | The number of records already in the zone. |
| private\_dns\_zone\_id | The Private DNS Zone ID. |
| private\_dns\_zone\_max\_number\_of\_record\_sets | The maximum number of record sets that can be created in this Private DNS zone. |
| private\_dns\_zone\_max\_number\_of\_virtual\_network\_links | The maximum number of virtual networks that can be linked to this Private DNS zone. |
| private\_dns\_zone\_max\_number\_of\_virtual\_network\_links\_with\_registration | The maximum number of virtual networks that can be linked to this Private DNS zone with registration enabled. |
| private\_dns\_zone\_number\_of\_record\_sets | The current number of record sets in this Private DNS zone. |
| private\_dns\_zone\_virtual\_network\_link\_id | The ID of the Private DNS Zone Virtual Network Link. |
