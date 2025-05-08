variable "env_code" {
  type        = string
  description = "Environment Code (e.g. abcd-09)"
}
variable "default_location" {
  type        = string
  description = "Default Azure resource location"
}
variable "resource_group_tags" {
  type        = map(string)
  default     = {}
  description = "Base set of tags to apply to the Azure resource group."
}
variable "service_tags" {
  type        = map(string)
  default     = {}
  description = "Base set of tags to apply to Azure services."
}
variable "subscription_id" {
  type        = string
  description = "Azure subscription ID"
}
variable "project" {
  type        = string
  description = "project Alias"
}
variable "tenant_id" {
  type        = string
  description = "Azure AD tenant ID"
}