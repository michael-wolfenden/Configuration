oh-my-posh
==========

[![Build status](https://img.shields.io/appveyor/ci/janjoris/oh-my-posh/master.svg?maxAge=2592000)](https://ci.appveyor.com/project/JanJoris/oh-my-posh) [![Gitter](https://badges.gitter.im/oh-my-posh/Lobby.svg)](https://gitter.im/oh-my-posh/general?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge)

## Table of Contents

* [About](#about)
* [Prerequisites](#prerequisites)
* [Installation](#installation)
* [Configuration](#configuration)
* [Helper functions](#helper)
* [Themes](#themes)

<div id='about'/>
About
-----

A theme engine for Powershell in ConEmu inspired by the work done by Chris Benti on [PS-Config](https://github.com/chrisbenti/PS-Config). And [Oh-My-ZSH](https://github.com/robbyrussell/oh-my-zsh) on OSX and Linux (hence the name)
More information about why I made this can be found on my [blog](https://herebedragons.io/shell-shock/).

![Theme](http://janjoris.github.com/img/indications.png)

Features:

* Easy installation
* Awesome prompt themes for PowerShell in ConEmu
* Git status indications (powered by posh-git)
* Failed command indication
* Admin indication
* Current session indications (admin, failed command, user)
* Configurable
* Easily create your own theme
* Separate settings for oh-my-posh and posh-git
* Does not mess with the default Powershell console

<div id='prerequisites'/>
<details>
<summary>Prerequisites</summary>

You should use ConEmu to have a brilliant terminal experience on Windows. You can install it using [Chocolatey](https://chocolatey.org/) :

```bash
choco install ConEmu
```

The fonts I use are Powerline fonts, there is a great [repository](https://github.com/powerline/fonts) containing them and a .ps1 file to install.
Or, could absuse [PsGet](http://psget.net/) and install them:

```bash
Install-Module -ModuleUrl https://github.com/powerline/fonts/archive/master.zip
```

I use `Meslo LG M for Powerline` in my ConEmu setup together with custom colors You can find my theme [here](https://gist.github.com/JanJoris/71c9f1361a562f337b855b75d7bbfd28).

</details>

<div id='installation'/>
<details>
<summary>Installation</summary>

You can choose between the [PowerShell Gallery](https://www.powershellgallery.com/packages/oh-my-posh/) (preferred) or [PsGet](http://psget.net/).

### PowerShell Gallery

Install posh-git and oh-my-posh:

```bash
Install-Module posh-git -Scope CurrentUser
Install-Module oh-my-posh -Scope CurrentUser
```

### PsGet

Fetch the URL to the latest `oh-my-posh.zip` [release](https://github.com/JanJoris/oh-my-posh/releases/latest) and use PsGet to install it.

```bash
Install-Module -ModuleUrl <link to latest oh-my-posh.zip>
```

</details>

<div id='configuration'/>
<details>
<summary>Configuration</summary>

List the current configuration:

```bash
$ThemeSettings
```

![Theme](http://janjoris.github.com/img/themesettings.png)

You can tweak the settings by manipulating `$ThemeSettings`.
This example allows you to tweak the branch symbol using a unicode character:

````bash
$ThemeSettings.GitSymbols.BranchSymbol = [char]::ConvertFromUtf32(0xE0A0)
````

Also do not forget the Posh-Git settings itself (enable the stash indication for example):

```bash
$GitPromptSettings
```

</details>

<div id='helper'/>
<details>
<summary>Helper functions</summary>

`Set-Theme`:  set a theme from the Themes directory. If no match is found, it will not be changed. Autocomplete is available to list and complete available themes.

```bash
Set-Theme paradox
```

`Show-ThemeColors`: display the colors used by the theme

![Theme](http://janjoris.github.com/img/themecolors.png)

`Show-Colors`: display colors configured in ConEmu

![Theme](http://janjoris.github.com/img/showcolors.png)

</details>

<div id='themes'/>
<details>
<summary>Themes</summary>

### Agnoster

![Theme](http://janjoris.github.com/img/agnoster.png)

### Paradox

![Theme](http://janjoris.github.com/img/paradox.png)

### Sorin

![Theme](http://janjoris.github.com/img/sorin.png)

### Darkblood

![Theme](http://janjoris.github.com/img/darkblood.png)

### Avit

![Theme](http://janjoris.github.com/img/avit.png)

### Honukai

![Theme](http://janjoris.github.com/img/honukai.png)

### Fish

![Theme](http://janjoris.github.com/img/fish.png)

<div id='owntheme'/>
Creating your own theme
-----------------------

If you want to create a theme it can be done rather easily by adding a `mytheme.psm1` file in the folder indicated in `$ThemeSettings.MyThemesLocation` (the folder defaults to `~\Documents\WindowsPowerShell\PoshThemes`, feel free to change it).
The only required function is Write-Theme, you can use the following template to get started:

````bash
#requires -Version 2 -Modules posh-git

function Write-Theme
{
    param(
        [bool]
        $lastCommandFailed,
        [string]
        $with
    )

    # enter your prompt building logic here
}

$sl = $global:ThemeSettings #local settings
````

Feel free to use the public helper functions `Get-VCSStatus`, `Get-VcsInfo`, `Get-Drive`, `Get-ShortPath`, `Set-CursorForRightBlockWrite`, `Save-CursorPosition`, `Pop-CursorPosition`, `Set-CursorUp` or add your own logic completely.
To test the output in ConEmu, just switch to your theme:

```bash
Set-Theme mytheme
```

If you want to include your theme in oh-my-posh, send me a PR and I'll try to give feedback ASAP.

Happy theming!

</details>

### Based on work by

* [Chris Benti](https://github.com/chrisbenti/PS-Config)
* [Keith Dahlby](https://github.com/dahlbyk/posh-git)
