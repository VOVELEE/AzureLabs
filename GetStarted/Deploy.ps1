Install-Module AzureRM -AllowClobber

#Execution policy
Get-ExecutionPolicy -Scope CurrentUser
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser

#Import moduke
Import-Module AzureRM

#Import specific version
Import-Module AzureRM -RequiredVersion 1.2.9

#Check version
Get-Module AzureRM -ListAvailable | Select-Object Name,Version,Path



#Login
Login-AzureRmAccount #-Subscription "MCT MSDN"

Get-AzureRmResourceProvider -ListAvailable | Select-Object ProviderNamespace, RegistrationState
Register-AzureRmResourceProvider -ProviderNamespace Microsoft.Batch
Get-AzureRmResourceProvider -ProviderNamespace Microsoft.Batch
(Get-AzureRmResourceProvider -ProviderNamespace Microsoft.COmpute).ResourceTypes.ResourceTypeName

Get-AzureRmSubscription 

Select-AzureRmSubscription -Subscription "MCT MSDN"

Get-AzureRmResourceGroup

Get-AzureRmResource -ResourceGroupName LABEnvironmentRG01 -ResourceType Microsoft.ClassicCompute/virtualMachines
Get-AzureRmResource | Select Name, ResourceType, ResourceGroupName

Get-AzureRmVM

$AllVMsSize = Get-AzureRmVMSize -Location "West US"

Get-AzureRmPublicIpAddress
get-azurermvirtualnetwork 
Get-AzureRmNetworkInterface 

get-azurermvm | Sort location,resourcegroupname,name 
Get-AzureRmStorageAccount

#Deploy
Select-AzureRmSubscription -Subscription "MCT MSDN"

New-AzureRmResourceGroup -Name DeployTests -Location "South Central US"-Tag @{Empty=$null; Usage="TestOnly"}
New-AzureRmResourceGroupDeployment -ResourceGroupName DeployTests -TemplateFile D:\OneDrive\LAB\Azure\GetStarted\DeployExtended.json -storageNamePrefix stoSecCop

Export-AzureRmResourceGroup -ResourceGroupName DeployTests -Path D:\OneDrive\LAB\Azure\GetStarted\exportDeployTests.json


Remove-AzureRmResourceGroup -Name DeployTests