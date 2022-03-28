[CmdletBinding()]
param(
    [Parameter(Mandatory=$true)][string]$resourceGroupName,
    [Parameter(Mandatory=$true)][string]$rgLocation,
    [Parameter(Mandatory=$true)][string]$avsetName
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

$avsetStatus = Get-AzAvailabilitySet -ResourceGroupName $resourceGroupName -Name $avsetName -ErrorAction SilentlyContinue

if ($null -eq $avsetStatus)
{
  Write-Host avset $avsetName not exists 

  Write-Host Creating avset

  New-AzAvailabilitySet -ResourceGroupName $resourceGroupName -Name $avsetName -Location $rgLocation -PlatformUpdateDomainCount 20 -PlatformFaultDomainCount 3 -sku Aligned
  
}
else {
    write-host availabilityset $avsetName already exists
    Write-Output $avsetStatus
}



# =============================================================================

Write-Host "-----------------------------------------------" 
Write-Host " -- Script finished ($scriptName)"
Write-Host ""