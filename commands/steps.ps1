#######################################################################
# Steps :

$Global:RGName = "alexeirg"
$Global:RGLocation = "francecentral"

bash ./setup-script/setup-script.sh $RGName $RGLocation

."commands\ApplicationInsights\AI_create.ps1"






