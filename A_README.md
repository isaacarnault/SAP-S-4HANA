[![Project Status: Active – The project has reached a stable, usable state and is being actively developed.](https://www.repostatus.org/badges/latest/active.svg)](https://www.repostatus.org/#active)

[![isaac-arnault-SAP.jpg](https://i.postimg.cc/6qhJFQs5/isaac-arnault-SAP.jpg)](https://postimg.cc/H8jhydsf)

These artefacts are intented to help you provision a SAP S/4HANA Public Cloud edition on AWS and to provision an AWS RDS (SQL Server database) along with our SAP installation.

<hr>

The testing and GitHub documentation were technically performed by `Isaac Arnault`, EMEA Managing Director for Data, AI and Analytics at `HUBIA` (Consulting IT firm for Data, AI, BI and Analytics) in France.<br>This gist is mainly dedicated to HUBIA's Clients' teams and its prospective customers. <br>

Follow Isaac Arnault on GitHub: https://github.com/isaacarnault and https://isaacarnault.github.io/.

<hr>

Without any further due let's get started.<br>
To deploy SAP S/4HANA on the AWS Cloud using Terraform, you'll need to create several configuration files.

****Existing Files****<br>
- main.tf: This is the primary configuration file where you define your providers, resources, and modules.<br>
- variables.tf: This file contains all the variables used in your configuration.<br>
- outputs.tf: This file defines the outputs of your Terraform configuration.<br>
- providers.tf: This file specifies the providers you will use (e.g., AWS).<br>
- ec2.tf: This file defines the EC2 instances for SAP S/4HANA.<br>
- security_groups.tf: This file defines the security groups and rules.<br>

****Additional Files****<br>
- rds.tf: This file configures an RDS instance running SQL Server, which will serve as the database for SAP S/4HANA.<br>
- userdata.sh: This script runs on the EC2 instance after it’s launched to install and configure SAP S/4HANA and connect it to the SQL Server database.<br>
- sap_installation.tf: This file provisions the EC2 instance for SAP S/4HANA and uses the user data script to handle the post-deployment configuration.<br>

***Modules Directory***<br>
- modules/ec2/main.tf: This file defines the EC2 instance resource for SAP S/4HANA, specifying the AMI ID, instance type, key name, and security group IDs.<br>
- modules/ec2/variables.tf: This file contains the variables used in the EC2 module configuration.<br>

## Author
* **Isaac Arnault** - Suggesting a way to deploy a databricks cluster on [Azure](https://azure.microsoft.com)

## License
All public gists https://gist.github.com/aiPhD<br>
Copyright 2024, Isaac Arnault<br>
MIT License, http://www.opensource.org/licenses/mit-license.php
