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
    
    winget install --id CoreyButler.NVMforWindows --version "1.1.12"

    winget install --id Docker.DockerDesktop
    winget install --id Amazon.AWSCLI
    winget install --id Hashicorp.Terraform

    winget install "DBeaver CE"
    
    winget install --id Postman.Postman

    winget install --id Ngrok.Ngrok

    winget install --id Kubernetes.kubectl
}

function Config-Dev-Apps {
    git config --global user.email $GIT_USER_EMAIL
    git config --global user.name $GIT_USER_NAME

    ngrok update
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

function Config-Screen-Brightness {
    (Get-CimInstance -Namespace root/WMI -ClassName WmiMonitorBrightnessMethods) |
    Invoke-CimMethod -MethodName WmiSetBrightness -Arguments @{Brightness=1; Timeout=1}
}

function Config-Time-Sync {
    Set-Service w32time -StartupType Automatic
    w32tm /resync
}

function Setup-Startup-Apps {
    $PATH_OF_STARTUP_FOLDER = "$env:APPDATA\Microsoft\Windows\Start Menu\Programs\Startup"


    $APPS_TO_CREATE_SHORTCUTS = @(
        @{
            PATH_OF_APP   = "C:\Program Files\Google\Chrome\Application\chrome.exe"
            SHORTCUT_NAME = "chrome.lnk"
        },
        @{
            PATH_OF_APP   = "c:\Program Files\Mozilla Firefox\firefox.exe"
            SHORTCUT_NAME = "firefox.lnk"
        },
        @{
            PATH_OF_APP   = "C:\Users\$OPERATING_SYSTEM_USER_NAME\AppData\Local\Programs\pomotroid\Pomotroid.exe"
            SHORTCUT_NAME = "pomotroid.lnk"
        },
        @{
            PATH_OF_APP   = "c:\Users\$OPERATING_SYSTEM_USER_NAME\AppData\Local\Programs\Microsoft VS Code\Code.exe"
            SHORTCUT_NAME = "code.lnk"
        },
        @{
            PATH_OF_APP   = "c:\windows\system32\Taskmgr.exe"
            SHORTCUT_NAME = "taskmgr.lnk"
        },
        @{
            PATH_OF_APP   = "c:\Program Files\Docker\Docker\Docker Desktop.exe"
            SHORTCUT_NAME = "docker.lnk"
        }
    )


    foreach ($APP_TO_CREATE_SHORTCUT in $APPS_TO_CREATE_SHORTCUTS) {
        $PATH_TO_CREATE_SHORTCUT = Join-Path $PATH_OF_STARTUP_FOLDER $APP_TO_CREATE_SHORTCUT.SHORTCUT_NAME

        $createdShortcut = (New-Object -ComObject WScript.Shell).CreateShortcut($PATH_TO_CREATE_SHORTCUT)
        # ---
        $createdShortcut.TargetPath = $APP_TO_CREATE_SHORTCUT.PATH_OF_APP
        $createdShortcut.Save()
        }
}

function Config-Clipboard-History {
    Set-ItemProperty -Path "HKCU:\Software\Microsoft\Clipboard" -Name "EnableClipboardHistory" -Value 1 -Type DWord
}

function Config-Operating-System {
    Setup-Startup-Apps
    Config-Computer-Screens
    Config-Screen-Brightness
    Make-Directories
    Config-Time-Sync
    Config-Clipboard-History
}

function Install-Productivity-Apps {
    winget install --id splode.pomotroid
}

function Install-Entertainment-Apps {
    Install-Game-Apps

    winget install --id Spotify.Spotify
}

function Config-Entertainment-Apps {
    Remove-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Run" -Name "Spotify"
    Remove-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Run" -Name "SpotifyLauncher"
}

function Install-Communication-Apps {
    winget install --id Discord.Discord
    winget install WhatsApp
}

function Manual {
    # [] Remove all apps from taskbar
    # [] Pin apps at taskbar
    # [] Add e-mails to web browser
    # [] Config AWS CLI profiles
    # [] Config SSH to Github connection (https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent#generating-a-new-ssh-key)
}

function Install-Package-Managers {
    winget install --id Chocolatey.Chocolatey
}

###━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
### EXECUTION
###━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

winget settings --enable InstallerHashOverride

Install-Web-Browsers

Config-Operating-System

Install-Package-Managers

Install-Productivity-Apps

Install-Communication-Apps

Install-Dev-Apps
Config-Dev-Apps 

Install-Entertainment-Apps
Config-Entertainment-Apps

Manual

winget settings --disable InstallerHashOverride