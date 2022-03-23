# SRE Intro
## User Journey
### User experience
#### Cloud computing with AWS
##### AWS Services

- creating github repo to to push the markdown doc
- Amazon Web Services (AWS)

### What is an SRE
A group of people that makes sure that whatever is released doesn't crash, and if it does, it is their job to figure out why as quickly as possible so nothing needs to stop operations.

### Benefits of Cloud Computing
- Ease of use
  - don't need to think about buying a whole system, just rent one
  - no need to maintain it either, third-party handles it
- Flexibility
  - scalable
  - regions, availability zones
- Robustness
  - stored separately
- Cost
  - cheaper than in-prem
  - pay as you go

### AWS Global Infrastructure
- An infrastructure of international data center regions, availability zones, CDNs and 200 more fully featured services.
- That provides an easy, secure and reliable cloud platform that is also dynamic and extensible.
- Most popular and used, holds the biggest market share currently

## Regions vs Availability Zones
- Region is where the availability zones are located
- Availability zones is a data center that is managed on-site
- Multiple regions are more costly than multiple availability zones
- AZs are cheaper, but you must have at least two, in case there's a problem with one
  - or potentially lose users, time, and money
- Both regions and AZs can be autoscaled, which means if one doesn't work, another replaces it (after the switching)

### Four Pillars of Cloud Computing
- Performance - scalable by adding nodes
- Security - both physical and virtual
- Reliability - many services offered, e.g. autoscaling, CDN
- Functionality

### What is CDN
- Stands for Content Delivery Network
- The goal is to reduce latency for the end-user by making the connection spatially as close as possible
- It does so by caching content close to the user

### ON-PREM vs HYBRID
- Hybrid cloud refers to a mix of on-prem storage, private cloud services and public cloud services such as AWS.
- more to add later

### ON-PREM vs PUBLIC CLOUD
- On-prem is more secure and reliable but reliant on physical maintenance
- Public cloud removes responsibility and pressure of maintenance
  - it is also easily scalable
---------------------------------------
### Connection between local host and public cloud (AWS)
- requires permissions through roles, ports and keys

### Local Host
- local machine, desktop pc, laptop
- Stores file.pem (in .ssh folder) to access public cloud

### Public Cloud
- AWS
- Needs to be secure
  - Creates aws file.pem as SSH key
  - important, key is not shared with non-authorised parties
- we need to create a virtual machine on the cloud - ec2 (elastic compute service)
  - virtual machine similar to hardware - requires specific components

### How to create AWS virtual machine (EC2 instance)
##### 1. Log into your AWS account
##### 2. Select your desired Availability Zone
![V M2](Readme_Images/VM2.png)
##### 3. Search and select EC2
![V M3](Readme_Images/VM3.png)
##### 4. Launch instance
![V M4](Readme_Images/VM4.png)
##### 5. Select AMI (Amazon Machine Image) - example Ubuntu Server 18.04 LTS
![V M5](Readme_Images/VM5.png)
##### 6. Choose an Instance Type - example t2.micro
![V M6](Readme_Images/VM6.png)
##### 7. Next: Configure Instance Details (network, subnet, auto-assign...)
![V M7](Readme_Images/VM7.png)
##### 8. Next: Add Storage
![V M8](Readme_Images/VM8.png)
##### 9. Next: Add Tags
![V M9](Readme_Images/VM9.png)
##### 10. Next: Configure Security Group
![V M10](Readme_Images/VM10.png)
##### 11. Review and Launch
![V M11](Readme_Images/VM11.png)

### How to connect to AWS through SSH and install nginx
##### 1. Open an SSH client (e.g. gitbash)
![Step 1](Readme_Images/step_1.png)
##### 2. Locate your private key file .pem
![Step 2](Readme_Images/step_2.png)
##### 3. Run command `chmod 400 filename` on the file to make it read-only
![Step 3](Readme_Images/step_3.png)
##### 4. Connect to instance using `ssh -i "filename.pem" user@dns`
![Step 4](Readme_Images/step_4.png)
##### 5. After success, use command `sudo apt update` to fetch the list of available updates
![Step 5](Readme_Images/step_5.png)
##### 6. Upgrade your server using `sudo apt upgrade`, it might take a while
![Step 6](Readme_Images/step_6.png)
##### 7. Install nginx using `sudo apt install nginx` or `sudo apt-get install nginx`
![Step 7](Readme_Images/step_7.png)
##### 8. Open browser and test public IP
![Step 8](Readme_Images/step_8.png)

### Amazon Machine Image (AMI)
- A saved version of your instance, which you can safely terminate after
---------------------------------------
### Linux Command
- How to start a service `sudo systemctl start name_service`
- How to stop a service `sudo systemctl stop name_service`
- How to check status `systemctl status name_service`
- How to enable service `sudo systemctl enable name_service`
- How to install a package `sudo apt-get install package_name -y` or `sudo apt install package_name -y`
- How to remove a package `sudo apt remove package_name -y`
- How to check all process `top`
- Who am I `uname` or `uname -a`
- Where am I `pwd`
- Create a dir `mkdir dir_name`
- How to check `ls` or `ls -a`
- How to create a file `touch name_file` or `nano name_file`
- How to check content of the file witout going inside the file `cat name_file`
- How to move a file `mv file.txt "folder_destination"`
- How to copy a file `cp file.txt "folder_destination"`
- How to delete folder `sudo rm -rf name_folder`

### File permissions
- how to check a file permission `ll`
- change file permission `chmod required_permission file_name`
- write `w` read `r` exe `x`
- https://chmod-calculator.com

### Bash scripting - Automate process with the script

- code block
```bash
# create a file called provision.sh

# it must start with #!/bin/bash
#!/bin/bash

# run updates
sudo apt-get update -y
# run upgrades
sudo apt-get upgrade -y

# install nginx
sudo apt-get install nginx -y

# ensure it's running - start nginx
sudo systemctl start nginx

# enable nginx
sudo systemctl enable nginx
```

- change the file to exe `chmod +x provision.sh`
- how to run an exe file `./provision.sh`

### Bash scripting - TomCat
```bash
#before
#ensure port 8080 is enabled - in AWS, add new security group with inbound port 8080 open
#ensure this file has executable rights: chmod +x nameofthisfile
#run this file: sudo ./nameofthisfile

#actual script
#!/bin/bash

#get updates
sudo apt-get update -y
#get upgrades
sudo apt-get upgrade -y
#install tomcat9
sudo apt-get install tomcat9 -y
#start tomcat9
sudo systemctl start tomcat9
#enable tomcat9
sudo systemctl enable tomcat9
#check if running - optional, remember to ctrl+c to exit
sudo systemctl status tomcat9
```
---------------------------------------
### Technical Interview Preparation
##### What is a VPC
- Stands for Virtual Private Cloud
- Is a a secure, isolated private cloud hosted within a public cloud
- Advantages:
  - Scalability of public cloud computing
  - Data isolation of private cloud computing
  - Better performance, refer scalability
  - Better security overall
- Key technologies include:
  - Internet Gateway
  - Subnets
  - VLAN
  - VPN  
- examples: Amazon VPC (public is AWS), Google Cloud VPC

##### What is Internet Gateway
- A horizontally scaled, redundant and highly available VPC component, EC2 service
- Allows communication between VPC and internet
- For example, allows local computer to connect to EC2 instance
- Requirements:
  - Attached to VPC
  - Router(implicit) and Route tables (subnet)
  - Instances in subnet have a unique IP address
  - Network access control lists and security groups allow traffic

##### What is Route Tables
- A route table contains a set of rules, called *routes*
- Determines where network traffic from your subnet or internet gateway is directed
- Key concepts:
  - Main route table
  - Custom route table
  - Destination - range of IP addresses
  - Target - internet gateway, network interface, or connection
  - Subnet route table
- Each route in a table specifies a destination and a target

##### What is Subnet
- A range of IP addresses within a VPC
- Types: Ipv4 only, Ipv6 only, Both
- Can be public or private (with no internet gateway) or VPN only
- Example: Customer-facing web servers in public subnet, database servers in private subnet
- Uses NACLs to control traffic

##### What is NACLs
- Network access control lists
- An optional layer of security for your VPC
- Acts as firewall for controlling traffic in and out of one or more subnets
- Rules have priorities based on their rule number
- For each rule you have to specify:
  - Rule number, Type, Protocol, Port Range, Source/Destination, Allow/Deny

##### What is Security Group
- Acts as a virtual firewall, controlling in and out traffic of the instance
- A VPC comes with a default security group
- Characteristics:
  - Must have a name and a description
  - You can specify allow rules for inbound and outbound, but not deny
  - For each rule you have to specify Protocol, Port Range, Destination

##### NACLs vs Security Group
| Network ACL                  | Security group                 |
|------------------------------|--------------------------------|
| Operates at the subnet level | Operates at the instance level |
| Supports allow rules and deny rules | Supports allow rules only |
| Is stateless: Return traffic must be explicitly allowed by rules | Is stateful: Return traffic is automatically allowed, regardless of any rules|
| We process rules in order, starting with the lowest numbered rule, when deciding whether to allow traffic | We evaluate all rules before deciding whether to allow traffic |
| Automatically applies to all instances in the subnets that it's associated with (therefore, it provides an additional layer of defense if the security group rules are too permissive) | Applies to an instance only if someone specifies the security group when launching the instance, or associates the security group with the instance later on |

##### How did you secure your app on the public cloud
- Using security groups in our instances and setting inbound rules to allow specific traffic to come through

##### What are the outbound rules for security group by default? And why?
- It's set to All traffic, for Ipv4 and Ipv6.
- We want to ensure that there is outbound communication for our inbound connections.
- We are also less worried about exiting traffic than incoming traffic.

##### What is the command to kill a process in Linux
- `kill -9 <processId>` or `killall -9 process_name` (SIGKILL) - signal kill
- `kill -2 <processId>` or ctrl+c (SIGINT) - signal interrupt
