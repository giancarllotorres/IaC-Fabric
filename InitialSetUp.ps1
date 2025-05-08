# Define paths to all tfvars and pipeline files
$tfvarsPaths = @(
    ".\core\vars\tst.tfvars"
    ".\core\vars\prd.tfvars"
    ".\main\vars\prd.tfvars"
    ".\main\vars\tst.tfvars"
    ".\main\backend\prd.backend.tfvars"
    ".\main\backend\tst.backend.tfvars"
    ".\pipelines\pipeline-core.yml"
    ".\pipelines\pipeline-main.yml"
)

# Read user input once (applied to all files)
$creator_name    	= Read-Host "Creator name (Your name, or the object admin.)"
$owner           	= Read-Host "Object Owner (Company name, etc.)"
$subscription_id 	= Read-Host "Enter your Azure subscription ID"
$capacity_id     	= Read-Host "Enter capacity ID" 
$tenant_id       	= Read-Host "Enter your Azure tenant ID"
$regionInput     	= Read-Host "Enter your Azure resource region (e.g., eastus, westeurope)"
$projectInput    	= Read-Host "Enter project name"
$tst_service_connection = Read-Host "Enter your test environment Service Connection (Service Principal)"
$prd_service_connection = Read-Host "Enter your production environment Service Connection (Service Principal)"


# Define replacements - keys must match EXACTLY what's in the tfvars file (without the $)
$replacements = @{
    "projectInput"      	= $projectInput
    "regionInput"       	= $regionInput
    "creator_name"      	= $creator_name
    "owner"             	= $owner
    "tenant_id"         	= $tenant_id
    "subscription_id"   	= $subscription_id
    "capacity_id"       	= $capacity_id
    "tst_service_connection"	= $tst_service_connection
    "prd_service_connection"	= $prd_service_connection
}

# Process each file in the list
foreach ($tfvarsPath in $tfvarsPaths) {
    # Check if the file exists
    if (-not (Test-Path $tfvarsPath)) {
        Write-Host "File $tfvarsPath not found. Skipping..." -ForegroundColor Yellow
        continue
    }

    # Load content
    $content = Get-Content $tfvarsPath -Raw

    # Replace all placeholders
    foreach ($key in $replacements.Keys) {
        $pattern = [regex]::Escape("`$$key")
        $content = $content -replace $pattern, $replacements[$key]
    }

    # Save changes
    $content | Set-Content $tfvarsPath -Encoding UTF8
    Write-Host "Updated $tfvarsPath successfully." -ForegroundColor Green
}

Read-Host "Press Enter to exit..."