# Create Fabric Workspace using real UUID
resource "fabric_workspace" "workspace" {
  display_name = "${var.env_code}-${var.project}-workspace"
  description  = "Fabric Workspace"
  capacity_id = var.capacity_id
  identity = {
    type = "SystemAssigned"
  }
}

# Get the workspace back for later use
data "fabric_workspace" "workspace_data" {
  display_name = "${var.env_code}-${var.project}-workspace"
  depends_on   = [fabric_workspace.workspace]
}


# Uncomment this section in order to add Azure AD Groups to access the created workspace.
# # Assign Fabric Roles for Users or Groups
# resource "fabric_workspace_role_assignment" "admins" {
#   workspace_id  = data.fabric_workspace.workspace_data.id
#   principal = {
#     id   = ""
#     type = "Group"
#   }
#   role = "Admin"
# }