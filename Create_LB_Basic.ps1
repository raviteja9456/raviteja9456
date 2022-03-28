[CmdletBinding()]
param(
    [Parameter(Mandatory=$true)][string]$resourceGroupName,
    [Parameter(Mandatory=$true)][string]$lbName
)


az network lb create -g $resourceGroupName -n $lbName --sku Basic