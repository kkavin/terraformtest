# I have used Terraform as IAC for creating infrastructure in AWS

Tools & Cloud Used for this project
1. Amazon Web Services
2. Terraform
3. Docker
4. Docker-Compose
5. Shell Script

## Terraform Scripts   - Total Hours 3 Hours
# 1. Version.tf
Version tf will do the below mentioned steps
1. Terraform  Block - This block contain a number of settings related to Terraform's behavior
2. Provider Block - Provider plugins like the AWS provider

# 2.VPC.tf
This is the resource block where we will be creating the resources in AWS
VPC.tf - > Creating VPC,subnets,Internet gateway,Route table,Security groups

# 3.ec2.tf
Resource block to create EC2-Instance
Creating t2.medium ec2-instance 
Userdata - In this section we will be installing Docker, Docker-Compose, Git, Screen & other utils  # Total Hours - 30 Mins

# 4.elastic-ip.tf
Resource block to create the Elastic IP during the instance launch




# Steps followed for deploying the application
1. Created t2.medium instances via terraform
2. Installed Docker, Docker-Compose, git, screen & utiils via bash script through user-data while launching the ec2-instance
3. Once the instance is launched the above mentioned tools will be installed 
4. The test code will be cloned via git inside the ec2-instance and the make script will run in the background



# How to run
1. Create EC2-instance in the AWS account
2. Install Terraform latest version inside the ec2-instance
3. Configure the IAM credentials inside the ec2-instance
4. Create a folder and terraform files 
5. Run the following commands:
   1. terraform init - Initialize the terraform folder it will download all the plugins which is related to AWS
   2. terraform plan - Command to create an execution plan
   3. terraform apply - Creates the resources for the execution plan
