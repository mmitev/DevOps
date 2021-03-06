$ErrorActionPreference = "Stop"

function Get-ScriptDirectory
{
    Split-Path $script:MyInvocation.MyCommand.Path
}

if($relConfigFilePath -eq $null) {
    Write-Host "no relConfigFilePath set!"
    exit 1
}

$configFilePath = Join-Path (Get-ScriptDirectory) $relConfigFilePath
.$configFilePath

if($relConfiguratorPath -eq $null) {
   $relConfiguratorPath = "WinFeaturesConfigurator"
}

$configuratorFilePath = Join-Path (Get-ScriptDirectory) $relConfiguratorPath
.$configuratorFilePath

#TODO validate features config!

ApplyFeatures $winFeaturesConfig

