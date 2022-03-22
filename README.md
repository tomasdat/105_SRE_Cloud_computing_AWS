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