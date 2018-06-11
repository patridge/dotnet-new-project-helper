Set-PSDebug -Trace 1
# Remove any prior templates
dotnet new --uninstall dotnet-new-template-creator
# Pack up a new NuGet package
nuget pack ./dotnet-new-template-creator.nuspec
# Install the new package
dotnet new --install ./dotnet-new-template-creator.0.0.1.nupkg
# Clear out our test output location
Get-ChildItem test -Recurse | Remove-Item -Force

# Spin up a new README.md
dotnet new add-readme --name test --title "Awesome project" --description "This project makes it easy to do amazing things."
# Dump first three lines of resulting README.md file
Get-Content test/README.md
# List contents of test output location (make sure nothing more than README.md)
Get-ChildItem -Path test
# Delete test output location contents for next test
Get-ChildItem -Path test -Include * -File -Recurse | foreach { $_.Delete() }

# Clean up after ourselves
Get-ChildItem test -Recurse | Remove-Item -Force