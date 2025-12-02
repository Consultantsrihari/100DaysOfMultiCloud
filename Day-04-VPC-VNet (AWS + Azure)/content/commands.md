# Day 4 — Hands-on commands

## AWS CLI quick commands (examples)

Create the CloudFormation stack (from the folder root):

```powershell
aws cloudformation deploy --stack-name day4-vpc-setup --template-file ./cloudformation/vpc-setup.yml --capabilities CAPABILITY_NAMED_IAM
```

Describe stack outputs:

```powershell
aws cloudformation describe-stacks --stack-name day4-vpc-setup --query "Stacks[0].Outputs"
```

Delete the stack (cleanup):

```powershell
aws cloudformation delete-stack --stack-name day4-vpc-setup
```

## Azure CLI quick commands

Create resource group and VNet:

```powershell
az group create --name day4-rg --location eastus
az network vnet create --resource-group day4-rg --name day4-vnet --address-prefix 10.1.0.0/16 --subnet-name public-subnet --subnet-prefix 10.1.1.0/24
az network vnet subnet create --resource-group day4-rg --vnet-name day4-vnet --name private-subnet --address-prefix 10.1.2.0/24
```

Create NAT gateway and assign it:

```powershell
az network public-ip create --resource-group day4-rg --name day4-nat-pip --sku Standard --allocation-method Static
az network nat gateway create --resource-group day4-rg --name day4-nat --public-ip-addresses day4-nat-pip --sku Standard
az network vnet subnet update --resource-group day4-rg --vnet-name day4-vnet --name private-subnet --nat-gateway day4-nat
```

Delete resource group (cleanup):

```powershell
az group delete --name day4-rg --yes --no-wait
```

Use these snippets as guidance for the hands-on demo and adapt them as needed for your region and accounts.
