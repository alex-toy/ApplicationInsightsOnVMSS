"###############################################################"
"Now running : " + $MyInvocation.MyCommand.Path
"###############################################################"


################################################################
"Function App :"

$Global:AIName = "alexeiai"


################################################################
"CREATE AN APPLICATION INSIGHTS :"

az monitor app-insights component create `
    --resource-group $RGName `
    --location $RGLocation `
    --app $AIName
    # [--application-type]
    # [--kind]
    # [--tags]

    









    