# az vm list-skus `
#     --location $RGLocation `
#     --size Standard_D --output table

# az group create --name alexeirg --location westus

az vm create --name myvm --resource-group alexeirg --image UbuntuLTS