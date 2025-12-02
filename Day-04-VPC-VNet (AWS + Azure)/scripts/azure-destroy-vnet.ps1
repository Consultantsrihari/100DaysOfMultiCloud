<#
Destroy VNet resource group for Day 4 demo. This will remove all resources in the resource group. Use with caution.
#>
param(
    [string]$ResourceGroup = "day4-rg"
)

Write-Host "Deleting resource group: $ResourceGroup (this will remove all resources in the group)"
az group delete --name $ResourceGroup --yes --no-wait

Write-Host "Request sent to delete resource group. Monitor with 'az group show --name $ResourceGroup' or in the portal."