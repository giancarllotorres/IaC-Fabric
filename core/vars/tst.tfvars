env_code         = "tst"
tenant_id       = "$tenant_id "
subscription_id = "$subscription_id"
project          = "$projectInput"
default_location = "$regionInput"
resource_group_tags = {
  "application" = "Terraform Core"
  "environment" = "tst"
  "createdby"   = "$creator_name" #Insert creator name.
  "project"     = "$projectInput" 
  "owner"       = "$owner"  #Insert creator name.
}
service_tags = {
  "application" = "Terraform Core"
  "environment" = "tst"
  "createdby"   = "$creator_name"  #Insert creator name.
}