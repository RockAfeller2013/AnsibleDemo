When using ansible_local as the provisioner in Vagrant, the playbook (like playbook.yml) is transferred to the VM automatically by Vagrant. The playbook file is placed inside the VM's /vagrant directory (the shared folder between your host and the guest VM).

In the example I provided, Vagrant will sync the playbook.yml file from your local directory (where the Vagrantfile is located) into the VM’s /vagrant directory. Then, the ansible_local provisioner will run the playbook from that directory.
