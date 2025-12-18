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

###━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
### EXECUTION
###━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

winget settings --enable InstallerHashOverride

Install-Web-Browsers
Install-Dev-Apps

winget settings --disable InstallerHashOverride