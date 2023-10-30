
# Setup Ansible
1. Install ansibe on Ubuntu 22.04 
   ```sh 
   sudo apt update
   sudo apt install software-properties-common
   sudo add-apt-repository --yes --update ppa:ansible/ansible
   sudo apt install ansible
   ```

2. copy the ssh private keypair to the ansible machine, e.g /opt/aws-new-acct-eu-west-2-keypair.pem

3. Add Jenkins master and slave as hosts 
Add jenkins master and slave private IPs in the inventory file 
in this case, we are using /opt is our working directory for Ansible. 

   ```
   [jenkins-master]
   18.133.237.78

   [jenkins-master:vars]
   ansible_user=ubuntu
   ansible_ssh_private_key_file=/opt/aws-new-acct-eu-west-2-keypair.pem

    [jenkins-slave]
    18.170.221.215
    [jenkins-slave:vars]
    ansible_user=ubuntu
   ansible_ssh_private_key_file=/opt/aws-new-acct-eu-west-2-keypair.pem
   ```

1. Test the connection  
   ```sh
   ansible -i hosts all -m ping 
   ```
