@echo off
:: Check for administrative privileges
net session >nul 2>&1
if %errorLevel% == 0 (
    :: Clone Win11Debloat repository
    echo Cloning Win11Debloat repository...
    powershell -Command "git clone https://github.com/Raphire/Win11Debloat.git"
    cd Win11Debloat

    :: Run Win11Debloat script
    echo Running Win11Debloat script...
    powershell -Command "Set-ExecutionPolicy Unrestricted -Scope Process; .\Win11Debloat.ps1 -Silent -RemoveApps -RemoveCommApps -RemoveW11Outlook -RemoveGamingApps -ClearStart -DisableTelemetry -DisableBing -DisableSuggestions -ShowHiddenFolders -ShowKnownFileExt -HideDupliDrive -DisableCopilot -HideChat"
    echo Win11Debloat script execution completed. Press enter once this is done...
    pause

    :: Clean up Win11Debloat folder
    echo Cleaning up Win11Debloat folder...
    cd ..
    rmdir /s /q Win11Debloat
    echo Win11Debloat folder has been cleaned up. You are now debloated. Press enter to exit...
    pause
    exit
) else (
    echo Not running as admin, continuing...
)

:: Check if winget is installed
where /q winget
if %errorLevel% == 0 (
    echo winget is already installed.
) else (
    echo winget is not installed. Installing winget...
    powershell -Command "Invoke-WebRequest -Uri 'https://aka.ms/getwinget' -OutFile $env:TEMP\winget-cli.appxbundle -UseBasicParsing"
    powershell -Command "Add-AppxPackage $env:TEMP\winget-cli.appxbundle"
    echo winget has been installed.
)

:: Install Scoop
echo Installing scoop...
powershell -Command "Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser; Invoke-RestMethod -Uri https://get.scoop.sh | Invoke-Expression"
echo Scoop installation completed.

echo Running WinGet/more install commands...

echo Installing WinSCP...
winget install -e --id WinSCP.WinSCP -h
echo WinSCP installation completed.

echo Installing Putty...
winget install -e --id PuTTY.PuTTY
echo Putty installation completed.

echo Installing Git...
winget install -e --id Git.Git -h
echo Git installation completed.

echo Installing Discord...
winget install -e --id Discord.Discord -h
echo Discord installation completed.
taskkill /IM "Update.exe" /f
taskkill /IM "Discord.exe" /f

echo Installing IntelliJ IDEA Ultimate...
winget install -e --id JetBrains.IntelliJIDEA.Ultimate -h
echo IntelliJ IDEA Ultimate installation completed.

echo Installing DataGrip...
winget install -e --id JetBrains.DataGrip -h
echo DataGrip installation completed.

echo Installing Firefox Browser...
winget install -e --id Mozilla.Firefox
echo Firefox installation completed.

echo Installing Java Runtime Environment...
winget install -e --id Oracle.JavaRuntimeEnvironment -h
echo Java Runtime Environment installation completed.

echo Installing Eclipse Adoptium Temurin 8 JDK...
winget install -e --id EclipseAdoptium.Temurin.8.JDK -h
echo Eclipse Adoptium Temurin 8 JDK installation completed.

echo Installing Eclipse Adoptium Temurin 17 JDK...
winget install -e --id EclipseAdoptium.Temurin.17.JDK -h
echo Eclipse Adoptium Temurin 17 JDK installation completed.

echo Installing Visual Studio Code...
winget install -e --id Microsoft.VisualStudioCode -h
echo Visual Studio Code installation completed.

echo Installing Visual Studio 2022 Community Preview...
winget install -e --id Microsoft.VisualStudio.2022.Community.Preview -h
echo Visual Studio 2022 Community Preview installation completed.

echo Installing Nvidia GeForce Experience...
winget install -e --id Nvidia.GeForceExperience -h
echo Nvidia GeForce Experience installation completed.
taskkill /IM "NVIDIA GeForce Experience.exe" /f

echo Installing Lunar Client...
winget install -e --id Moonsworth.LunarClient -h
echo Lunar Client installation completed.

echo Installing Rustup...
winget install -e --id Rustlang.Rustup -h
echo Rustup installation completed.

echo Installing PowerToys...
winget install -e --id Microsoft.PowerToys -h
echo PowerToys installation completed.

echo Installing OBS Studio...
winget install -e --id OBSProject.OBSStudio -h
echo OBS Studio installation completed.
taskkill /IM "PowerToys.Settings.exe" /f

echo Installing Notion...
winget install -e --id Notion.Notion -h
echo Notion installation completed.

echo Installing 7zip...
winget install -e --id 7zip.7zip -h
echo 7zip installation completed.

echo Installing VirtualBox...
winget install -e --id Oracle.VirtualBox -h
echo VirtualBox installation completed.

echo Installing WinDirStat...
winget install -e --id WinDirStat.WinDirStat -h
echo WinDirStat installation completed.

echo Installing WireGuard...
winget install -e --id WireGuard.WireGuard -h
echo WireGuard installation completed.

echo Installing Python 3.12...
winget install -e --id Python.Python.3.12 -h
echo Python 3.12 installation completed.

echo Installing Logitech GHUB...
winget install -e --id Logitech.GHUB -h
echo Logitech GHUB installation completed.
taskkill /IM "lghub.exe" /f
taskkill /IM "lghub_agent.exe" /f
taskkill /IM "lghub_software_manager.exe" /f
taskkill /IM "lghub_updater.exe" /f
taskkill /IM "logi_crashpad_handler.exe" /f

echo Installing Telegram Desktop...
winget install -e --id Telegram.TelegramDesktop -h
echo Telegram Desktop installation completed.

echo Installing Rufus...
winget install -e --id Rufus.Rufus -h
echo Rufus installation completed.

echo installing scoop buckets...
powershell -Command "%USERPROFILE%\scoop\shims\scoop bucket add versions; %USERPROFILE%\scoop\shims\scoop bucket add main"

echo Installing bun using scoop...
powershell -Command "%USERPROFILE%\scoop\shims\scoop install main/bun"
echo bun installation completed.

echo Installing steam using scoop...
powershell -Command "%USERPROFILE%\scoop\shims\scoop install versions/steam"
taskkill /IM "steamwebhelper.exe" /f
echo steam installation completed.
echo Press enter once all these are finished and closed
pause

echo Installing NVM and NodeJS using scoop...
powershell -Command "%USERPROFILE%\scoop\shims\scoop install main/nvm; %USERPROFILE%\scoop\apps\nvm\current\nvm install lts; %USERPROFILE%\scoop\apps\nvm\current\nvm use lts"

echo Script execution completed. Please install Davinci Resolve, Vape V4, and MultiMC manually.
echo Please now run this script as an administrator to debloat Windows 11.
echo Press enter to exit...
pause
