cd /tmp
yum install -y https://s3.ap-southeast-1.amazonaws.com/amazon-ssm-ap-southeast-1/latest/linux_amd64/amazon-ssm-agent.rpm
systemctl start amazon-ssm-agent
systemctl status amazon-ssm-agent
