Set-PSDebug -Trace 1
# Remove any prior templates
dotnet new --uninstall dotnet-new-project-helper
# Pack up a new NuGet package
nuget pack ./dotnet-new-project-helper.nuspec
# Install the new package
dotnet new --install ./dotnet-new-project-helper.0.0.1.nupkg
# Clear out our test output location
Get-ChildItem test -Recurse | Remove-Item -Force

# Spin up a new .nuspec file
dotnet new add-nuspec --name test --title "Awesome project" --description "This project makes it easy to do amazing things." --copyrightYear "1999-2018" --projectFilename "awesome-project"
# Dump first three lines of resulting README.md file
Get-Content test/awesome-project.nuspec
# List contents of test output location (make sure nothing more than README.md)
Get-ChildItem -Path test

# Delete test output location contents for next test
Get-ChildItem -Path test -Include * -File -Recurse | foreach { $_.Delete() }
