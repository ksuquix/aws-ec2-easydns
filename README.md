# aws-ec2-easydns
Sets 

HOSTNAME=myhost.example.com

git clone git@github.com:ksuquix/aws-ec2-easydns.git
yum install -y jq
cd aws-ec2-easydns
sudo cp ec2-easydns.service /etc/systemd/system/
sudo mkdir -p /opt/ec2-easydns
sudo cp setup-ec2-easydns.sh /opt/ec2-easydns
sudo chmod 755 /opt/ec2-easydns
sudo sh -c "echo $HOSTNAME > /opt/ec2-easydns/hostname"
