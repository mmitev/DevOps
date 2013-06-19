import-module ServerManager


#$webFeatures = Get-WindowsFeature Web*
#foreach($webFeature in $webFeatures)
#{
#    write-host $webFeature.Installed
#}

function EnsureFeatureActive($winFeatureName) {
    GuardAgainstNull $winFeatureName "windows feature name must be specified"
    if(!IsWinFeatureActive)
    {
        Add-WindowsFeature $winFeatureName 
    }
}

function IsWinFeatureActive($winFeatureName) {
    GuardAgainstNull $winFeatureName "windows feature name must be specified"
    $feature = Get-WindowsFeature $winFeatureName
    GuardAgainstNull $feature "No feature with name {0} found to check weather it's active." -f $winFeatureName
    return $feature.Installed
}

function Write-Info ($message) {
    Write-Host "Info:" $message
}

function Write-Error ($message) {
    Write-Host "Error:" $message
}

function GuardAgainstNull($value, $message) {
    if($value -eq $null) {
        Write-Error $message
        exit 1
    }    
}