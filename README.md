📦 Project Title: Full DevOps Automation Pipeline with AWS, Terraform, Jenkins & Docker

🚀 Overview
This project demonstrates a complete CI/CD pipeline built using Jenkins, Terraform, AWS, Docker, and custom Bash scripts. It automates infrastructure provisioning, builds Docker containers, pushes images to Docker Hub, and deploys the application—all triggered by Jenkins pipelines.


🔧 Tech Stack
•  Terraform – Infrastructure as Code for provisioning AWS resources
•  AWS – Hosting for EC2, IAM roles.
•  Jenkins – CI/CD automation
•  Docker – Containerization and image management
•  Docker Hub – Image registry
•  Bash – Shell scripts to automate commands
•  CMD – Running scripts and infrastructure commands

🛠️ Setup Instructions
1. Clone Below Repo in your local Machine
```
git clone -b master https://github.com/roshankharode/Blog-App-2025-Devops-Proj.git
cd Blog-App-2025-Devops-Proj/Terraform/
```
![image](https://github.com/user-attachments/assets/457651bb-3b51-42be-82aa-5085c269ac05)

After importing code In Terraform folder Create terraform.tfvars with below code file in current folder to add access key and private key which is created in IAM role in AWS
![image](https://github.com/user-attachments/assets/ebbdf37f-86a8-4733-8b02-f019f09dc91a)
After creating terraform.tfvars file create SSH key in your folder Run Below command
```
ssh-keygen -t rsa -b 4096 -f ./ssh_key
```
enter enter until creation
![image](https://github.com/user-attachments/assets/6db9b97e-c625-4b51-8ed6-0e4983bbe55d)

![image](https://github.com/user-attachments/assets/e537aa0c-e0f3-4e71-bbce-2838366ffa0f)


2. Terraform Infrastructure Provisioning
```
cd terraform/
terraform init
terraform apply
```
![image](https://github.com/user-attachments/assets/f3f0d960-fd2d-4b34-af15-bf995f3292de)

Now Succesfullly Infra created

3.
