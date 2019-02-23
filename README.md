# HA-SFTP
Deploy a HA SFTP Solution via AWS CloudFormation utilising EFS as Shared Storage

# Paramaters
* ImageId - This is the Amazon AMI ID to use within your launch config for your instances

* ELBSubnet1 - ID of the Subnet the instance should be launched in, this will link the instance to the same VPC (ie AZA)
 
* ELBSubnet2 - ID of the Subnet the instance should be launched in, this will link the instance to the same VPC (ie AZB)

* ELBIpAddressType - ELB IP Address type - Leave as ipv4

* InstanceType - Size of desired instances in ASG
       
* InstanceSubnets - Pick 2 different Private Subnets for the Instances within the ASG to be launched into

* KeyName - Key to use for instances

* SSHLocation - The IP address range that can be used to SSH to the EC2 instances

* ListenerPort - Listener Port for Service Behind ELB (ie 80 for Web Server)

* AllowedListenerIp - The IP address range that can be used to access the listener port (ie can access the server)

* MountPoint - The Linux mount point for the EFS volume (call it whever you like)

* CostCentreTag - Used for cost tracking (automatically applied to instances)

* CustomerUserdata - Additional customer User data. Leave blank for none. If it is to be ised, you must supply the sxript address from an S3 bucket.
  * "https://s3-ap-southeast-2.amazonaws.com/**bucket-Name**/customer-userdata.sh"
      












      "ASGMax": {
        "Description": "Maximum Instances in ASG",
        "Type": "String",
        "Default": "2"
      },
      "ASGMin": {
        "Description": "Minimum Instances in ASG",
        "Type": "String",
        "Default": "2"
      },
      "accessKeyId": {
        "NoEcho": "true",
        "Description": "accesskeyid for additional customer userdata scripts",
        "Type": "String"
      },
      "secretKey": {
        "NoEcho": "true",
        "Description": "secretKey for additional customer userdata scripts",
        "Type": "String"
      },
      "bucket": {
        "Description": "bucket that contains userdata scripts",
        "Type": "String"
