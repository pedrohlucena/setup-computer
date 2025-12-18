###━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
### VARIABLES
###━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

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

###━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
### EXECUTION
###━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

winget settings --enable InstallerHashOverride

Install-Web-Browsers
Install-Dev-Apps
Config-Dev-Apps

winget settings --disable InstallerHashOverride