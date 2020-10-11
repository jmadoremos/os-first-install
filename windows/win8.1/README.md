# Windows 8.1

## Installing chocolatey

Chocolatey is a package manager for Windows to facilitate installation of various third-party applications.

```ps
Set-ExecutionPolicy Bypass -Scope Process -Force; iwr https://chocolatey.org/install.ps1 -UseBasicParsing | iex
```

## Installing applications using chocolatey

> Run the commands below using **PowerShell as Administrator**.

### 7zip

7zip is an archive manager.

```ps
choco install -y 7zip
```

### Anaconda

A python distribution platform for data science.

```ps
choco install -y anaconda3
```

### AquaSnap

Desktop environment enhancement for arranging windows.

```ps
choco install -y aquasnap
```

### Gaming Essentials

For more information, refer to [Gaming Essentials](../shared/gaming-essentials/README.md) page.

### Git

```ps
choco install -y git --params "/NoShellIntegration /SChannel"
```

### Google Chrome

```ps
choco install -y googlechrome
```

### Microsoft Office 365 ProPlus

> This will install the suite in trial mode. License is required for continuous usage.

```ps
choco install -y office365proplus
```

### NodeJS

```ps
choco install -y nodejs
```

### OpenJDK

```ps
choco install -y openjdk
```

### Python

```ps
choco install -y python
```

### uTorrent

```ps
choco install -y utorrent
```

### Visual Studio Code

For more information, refer to [Visual Studio Code](../shared/vscode/README.md) page.
