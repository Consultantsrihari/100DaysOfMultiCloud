<#
Azure PowerShell (az CLI) script for quick VNet creation and NAT gateway setup for Day 4 demo.
Ensure az CLI is installed and you have logged in `az login`. Use correct subscription.
#>
param(
    [string]$ResourceGroup = "day4-rg",
    [string]$Location = "eastus",
    [string]$VnetName = "day4-vnet",
    [string]$PublicSubnet = "public-subnet",
    [string]$PrivateSubnet = "private-subnet",
    [string]$PublicIpName = "day4-nat-pip",
    [string]$NatName = "day4-nat"
)

# Create resource group
az group create --name $ResourceGroup --location $Location

# Create VNet with public subnet
az network vnet create --resource-group $ResourceGroup --name $VnetName --address-prefix 10.1.0.0/16 --subnet-name $PublicSubnet --subnet-prefix 10.1.1.0/24

# Create private subnet
az network vnet subnet create --resource-group $ResourceGroup --vnet-name $VnetName --name $PrivateSubnet --address-prefix 10.1.2.0/24

# Create public IP and NAT gateway for outbound internet access for private subnet
az network public-ip create --resource-group $ResourceGroup --name $PublicIpName --sku Standard --allocation-method Static
az network nat gateway create --resource-group $ResourceGroup --name $NatName --public-ip-addresses $PublicIpName --sku Standard --idle-timeout 10

# Associate NAT gateway with the private subnet
az network vnet subnet update --resource-group $ResourceGroup --vnet-name $VnetName --name $PrivateSubnet --nat-gateway $NatName

Write-Host "VNet and NAT gateway created. Check Azure portal or 'az network' commands to verify resources."