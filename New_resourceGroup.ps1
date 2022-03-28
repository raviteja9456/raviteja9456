[CmdletBinding()]
param(
    [Parameter(Mandatory=$true)][string]$resourceGroupName,
    [Parameter(Mandatory=$true)][string]$rgLocation
)

$ErrorActionPreference = "Stop"
[Console]::ResetColor()
$scriptName = $MyInvocation.MyCommand.Name

Write-Host "================================================="

Write-Host resourcegroup location is $rgLocation
Write-Host resource group name is $resourceGroupName

Write-Host "================================================="


#Checking resourceGroup exits or not. if not exists create a resource group

$resourceGroupStatus = Get-AzResourceGroup -Name $resourceGroupName -ErrorAction SilentlyContinue

if ($resourceGroupStatus -eq $null)
{
  Write-Host resourceGroup $resourceGroupName not exists 

  Write-Host Creating resource group

  New-AzResourceGroup -Name $resourceGroupName -Location $rgLocation
  
}
else {
    write-host resourceGroup $resourceGroupName already exists
}

Write-Output $resourceGroupStatus

# =============================================================================

Write-Host "-----------------------------------------------" 
Write-Host " -- Script finished ($scriptName)"
Write-Host ""