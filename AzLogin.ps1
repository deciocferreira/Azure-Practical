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

#Criar uma VM
