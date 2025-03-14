
To install an MSI file using Ansible Galaxy, you can use the win_package module within a playbook, specifying the path to the MSI file and setting the state to present. 
Here's a breakdown of the process:
1. Create a Playbook (e.g., install_msi.yml):

2. Explanation:
hsts: Specifies the target Windows hosts where the MSI will be installed. 
become: true: Ensures the task runs with elevated privileges, necessary for MSI installation. 
win_get_url: Downloads the MSI file from the specified URL to a local path. 
win_package: Installs the MSI package using the win_package module. 
path: Specifies the path to the downloaded MSI file. 
state: present: Ensures the MSI is installed (or ensures it's installed if it's not already). 
---
- hosts: windows_hosts  # Replace with your target Windows hosts
  become: true  # Or use 'become: yes'
  tasks:
    - name: Download the MSI file
      win_get_url:
        url: "http://example.com/path/to/your.msi"  # Replace with the MSI URL
        dest: "C:\\temp\\your.msi"  # Replace with a local path
    - name: Install the MSI package
      win_package:
        path: "C:\\temp\\your.msi"  # Replace with the local MSI path
        state: present
3. Run the Playbook:
ansible-playbook install_msi.yml

4. Alternative Approach (using win_msi module):
While win_package is the recommended approach, you can also use the win_msi module for more direct MSI installation control.

Key Considerations:
MSI File Location:
Ensure the MSI file is accessible to the Ansible control node (where the playbook is executed) or that the win_get_url task downloads it to a location accessible by the target Windows hosts. 
Elevated Privileges:
MSI installation requires administrator privileges, hence the become: true or become: yes. 
Idempotency:
The state: present parameter ensures that the MSI is installed only if it's not already, making the task idempotent. 
Error Handling:
Consider adding error handling to your playbook to gracefully manage potential issues during MSI installation. 
Dependencies:
Ensure that the ansible.windows collection is installed on your Ansible control node, as it contains the win_package and win_msi modules. You can install it using ansible-galaxy collection install ansible.windows

- https://docs.ansible.com/collections.html
- https://www.reddit.com/r/ansible/comments/u9joaa/ansible_296_and_installation_of_msi_packages/?rdt=35600
- https://github.com/ansible/ansible-examples/blob/master/windows/install-msi.yml
