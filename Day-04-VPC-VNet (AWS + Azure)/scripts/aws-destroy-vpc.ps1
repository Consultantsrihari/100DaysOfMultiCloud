<#
Destroy / delete the CloudFormation stack of Day 4 VPC setup.
#>
param(
    [string]$StackName = "day4-vpc-setup"
)

Write-Host "Deleting CloudFormation stack: $StackName..."
aws cloudformation delete-stack --stack-name $StackName

Write-Host "Stack delete initiated. Check CloudFormation console or use 'aws cloudformation describe-stacks' to monitor"