Set-PSDebug -Trace 1
# Remove any prior templates
dotnet new --uninstall dotnet-new-project-helper
# Pack up a new NuGet package
nuget pack ./dotnet-new-project-helper.nuspec
# Install the new package
dotnet new --install ./dotnet-new-project-helper.0.2.0.nupkg
# Clear out our test output location
Get-ChildItem test -Recurse | Remove-Item -Force

# Spin up a new license: MIT
dotnet new add-license --name test --license MIT --fullName "Someone SuperAwesome" --copyrightYear 2020
# Dump first three lines of resulting LICENSE file
Get-Content -TotalCount 3 test/LICENSE
# List contents of test output location (make sure nothing more than LICENSE)
Get-ChildItem -Path test
# Delete test output location contents for next test
Get-ChildItem -Path test -Include * -File -Recurse | foreach { $_.Delete() }

# Repeat for Apache and GPL
dotnet new add-license --name test --license Apache --fullName "Someone SuperAwesome" --copyrightYear 2020
Get-Content -TotalCount 3 test/LICENSE
Get-ChildItem -Path test
Get-ChildItem -Path test -Include * -File -Recurse | foreach { $_.Delete() }
dotnet new add-license --name test --license GPL --fullName "Someone SuperAwesome" --copyrightYear 2020
Get-Content -TotalCount 3 test/LICENSE
Get-ChildItem -Path test

# Delete test output location contents for next test
Get-ChildItem -Path test -Include * -File -Recurse | foreach { $_.Delete() }
