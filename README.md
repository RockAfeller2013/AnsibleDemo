# Learn Ansible

Just my notes to learn Ansible. 

My ChagGPT -https://chatgpt.com/share/67cc303f-eaa8-800e-8c32-d6a6dd6d1d7b

The Linux and Windows folders has Vagrant files and playbook to test Ansible.

## Linux Folder

This folder contains a working Vangrantfile for VMware Workstation and deploying a example Ansible_local playbook. I prefer to use local, instead of dedploying Ansible on the Hosts to minmise overhead and replications. 

## Linux2 Folder

This folder contains examples of Ansible Galaxy
To be able to download content from galaxy it is required to have ansible-core>=2.13.9
Please, check it running the command: ansible --version

- Ansible Galaxy is a repository for sharing, finding, and downloading Ansible roles and collections. It allows users to install pre-built automation content from the community and official sources.
- Ansible Roles are a way to organize Ansible playbooks into reusable components. A role typically includes tasks, handlers, variables, templates, and other files needed to configure a system.
- Ansible Namespaces in Ansible Galaxy is a unique identifier assigned to a user or organization. It ensures that roles and collections are grouped under a specific maintainer, avoiding naming conflicts.

## Create a MSI Installer

- Navigate to your Ansible roles directory and create a new role: mkdir -p roles/msi_installer/{tasks,files}
- Place your .msi installer inside the files directory: roles/msi_installer/files/installer_vista_win7_win8-32-3.3.0.953.msi
- Create the tasks/main.yml file inside the msi_installer role:
- Now, use this role in your playbook.yml:
- Run the Playbook: ansible-playbook -i inventory.ini playbook.yml
- Replace inventory.ini with your actual inventory file.

This will:

Copy the MSI file to the remote Windows machine.
Install it silently with the required parameters.
Log the installation output.

## Download MSI

- To download the MSI from GitHub instead of copying it from local files, update the Ansible role to use win_get_url to fetch the installer before running msiexec.
- Update tasks/main.yml Replace the existing file copy task with win_get_url:
- Use This Role in Your Playbook Ensure your playbook.yml calls the role:
- Run the Playbook: ansible-playbook -i inventory.ini playbook.yml

- Replace inventory.ini with your inventory file.

- Download the MSI from GitHub.
- Install it silently using msiexec.
- Log the installation output.

choco install git -y
git clone https://github.com/RockAfeller2013/AnsibleDemo
vagrant validate
vagrant up



## Add to Galaxy



Install Carbon Black Cloud MSI - https://knowledge.broadcom.com/external/article/291429/methods-to-install-a-carbon-black-cloud.html#mcetoc_1i7ubjsahf

