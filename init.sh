sudo update-alternatives --set editor  /usr/bin/vim.basic
sudo add-apt-repository ppa:ansible/ansible
sudo apt update
sudo apt install ansible python-netaddr
sudo rm /etc/apt/sources.list.d/*

echo "Now run: ansible-playbook --private-key ../ceph-setup_id_rsa -i hosts site.yml"
