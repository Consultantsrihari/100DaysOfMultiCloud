# Destroy IAM resources created in Day 1 script
# Use: powershell -File ./destroy-iam.ps1

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

$GroupName = 'Developers'
$UserName = 'john.developer'
$RoleName = 'EC2-S3ReadRole'
$InstanceProfileName = 'EC2S3ReadRoleInstanceProfile'

# Delete access keys
try {
  $keys = aws iam list-access-keys --user-name $UserName | ConvertFrom-Json
  foreach ($k in $keys.AccessKeyMetadata) {
    Write-Host "Deleting access key: $($k.AccessKeyId)"
    aws iam delete-access-key --user-name $UserName --access-key-id $($k.AccessKeyId)
  }
} catch {
  Write-Warning "No access keys or error listing them: $($_.Exception.Message)"
}

# Delete login profile
try {
  aws iam delete-login-profile --user-name $UserName
  Write-Host "Login profile deleted for $UserName"
} catch {
  Write-Warning "Login profile not present or cannot delete: $($_.Exception.Message)"
}

# Remove user from group
try {
  Write-Host "Removing user $UserName from group $GroupName"
  aws iam remove-user-from-group --user-name $UserName --group-name $GroupName
} catch {
  Write-Warning "Failed to remove user from group or user/group does not exist. $($_.Exception.Message)"
}

# Delete user
try {
  Write-Host "Deleting user $UserName"
  aws iam delete-user --user-name $UserName
} catch {
  Write-Warning "Failed to delete user (maybe no user): $($_.Exception.Message)"
}

# Detach group policy
$PolicyArn = 'arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess'
try {
  Write-Host "Detaching policy from group $GroupName"
  aws iam detach-group-policy --group-name $GroupName --policy-arn $PolicyArn
} catch {
  Write-Warning "Could not detach policy from group: $($_.Exception.Message)"
}

# Delete group
try {
  Write-Host "Deleting group $GroupName"
  aws iam delete-group --group-name $GroupName
} catch {
  Write-Warning "Failed to delete group (maybe not empty): $($_.Exception.Message)"
}

# Remove role from instance profile
try {
  Write-Host "Removing role from instance profile: $InstanceProfileName"
  aws iam remove-role-from-instance-profile --instance-profile-name $InstanceProfileName --role-name $RoleName
} catch {
  Write-Warning "Error removing role from instance profile: $($_.Exception.Message)"
}

# Delete instance profile
try {
  Write-Host "Deleting instance profile: $InstanceProfileName"
  aws iam delete-instance-profile --instance-profile-name $InstanceProfileName
} catch {
  Write-Warning "Error deleting instance profile: $($_.Exception.Message)"
}

# Detach role policies
try {
  Write-Host "Listing attached policies for role: $RoleName"
  $attached = aws iam list-attached-role-policies --role-name $RoleName | ConvertFrom-Json
  foreach ($p in $attached.AttachedPolicies) {
    Write-Host "Detaching policy $($p.PolicyArn) from $RoleName"
    aws iam detach-role-policy --role-name $RoleName --policy-arn $($p.PolicyArn)
  }
} catch {
  Write-Warning "Error listing/detaching role policies: $($_.Exception.Message)"
}

# Delete role
try {
  Write-Host "Deleting role $RoleName"
  aws iam delete-role --role-name $RoleName
} catch {
  Write-Warning "Failed to delete role (maybe still in use): $($_.Exception.Message)"
}

Write-Host "Cleanup complete (or attempted). Please check the AWS console to verify any remaining resources." -ForegroundColor Green
