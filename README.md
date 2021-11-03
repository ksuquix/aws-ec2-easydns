# aws-ec2-easydns
This is a Simple startup script that pushes a A record to route53 on system bootup.

The EC2 instance needs these role permissions:
```json
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "ksuquix",
            "Effect": "Allow",
            "Action": [
                "route53:ChangeResourceRecordSets",
                "route53:ListResourceRecordSets"
            ],
            "Resource": "arn:aws:route53:::hostedzone/XXXXXXXXXXXXXXXXXXXXXXX"
        },
        {
            "Sid": "ksuquix2",
            "Effect": "Allow",
            "Action": "route53:ListHostedZones",
            "Resource": "*"
        }
    ]
}
```
where XXXXXX is your Hosted zone ID


```bash
HOSTNAME=myhost.example.com

git clone https://github.com/ksuquix/aws-ec2-easydns.git
yum install -y jq
cd aws-ec2-easydns
sudo cp ec2-easydns.service /etc/systemd/system/
sudo mkdir -p /opt/ec2-easydns
sudo cp setup-ec2-easydns.sh /opt/ec2-easydns
sudo chmod 755 /opt/ec2-easydns/setup-ec2-easydns.sh
sudo sh -c "echo $HOSTNAME > /opt/ec2-easydns/hostname"
sudo systemctl start ec2-easydns.service
sudo systemctl enable ec2-easydns.service
```