sudo yum install -q -y vim
echo "export EDITOR=vim" | sudo tee -a /etc/profile
echo "set -o vi" | sudo tee -a /etc/profile
source /etc/profile
