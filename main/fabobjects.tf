# Raw data Lakehouse resource with enabled schemas
resource "fabric_lakehouse" "bronze" {
  display_name = "${var.env_code}_${var.project}_bronze_lakehouse"
  description  = "Bronze data lakehouse"
  workspace_id  = data.fabric_workspace.workspace_data.id
  configuration = {
    enable_schemas = true
  }
  depends_on   = [data.fabric_workspace.workspace_data]
}

# Processed data Lakehouse resource with enabled schemas
resource "fabric_lakehouse" "silver" {
  display_name = "${var.env_code}_${var.project}_silver_lakehouse"
  description  = "Silver data lakehouse"
  workspace_id  = data.fabric_workspace.workspace_data.id
  configuration = {
    enable_schemas = true
  }
  depends_on   = [data.fabric_workspace.workspace_data]
}

# Processed data Lakehouse resource with enabled schemas
resource "fabric_lakehouse" "gold" {
  display_name = "${var.env_code}_${var.project}_gold_lakehouse"
  description  = "Gold data lakehouse"
  workspace_id  = data.fabric_workspace.workspace_data.id
  configuration = {
    enable_schemas = true
  }
  depends_on   = [data.fabric_workspace.workspace_data]
}

# Example 1 - Notebook without definition
resource "fabric_notebook" "ETL" {
  display_name = "${var.env_code}_${var.project}_ETL_Notebook"
  workspace_id  = data.fabric_workspace.workspace_data.id
  depends_on   = [data.fabric_workspace.workspace_data]
}