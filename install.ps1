# PowerShell install script for Windows
param(
    [switch]$UseScoop,
    [switch]$UseChocolatey
)

# Colors for output
$Green = [ConsoleColor]::Green
$Yellow = [ConsoleColor]::Yellow
$Red = [ConsoleColor]::Red

function Write-ColorOutput {
    param([string]$Message, [ConsoleColor]$Color = [ConsoleColor]::White)
    Write-Host $Message -ForegroundColor $Color
}

Write-ColorOutput "Starting dotfiles setup for Windows..." $Green

# Check if running as administrator for Chocolatey
function Test-Administrator {
    $currentUser = [Security.Principal.WindowsIdentity]::GetCurrent()
    $principal = New-Object Security.Principal.WindowsPrincipal($currentUser)
    return $principal.IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)
}

# Function to check if command exists
function Test-Command {
    param([string]$Command)
    try {
        Get-Command $Command -ErrorAction Stop | Out-Null
        return $true
    }
    catch {
        return $false
    }
}

# Install package manager if not present
if (-not $UseScoop -and -not $UseChocolatey) {
    Write-ColorOutput "Which package manager would you like to use?" $Yellow
    Write-ColorOutput "1. Scoop (recommended, user-level install)" $Yellow
    Write-ColorOutput "2. Chocolatey (requires admin privileges)" $Yellow
    $choice = Read-Host "Enter your choice (1 or 2)"
    
    if ($choice -eq "2") {
        $UseChocolatey = $true
    } else {
        $UseScoop = $true
    }
}

if ($UseScoop) {
    if (-not (Test-Command "scoop")) {
        Write-ColorOutput "Installing Scoop..." $Yellow
        Set-ExecutionPolicy RemoteSigned -Scope CurrentUser -Force
        Invoke-RestMethod get.scoop.sh | Invoke-Expression
    }
    
    Write-ColorOutput "Installing tools via Scoop..." $Yellow
    scoop install git
    scoop bucket add extras
    scoop install neovim fzf ripgrep nodejs python go fd bat jq curl wget
    
    # Install chezmoi
    if (-not (Test-Command "chezmoi")) {
        scoop install chezmoi
    }
}

if ($UseChocolatey) {
    if (-not (Test-Administrator)) {
        Write-ColorOutput "Chocolatey requires administrator privileges. Please run PowerShell as Administrator." $Red
        exit 1
    }
    
    if (-not (Test-Command "choco")) {
        Write-ColorOutput "Installing Chocolatey..." $Yellow
        Set-ExecutionPolicy Bypass -Scope Process -Force
        [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072
        Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
    }
    
    Write-ColorOutput "Installing tools via Chocolatey..." $Yellow
    choco install neovim git fzf ripgrep nodejs python go fd bat jq curl wget -y
    
    # Install chezmoi
    if (-not (Test-Command "chezmoi")) {
        choco install chezmoi -y
    }
}

# Install chezmoi if still not available
if (-not (Test-Command "chezmoi")) {
    Write-ColorOutput "Installing chezmoi via PowerShell..." $Yellow
    $tag = (Invoke-WebRequest "https://api.github.com/repos/twpayne/chezmoi/releases/latest").Content | ConvertFrom-Json | Select-Object -ExpandProperty tag_name
    $downloadUrl = "https://github.com/twpayne/chezmoi/releases/latest/download/chezmoi_$($tag.TrimStart('v'))_windows_amd64.zip"
    $tempPath = "$env:TEMP\chezmoi.zip"
    $extractPath = "$env:TEMP\chezmoi"
    
    Invoke-WebRequest -Uri $downloadUrl -OutFile $tempPath
    Expand-Archive -Path $tempPath -DestinationPath $extractPath -Force
    
    $installDir = "$env:LOCALAPPDATA\bin"
    if (-not (Test-Path $installDir)) {
        New-Item -ItemType Directory -Path $installDir -Force
    }
    
    Move-Item "$extractPath\chezmoi.exe" "$installDir\chezmoi.exe" -Force
    
    # Add to PATH if not already there
    $userPath = [Environment]::GetEnvironmentVariable("Path", "User")
    if ($userPath -notlike "*$installDir*") {
        [Environment]::SetEnvironmentVariable("Path", "$userPath;$installDir", "User")
        $env:Path += ";$installDir"
    }
    
    Remove-Item $tempPath -Force
    Remove-Item $extractPath -Recurse -Force
}

# Initialize chezmoi
Write-ColorOutput "Initializing dotfiles..." $Yellow
chezmoi init --apply ykyk3

Write-ColorOutput "Setup complete!" $Green
Write-ColorOutput "Please restart your terminal to apply all changes." $Yellow
Write-ColorOutput "Note: All tools and packages have been installed automatically." $Yellow