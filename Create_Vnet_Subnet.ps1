[CmdletBinding()]
param(
    [Parameter(Mandatory=$true)][string]$resourceGroupName,
    [Parameter(Mandatory=$true)][string]$rgLocation,
    [Parameter(Mandatory=$true)][string]$vnetName,
    [Parameter(Mandatory=$true)][string]$vnet_iprange,
    [Parameter(Mandatory=$true)][string]$subnetName,
    [Parameter(Mandatory=$true)][string]$sub_iprange
)

$ErrorActionPreference = "Stop"
[Console]::ResetColor()
$scriptName = $MyInvocation.MyCommand.Name

Write-Host "================================================="

Write-Host resourcegroup location is $rgLocation
Write-Host resource group name is $resourceGroupName
Write-Host availability set name is $vnetName
Write-Host availability set name is $vnet_iprange
Write-Host availability set name is $subnetName
Write-Host availability set name is $sub_iprange

Write-Host "================================================="


#Checking vnet exits or not. if not exists create a vnet

$vnetStatus = Get-AzVirtualNetwork -Name $vnetName -ResourceGroupName $resourceGroupName -ErrorAction SilentlyContinue

if ($null -eq $vnetStatus)
{
  Write-Host vnet $vnetName not exists 

  Write-Host Creating vnet and subnet
  $subnet=New-AzVirtualNetworkSubnetConfig -Name $subnetName -AddressPrefix $sub_iprange
  New-AzVirtualNetwork -Name $vnetName -ResourceGroupName $resourceGroupName -Location $rgLocation -AddressPrefix $vnet_iprange -Subnet $subnet

  
  
}
else {
    write-host availabilityset $vnetName already exists
    Write-Output $vnetStatus
}



# =============================================================================

Write-Host "-----------------------------------------------" 
Write-Host " -- Script finished ($scriptName)"
Write-Host ""