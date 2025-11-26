# Create IAM resources for Day 1 - AWS IAM
# Requires: aws CLI configured, PowerShell
# Use: Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser -Force
# Then: .\create-iam.ps1

param(
  [switch]$CreateLoginProfile,
  [string]$Password
)

function Check-AwsCli {
  try {
    $ver = & aws --version 2>&1
    Write-Host "AWS CLI available: $ver"
  } catch {
    Write-Error "aws CLI not found. Install AWS CLI v2 and configure credentials before running."
    exit 1
  }
}

Check-AwsCli

# Defaults
$GroupName = 'Developers'
$UserName = 'john.developer'
$RoleName = 'EC2-S3ReadRole'
$InstanceProfileName = 'EC2S3ReadRoleInstanceProfile'
$PolicyArn = 'arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess'

# Create Group
Write-Host "Creating IAM Group: $GroupName"
try {
  aws iam create-group --group-name $GroupName | ConvertFrom-Json | Out-Null
} catch {
  Write-Warning "Group might already exist. Skipping: $($_.Exception.Message)"
}

# Attach Policy to Group
Write-Host "Attaching policy $PolicyArn to $GroupName"
aws iam attach-group-policy --group-name $GroupName --policy-arn $PolicyArn

# Create User
Write-Host "Creating IAM User: $UserName"
try {
  aws iam create-user --user-name $UserName | ConvertFrom-Json | Out-Null
} catch {
  Write-Warning "User might already exist. Skipping user creation."
}

# Create Login Profile (Console Password)
if ($CreateLoginProfile) {
  if (-not $Password) {
    $pass = Read-Host -AsSecureString "Enter a password for the user (console login)"
    $Password = [Runtime.InteropServices.Marshal]::PtrToStringAuto([Runtime.InteropServices.Marshal]::SecureStringToBSTR($pass))
  }
  Write-Host "Creating login profile for user (console access)"
  try {
    aws iam create-login-profile --user-name $UserName --password $Password --password-reset-required | ConvertFrom-Json | Out-Null
  } catch {
    Write-Warning "Failed to create login profile or it already exists. Error: $($_.Exception.Message)"
  }
} else {
  Write-Host "Skipping login profile creation (console password). You can manually set this in the AWS Console if needed."
}

# Add user to group
Write-Host "Adding user $UserName to group $GroupName"
aws iam add-user-to-group --user-name $UserName --group-name $GroupName

# Create access key for the user
Write-Host "Creating access key for user $UserName"
$accessKey = aws iam create-access-key --user-name $UserName | ConvertFrom-Json
$AccessKeyId = $accessKey.AccessKey.AccessKeyId
$SecretAccessKey = $accessKey.AccessKey.SecretAccessKey
Write-Host "Created AccessKeyId: $AccessKeyId"
Write-Host "SecretAccessKey (copy now): $SecretAccessKey" -ForegroundColor Yellow
Write-Host "Note: Store the secret access key securely. This is shown only at creation time."

# Create the EC2 Role
Write-Host "Creating role $RoleName"
try {
  aws iam create-role --role-name $RoleName --assume-role-policy-document file://./ec2-assume-role.json | ConvertFrom-Json | Out-Null
} catch {
  Write-Warning "Role might already exist or there was an error. $_"
}

# Attach policy to the role
Write-Host "Attaching policy $PolicyArn to role $RoleName"
aws iam attach-role-policy --role-name $RoleName --policy-arn $PolicyArn

# Create instance profile and add the role
Write-Host "Creating instance profile $InstanceProfileName"
try {
  aws iam create-instance-profile --instance-profile-name $InstanceProfileName | ConvertFrom-Json | Out-Null
} catch {
  Write-Warning "InstanceProfile might already exist. Skipping creation."
}

Write-Host "Adding role $RoleName to instance profile $InstanceProfileName"
aws iam add-role-to-instance-profile --instance-profile-name $InstanceProfileName --role-name $RoleName

Write-Host "Done. Resources created: Group=$GroupName, User=$UserName, Role=$RoleName, InstanceProfile=$InstanceProfileName"

Write-Host "IMPORTANT: If you want the EC2 instance to use the Role, attach $InstanceProfileName to the instance through the EC2 console or use the AWS CLI to associate the instance profile with the instance."

Write-Host "Remember to enable MFA for the user $UserName in the AWS Console for improved security."

# Save generated details summary to a local file (do not store secret in public repos)
$SummaryFile = "$PSScriptRoot/created-resources.json"
$summary = [PSCustomObject]@{
  GroupName = $GroupName
  UserName = $UserName
  AccessKeyId = $AccessKeyId
  # SecretAccessKey is printed and should be stored by the operator only, not saved to code or repo
  RoleName = $RoleName
  InstanceProfileName = $InstanceProfileName
}
$summary | ConvertTo-Json | Set-Content $SummaryFile -Force
Write-Host "Summary saved to: $SummaryFile" -ForegroundColor Green
