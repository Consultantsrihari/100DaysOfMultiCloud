<#
Simple PowerShell script to deploy AWS CloudFormation for Day 4 VPC setup.
Ensure AWS CLI v2 is installed and `aws configure` is done with proper credentials and region.
#>

param(
    [string]$StackName = "day4-vpc-setup",
    [string]$TemplateFile = "../cloudformation/vpc-setup.yml"
)

Set-Location -Path (Split-Path -Parent $MyInvocation.MyCommand.Path)

Write-Host "Deploying CloudFormation stack: $StackName..."

aws cloudformation deploy --stack-name $StackName --template-file $TemplateFile --capabilities CAPABILITY_NAMED_IAM

Write-Host "CloudFormation deploy command completed. Use AWS Console or 'aws cloudformation describe-stacks' to verify outputs."