# Azure DevOps Lab 18/09/2022 
# Connect to an Azure Account

# habilitar execução de scripts no computador local.
Set-ExecutionPolicy Unrestricted -Verbose

#Instalar o Azure CLI caso o computador não o tenha instalado.
$ProgressPreference = 'SilentlyContinue'; Invoke-WebRequest -Uri https://aka.ms/installazurecliwindows -OutFile .\AzureCLI.msi; Start-Process msiexec.exe -Wait -ArgumentList '/I AzureCLI.msi /quiet'; rm .\AzureCLI.msi

#Autenticar em uma conta
az login

#Criar um Resource Group 
az group create --name <name> --location <location>

#Criar uma Network
vnetName=Labnet01
subnetName=LabnetSubnet1
vnetAddressPrefix=10.0.0.0/16
subnetAddressPrefix=10.0.0.0/24

az network vnet create \
  --name $vnetName \
  --resource-group $resourceGroup \
  --address-prefixes $vnetAddressPrefix \
  --subnet-name $subnetName \
  --subnet-prefixes $subnetAddressPrefix

#Criar uma VM
# create shell variables
az vm create \
  --resource-group $resourceGroup \
  --name $vmName \
  --image UbuntuLTS \
  --vnet-name $vnetName \
  --subnet $subnetName \
  --generate-ssh-keys \
  --output json \
  --verbose
