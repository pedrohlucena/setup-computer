###━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
### VARIABLES
###━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

$OPERATING_SYSTEM_USER_NAME = "" # ⚠️ REPLACE ⚠️

$GIT_USER_EMAIL = "" # ⚠️ REPLACE ⚠️
$GIT_USER_NAME = "" # ⚠️ REPLACE ⚠️

###━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
### FUNCTIONS
###━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

function Install-Web-Browsers {
	winget install --id Google.Chrome
	winget install Mozilla.Firefox
}

function Install-Dev-Apps {
    winget install --id Git.Git
    
    winget install --id Microsoft.VisualStudioCode
    
    winget install --id CoreyButler.NVMforWindows

    winget install --id Docker.DockerDesktop
    winget install --id Amazon.AWSCLI
    winget install --id Hashicorp.Terraform
}

function Config-Dev-Apps {
    git config --global user.email $GIT_USER_EMAIL
    git config --global user.name $GIT_USER_NAME
}

function Install-Game-Apps {
    winget install --id Valve.Steam
}

function Make-Directories {
    mkdir "C:\Users\$OPERATING_SYSTEM_USER_NAME\OneDrive\Desktop\dev"
    mkdir "C:\Users\$OPERATING_SYSTEM_USER_NAME\OneDrive\Desktop\dev\repos"

    mkdir "C:\Users\$OPERATING_SYSTEM_USER_NAME\OneDrive\Desktop\vet"

    mkdir "C:\Users\$OPERATING_SYSTEM_USER_NAME\OneDrive\Desktop\jogos"
}

function Config-Computer-Screens {
    DisplaySwitch.exe /extend
}

function Config-Operating-System {
    Config-Computer-Screens
    Make-Directories
}

function Install-Productivity-Apps {
    winget install --id Flameshot.Flameshot
    winget install --id splode.pomotroid
}

function Install-Communication-Apps {
    winget install --id Discord.Discord
    winget install WhatsApp
}

###━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
### EXECUTION
###━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

winget settings --enable InstallerHashOverride

Config-Operating-System

Install-Productivity-Apps

Install-Web-Browsers

Install-Communication-Apps

Install-Dev-Apps
Config-Dev-Apps

Install-Game-Apps

winget settings --disable InstallerHashOverride