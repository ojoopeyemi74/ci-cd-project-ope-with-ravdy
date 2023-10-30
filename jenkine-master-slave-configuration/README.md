# Steps to configure Jenkins master and slave via SSH

# Step 1:
On the master machine, make sure you generate the ssh on the jenkins user

$ sudo su - jenkins

$ ssh-keygen

# Or if you will be generating the ssh key on another user
cp .ssh/known_hosts to /var/lib/jenkins

make sure you change the .ssh/known_hosts ownership to jenkins, but preferabley setup the ssh on jenkins user

# Copy the ssh public key to the slave server authorized.key



