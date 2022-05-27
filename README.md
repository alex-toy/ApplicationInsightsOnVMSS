Set up Application Insights on VMSS
=
Create a VM Scale Set Configure it to be monitored by App Insights

## Prerequisite:
- You should have Azure CLI 2.xx.x installed on your system.
- Signed in to the Azure portal
- Logged into the Azure via CLI, using the command az login
- An instance of Application Insights already created in your account.


## Set up App Insights on VMSS
We are going to use an Application Insights resource to monitor a VM Scale Set. This will provide us new details about performance-related metrics, and display those metrics for us.

- Run **commands\Configs\config.ps1** script. This will automatically do the follwing tasks :
    - create a resource group
    - create an application insight
    - Run the **setup-script.sh** script. This will create a VMSS and other resource in your Azure account. If you encounter the permission error, try adding the executable permission by running the command: **chmod +x filename**

- Deploy a sample Flask application with Redis backend to at least one of the VMSS instances. The application code is available in the **azure-voting-app-redis-Deploy_to_VMSS** folder. Instructions for deploying the app locally are in the README inside the folder. Instructions for deploying the app in VMSS are in the file **deployVMSS.md**.

- Once the application deployment is complete, navigate to the VMSS on the web portal. Click 'Insights' on the left-menu under the **Monitoring** section. Enable the Insights. NOTE : Once you enable the Insights, the monitoring data will start getting collected and routed to Insights. It can take up to 10-15 minutes to show up.

- Refresh the VMSS and click ‘Instances’ again in 10-15 minutes. You should see a few charts.

- Analyze the various charts, and later **delete all the resources** using the command **az group delete --no-wait --name resource_group_name**


## About the setup-script.sh file
This script will:

- Create a storage account using the az storage account create command
- Create a network security group using the az network nsg create
- Create a VMSS with two Linux VMs of type Standard_B1ls, using the az vmss create
- Associate the network security group with a subnet using the az network vnet subnet update command
- Create a health probe using az network lb probe create
- Create a network load balancer rule using az network lb rule create
- Add inbound rules to the network security group on port 80 and 22, using the az network nsg rule create
Note that the az vmss create command in the script uses the cloud-init.txt to install additional packages in the vmss VMs. Make sure to have both the files below present in the same local directory.