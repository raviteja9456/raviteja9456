[CmdletBinding()]
param(
    [Parameter(Mandatory=$true)][string]$resourceGroupName,
    [Parameter(Mandatory=$true)][string]$rgLocation,
    [Parameter(Mandatory=$true)][string]$avsetName,
    [Parameter(Mandatory=$true)][string]$vnetName,
    [Parameter(Mandatory=$true)][string]$vmName1,
    [Parameter(Mandatory=$true)][string]$vmName2,
    [Parameter(Mandatory=$true)][string]$vmSize,
    [Parameter(Mandatory=$true)][string]$subnetName,
    [Parameter(Mandatory=$true)][string]$userName,
    [Parameter(Mandatory=$true)][SecureString]$password,
    [Parameter(Mandatory=$true)][string]$nsgName,
    [Parameter(Mandatory=$true)][string]$osImage

)

$ErrorActionPreference = "Stop"
[Console]::ResetColor()
$scriptName = $MyInvocation.MyCommand.Name

Write-Host "================================================="

Write-Host resourcegroup location is $rgLocation
Write-Host resource group name is $resourceGroupName
Write-Host availability set name is $avsetName

Write-Host "================================================="


#Checking avset exits or not. if not exists create a avset





  Write-Host vm $vmName1 not exists 

  Write-Host Creating vm

  az vm create --resource-group $resourceGroupName --name $vmName1 --image $osImage --vnet-name $vnetName --subnet $subnetName --admin-username $userName --admin-password $password --size $vmSize --nsg $nsgName --availability-set $avsetName
  az vm create --resource-group $resourceGroupName --name $vmName2 --image $osImage --vnet-name $vnetName --subnet $subnetName --admin-username $userName --admin-password $password --size $vmSize --nsg $nsgName --availability-set $avsetName  


# =============================================================================

Write-Host "-----------------------------------------------" 
Write-Host " -- Script finished ($scriptName)"
Write-Host ""