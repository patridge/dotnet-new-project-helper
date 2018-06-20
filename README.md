## Templates for creating `dotnet new` templates

These are a series of `dotnet new` templates for creating and populating your own `dotnet new` templates.

### Get started

#### Prerequisites

These templates use the `dotnet new` functionality of the .NET Core SDK. If you don't already have it installed (via the Visual Studio installer, for instance), [download and install the latest .NET Core SDK](https://www.microsoft.com/net/learn/get-started/).

#### Install the templates via NuGet package

These templates are published to NuGet for simple installation using the .NET tooling. The following command will install and make them available for use with the `dotnet new` command-line system.

```bash
dotnet new --install dotnet_new_template_creator
```

To uninstall the templates, use the same command but with the `--uninstall` option.

```bash
dotnet new --uninstall dotnet_new_template_creator
```

### Current templates

For help with any of the parameters used in these templates, append `--help` to any template command.

```bash
dotnet new {template} --help
```

#### Repo README.md

Create the initial README.md Markdown file for a repo folder.

```bash
dotnet new repo-readme --title \"Your project name\" --description \"Something descriptive about your project.\"
```

#### Repo LICENSE

Create a LICENSE file for a repo folder, with a choice between MIT, Apache 2.0, or GNU-GPL 3.0.

```bash
dotnet new repo-license --license MIT
```

#### Repo .nuspec configuration

Create a .nuspec file for a project folder.

```bash
dotnet new repo-license --license MIT
```

### Future templates/features

* Custom template basics
