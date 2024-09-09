# Set the file URL
$fileUrl = "https://raw.githubusercontent.com/jaimemachado/scripts/main/windows/quake/wqt.jsonc"

# Set app url
$appUrl = "https://github.com/jaimemachado/windows-terminal-quake/releases/download/v2.0.10/win-x64_self-contained.zip"

# Create the destination folder
$destinationFolder = Join-Path -Path $env:USERPROFILE -ChildPath "Apps"
New-Item -ItemType Directory -Force -Path $destinationFolder | Out-Null

# Download the latest release
$releaseFilePath = Join-Path -Path $destinationFolder -ChildPath 'app.zip'
Invoke-WebRequest -Uri $appUrl -OutFile $releaseFilePath

# Download the wqt.jsonc file
$fileDestinationPath = Join-Path -Path $destinationFolder -ChildPath "wqt.jsonc"
Invoke-WebRequest -Uri $fileUrl -OutFile $fileDestinationPath

Write-Output "Files downloaded successfully to $destinationFolder"

# Unzip the release
Expand-Archive -Path $releaseFilePath -DestinationPath $destinationFolder
