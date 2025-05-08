env_code         = "prd"
tenant_id       = "$tenant_id "
subscription_id = "$subscription_id"
project          = "$projectInput"
default_location = "$regionInput"
resource_group_tags = {
  "application" = "Terraform Core"
  "environment" = "prd"
  "createdby"   = "$creator_name" #Insert creator name.
  "project"     = "$projectInput" 
  "owner"       = "$owner"  #Insert creator name.
}
service_tags = {
  "application" = "Terraform Core"
  "environment" = "prd"
  "createdby"   = "$creator_name"  #Insert creator name.
}