# Main Resources and Their Relationships

## VPC
- Contains all networking components and resources.
- Segmented into public and private subnets.

## Subnets

### Public Subnets:
- Host resources that need direct access to the internet, such as NAT Gateway.

### Private Subnets:
- Host resources that should not be directly accessible from the internet, such as EC2 instances running SAP S/4HANA and the RDS database.

## Internet Gateway
- Attached to the VPC to provide internet connectivity to instances in public subnets.

## NAT Gateway
- Placed in a public subnet to allow instances in private subnets to connect to the internet for updates or other needs without exposing them to direct internet access.

## Security Groups

### SAP S/4HANA Security Group:
- Allows traffic on ports needed for SAP application (e.g., SSH (22), HTTP (80)).

### SQL Server Security Group:
- Allows traffic on port 1433 for SQL Server communication.

## EC2 Instances
- Deployed in private subnets to run the SAP S/4HANA application.
- Configured using a user data script to install and set up SAP S/4HANA.

## RDS Instance
- Deployed in private subnets with SQL Server engine.
- Configured with appropriate security groups to allow communication with SAP S/4HANA EC2 instances.

## Key Pair
- Used to SSH into the EC2 instances for management and configuration.

## IAM Roles and Policies
- Applied to EC2 instances and other resources to manage permissions and access control.

# AWS Solution Architecture Diagram

To visually represent the architecture, here is a textual description that can be used to create an architecture diagram:

1. **VPC** with a CIDR block, divided into multiple subnets.
2. **Public Subnets** containing:
   - **NAT Gateway** connected to the **Internet Gateway**.
3. **Private Subnets** containing:
   - **EC2 Instances** for SAP S/4HANA.
   - **RDS Instance** for SQL Server.
4. **Security Groups** attached to the respective instances and RDS:
   - **SAP S/4HANA Security Group** allowing traffic on necessary ports.
   - **SQL Server Security Group** allowing traffic on port 1433.
