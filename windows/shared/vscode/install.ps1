Write-Host "[] Installing visual studio code..."
choco install -y vscode
refreshenv

Write-Host "[] Installing generic extensions..."
code --install-extension vscode-icons-team.vscode-icons --force
code --install-extension sdras.night-owl --force
code --install-extension aaron-bond.better-comments --force
code --install-extension streetsidesoftware.code-spell-checker --force
code --install-extension visualstudioexptteam.vscodeintellicode --force
code --install-extension eamodio.gitlens --force
code --install-extension EditorConfig.editorconfig --force

Write-Host "[] Installing python extensions..."
code --install-extension ms-python.python

Write-Host "[] Installing nodejs extensions..."
code --install-extension eg2.vscode-npm-script
code --install-extension dbaeumer.vscode-eslint
