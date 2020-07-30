set spn_id=<SPN_ID>
set spn_secret=<SPN_Secret>
set tenant_id=<Tenant_ID>
set resource_group=<resource_group>
cd %1
dotnet restore
dotnet build --configuration release
dotnet publish --configuration release --output ./deployable
if exist publish_%1.zip del publish_%1.zip
cd deployable
tar -acf ../publish_%1.zip *
cd ..
rmdir /q /s deployable
rem az login can be used here for interactive login
az login --service-principal -u %spn_id% -p %spn_secret% --tenant %tenant_id% | az webapp deployment source config-zip --resource-group %resource_group% --name %2 --src ./publish_%1.zip
cd ..