Write-Host "[] Installing visual studio code..."
choco install -y vscode
refreshenv

Write-Host "[] Installing generic extensions..."
code --install-extension EditorConfig.editorconfig
code --install-extension sdras.night-owl
code --install-extension visualstudioexptteam.vscodeintellicode
code --install-extension vscode-icons-team.vscode-icons

Write-Host "[] Installing python extensions..."
code --install-extension ms-python.python

Write-Host "[] Installing nodejs extensions..."
code --install-extension eg2.vscode-npm-script
code --install-extension dbaeumer.vscode-eslint
