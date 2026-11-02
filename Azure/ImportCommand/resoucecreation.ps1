$RG = "rg-import-demo"
$Location = "EastUS"
$SA = "stimportdemo17890"
$vnet = "vnet-import-demo"


# az group create --name $RG --location $Location --tags environment=demo

az storage account create --name $SA --resource-group $RG --location $Location --sku Standard_LRS --kind StorageV2 --min-tls-version TLS1_2

# az network vnet create --name $vnet --resource-group $RG --location $Location --address-prefixes 10.0.0.0/16 --subnet-name snet-app --subnet-prefixes 10.0.1.0/24

# az resource list --resource-group $RG --output table