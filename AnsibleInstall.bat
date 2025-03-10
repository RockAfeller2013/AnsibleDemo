# Install Ansible on Windows 11 using Cygwin
# Install Cygwin using Chocolatey
choco install cygwin -y

# Define Cygwin installation path
$cygwinPath = "C:\tools\cygwin"

# Install required Cygwin packages, including Python and OpenSSH
choco install cygwin --params "/InstallDir:$cygwinPath" -y
choco install cyg-get -y
& "$cygwinPath\bin\bash.exe" -c "cyg-get python39 python39-pip openssh"

# Install Ansible inside Cygwin
& "$cygwinPath\bin\bash.exe" -c "pip3 install --user ansible"

# Verify Installation
& "$cygwinPath\bin\bash.exe" -c "ansible --version"
