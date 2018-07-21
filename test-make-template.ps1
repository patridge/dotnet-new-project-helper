Set-PSDebug -Trace 1
# Remove any prior templates
dotnet new --uninstall dotnet-new-project-helper
# Pack up a new NuGet package
nuget pack ./dotnet-new-project-helper.nuspec
# Install the new package
dotnet new --install ./dotnet-new-project-helper.0.2.0.nupkg
# Clear out our test output location
Get-ChildItem test -Recurse | Remove-Item -Force

# Spin up a new .nuspec file
#dotnet new make-template --name test --templateId "test.make-template" --author "Someone" --classificationsQuotedCsv "\"Sample\", \"Something\"" --templateName "Test run: make-template" --templateShortName "test-make-template"
# (NOTE: omitting `--classificationsQuotedCsv` because escaped values are not handled correctly in v2.1.300. [Fixed in https://github.com/dotnet/templating/issues/1542])
dotnet new make-template --name test --templateId "test.make-template" --author "Someone" --templateName "Test run: make-template" --templateShortName "test-make-template"
# Dump first three lines of resulting README.md file
Get-Content test/.template.config/template.json
Get-Content test/.template.config/dotnetcli.host.json
# List contents of test output location (make sure nothing more than README.md)
Get-ChildItem -Path test

# Delete test output location contents for next test
Get-ChildItem -Path test -Include * -File -Recurse | foreach { $_.Delete() }
Get-ChildItem -Path test/.template.config -Include * -File -Recurse | foreach { $_.Delete() }
Remove-Item -Path test/.template.config -Force
