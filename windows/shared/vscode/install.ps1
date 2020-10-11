# =====================================================================
# Copyright 2020 James Michael A. Adoremos
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#   http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
# =====================================================================

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
