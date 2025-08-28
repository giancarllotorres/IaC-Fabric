# Microsoft Fabric IaC Deployment - Infrastructure as Code (IaC)

This project contains Infrastructure as Code (IaC) assets used to deploy and manage both Azure resources and Microsoft Fabric objects for the **Microsoft Fabric IaC Deployment** initiative. The deployment process is fully automated using CI/CD pipelines defined via YAML, enabling repeatable, scalable, and consistent infrastructure provisioning.

---

## ⚙️ Initial Setup

Before using the IaC project or running any pipelines, make sure to execute the initial PowerShell setup script:

```powershell
./InitialSetUp.ps1
```

This script must be run with the appropriate **project-specific data**, as it dynamically updates variable values across the project files to ensure consistency and correctness during deployment.

> ❗ Failure to run this script before deployment may result in incorrect configuration or failed provisioning.

---

## 📁 Project Structure

The repository is organized into the following main folders:

### `core/`

This folder contains Terraform configurations responsible for the initial setup, or "genesis," of the infrastructure. It primarily defines and provisions the **Terraform backend**, which will host the state files required for managing infrastructure consistently over time.

### `main/`

This folder includes IaC definitions for:
- Microsoft Fabric objects
- Azure infrastructure components built on top of the core setup

These configurations assume that the core backend has already been provisioned and is ready for use.

### `pipeline/`

YAML files in this folder define the CI/CD pipelines that automate the entire infrastructure deployment lifecycle. The pipeline is structured as follows:

1. **Core Pipeline** - Initializes the infrastructure by sourcing the `core/` folder to create the Terraform backend.
2. **Main Pipeline** - Executes after the Core pipeline and deploys Azure and Fabric resources using the configurations from the `main/` folder.

---

## 🚀 Deployment Flow

1. **Run Initial Setup Script:**
   - Execute `InitialSetUp.ps1` with the appropriate inputs.

2. **Trigger the Master Pipeline:**
   - This orchestrates both the Core and Main pipelines sequentially.
   - It sets up the Terraform backend and then deploys Azure and Fabric resources.

> ℹ️ You can still run the Core and Main pipelines individually if needed, but it's not required.

---

## 🧰 Prerequisites

- [Terraform](https://www.terraform.io/)
- Azure Subscription with appropriate permissions
- Azure DevOps or GitHub Actions for CI/CD execution
- Access to Microsoft Fabric if deploying Fabric resources
- PowerShell (to run the `InitialSetUp.ps1` script)

---

## 📝 Notes

- All infrastructure changes must be tracked through version control.
- Ensure environment variables and secrets are securely managed via pipeline settings or secret managers.
- Review the CI/CD logs for errors or drift detection after deployment.


---
