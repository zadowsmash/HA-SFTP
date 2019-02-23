# HA-SFTP
Deploy a HA SFTP Solution via AWS CloudFormation utilising EFS as Shared Storage

**The code can also be used for other solutions that are able to utilise a shared EFS file system.**

# Paramaters
* **ImageId** - This is the Amazon AMI ID to use within your launch config for your instances

* **ELBSubnet1** - ID of the Subnet the instance should be launched in, this will link the instance to the same VPC (ie AZA)
 
* **ELBSubnet2** - ID of the Subnet the instance should be launched in, this will link the instance to the same VPC (ie AZB)

* **ELBIpAddressType** - ELB IP Address type - Leave as ipv4

* **InstanceType** - Size of desired instances in ASG
       
* **InstanceSubnets** - Pick 2 different Private Subnets for the Instances within the ASG to be launched into

* **KeyName** - Key to use for instances

* **SSHLocation** - The IP address range that can be used to SSH to the EC2 instances

* **ListenerPort** - Listener Port for Service Behind ELB (ie 80 for Web Server)

* **AllowedListenerIp** - The IP address range that can be used to access the listener port (ie can access the server)

* **MountPoint** - The Linux mount point for the EFS volume (call it whever you like)

* **CostCentreTag** - Used for cost tracking (automatically applied to instances)

* **CustomerUserdata** - Additional customer User data. Leave blank for none. If it is to be used, you must supply the script address from an S3 bucket.
  * "https://s3-ap-southeast-2.amazonaws.com/**bucket-Name**/customer-userdata.sh"
      
* **ASGMax** - Maximum Instances in ASG

* **ASGMin** - Minimum Instances in ASG

* **accessKeyId** - accesskeyid for additional customer userdata scripts. 
  * This is only to be used if "AWS::CloudFormation::Authentication" was needed. In my situation it was (wont go into detail). It is greatly advised to use an IAM instance profile role for access to the script instead.
 
* **secretKey** - secretKey for additional customer userdata scripts. 
  * This is only to be used if "AWS::CloudFormation::Authentication" was needed. In my situation it was (wont go into detail). It is greatly advised to use an IAM instance profile role for access to the script instead.

* **bucket** - bucket that contains userdata scripts.