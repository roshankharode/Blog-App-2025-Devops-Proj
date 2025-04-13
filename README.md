📦 Full DevOps Automation Pipeline with AWS, Terraform, Jenkins & Docker


🚀 Overview
This project demonstrates a complete CI/CD pipeline built using Jenkins, Terraform, AWS, Docker, and Bash scripts. It automates:

Infrastructure provisioning with Terraform

Docker image building & pushing to Docker Hub

Deployment via Jenkins Pipelines

Everything is connected in an efficient, hands-free CI/CD workflow.



🔧 Tech Stack
•  Terraform – Infrastructure as Code for provisioning AWS resources
•  AWS – Hosting for EC2, IAM roles.
•  Jenkins – CI/CD automation
•  Docker – Containerization and image management
•  Docker Hub – Image registry
•  Bash – Shell scripts to automate commands
•  CMD – Running scripts and infrastructure commands

🛠️ Setup Instructions
1️⃣ Clone Below Repo in your local Machine
```
git clone -b master https://github.com/roshankharode/Blog-App-2025-Devops-Proj.git
cd Blog-App-2025-Devops-Proj/Terraform/
```

![image](https://github.com/user-attachments/assets/457651bb-3b51-42be-82aa-5085c269ac05)

2️⃣ Create a terraform.tfvars File
Inside the Terraform/ folder, create a file named terraform.tfvars and add your AWS IAM credentials like below:

```
access_key = "your-access-key"
secret_key = "your-secret-key"
```

![image](https://github.com/user-attachments/assets/ebbdf37f-86a8-4733-8b02-f019f09dc91a)

3️⃣ Generate an SSH Key
```
ssh-keygen -t rsa -b 4096 -f ./ssh_key
```
Press enter Until SSH key Creation

![image](https://github.com/user-attachments/assets/e537aa0c-e0f3-4e71-bbce-2838366ffa0f)

After Creation Run Step Commands

4️⃣ Provision Infrastructure with Terraform
Initialize and apply Terraform scripts:

![image](https://github.com/user-attachments/assets/1dc2ab5a-1a6b-4e15-ae18-227cd5c0ba66)

```
terraform init
terraform apply
```
After running above  commands you will get IP Address as output libe below

![image](https://github.com/user-attachments/assets/60e2d449-7820-486a-b43d-2bea78047fbf)

Also check your AWS EC2 console:

![image](https://github.com/user-attachments/assets/b2836a11-3cf4-4dfa-b78d-631b88f70349)


5️⃣ Connect to the EC2 Instance via SSH
Replace <YOUR-IP> with the actual public IP from Terraform:
```
ssh -i "ssh_key" ubuntu@<Your IP Address>
```
![image](https://github.com/user-attachments/assets/32483edb-e19f-470b-aa6c-ab58a43f9112)

Now Succesfullly Infra created and connected

6️⃣ Install Jenkins and Prerequisites
On the EC2 instance:

```
git clone -b master https://github.com/roshankharode/Blog-App-2025-Devops-Proj.git
cd Blog-App-2025-Devops-Proj
bash Jenkins_Installtion.sh
```
![image](https://github.com/user-attachments/assets/0cdf75d2-c862-4cc9-a8f8-ee5b6c96fe28)

7️⃣ Jenkins Initial Setup
Get the initial admin password:
```
sudo cat /var/lib/jenkins/secrets/initialAdminPassword

```
Paste it into the Jenkins setup UI:

![image](https://github.com/user-attachments/assets/c3cc0968-a94f-4b4b-93b3-167ca11455ab)

Enter Passworrd in Administration feild

![image](https://github.com/user-attachments/assets/5186b71e-1976-475c-8f9c-bd95c4de6460)


![image](https://github.com/user-attachments/assets/29dde65c-896c-4071-afb2-9dd68b9d0e27)

Continue with setup:

Install suggested plugins

Create admin user

Access the Jenkins dashboard

![image](https://github.com/user-attachments/assets/6b964f1d-1d12-48b9-b44d-1e2190d39cbd)

![image](https://github.com/user-attachments/assets/4417dff9-2561-4663-b5f6-d541649f2d63)

Create user using your Credintials to set Usernname and Password

![image](https://github.com/user-attachments/assets/15477b76-411d-4912-a638-ed5266e516f2)

🧱 Create a Jenkins Pipeline
Click New Item in Jenkins dashboard

Choose Pipeline, give it a name

![image](https://github.com/user-attachments/assets/78150cda-6635-4ed7-85d0-1218d0bb845c)

Click Apply > Save

![image](https://github.com/user-attachments/assets/be901165-a7e3-4b67-a895-c9b68d2b1c15)

in Pipeline put script from cloned repo as name as Jenkins File

![image](https://github.com/user-attachments/assets/f593a58b-084f-4774-9ee7-f991992b35f1)

and Insert in Pipleine code and click on apply > save

![image](https://github.com/user-attachments/assets/d168584e-265d-4348-af3f-c8dbed2c3a3e)

🔐 Grant Jenkins Permission to Run Sudo Commands
Edit the sudoers file:

```
sudo visudo
```
Add this line at the bottom:
```
jenkins ALL=(ALL) NOPASSWD:ALL
```
Save using:

Ctrl + O

Press Enter

Ctrl + X

![image](https://github.com/user-attachments/assets/7eb567f9-aa6e-4067-a3a4-dec3e7aff5ab)

G🔑 Configure Docker Hub Credentials in Jenkins
Go to Manage Jenkins > Credentials > Global

Add new credentials:

ID: docker-hub-creds

Username: Your Docker Hub username

Password: Docker Hub access token

![image](https://github.com/user-attachments/assets/9844eab2-4540-4299-b6de-416666bcdb60)

📦 Install Required Jenkins Plugins
Install these plugins:

Pipeline Stage View

Docker

Then restart Jenkins:

![image](https://github.com/user-attachments/assets/21613ae0-87fc-4ce9-9aec-04ab4380dc05)


![image](https://github.com/user-attachments/assets/91bb8e4b-596f-4ef8-b21e-24cd96676464)

🧪 Before Runing the Pipeline
🏗️ Create Two Repositories on Docker Hub
frontend

backend

Both should be empty initially:

![image](https://github.com/user-attachments/assets/fe1d340e-74e1-4cad-8fea-8940adc2cd2b)

Both are blanks now 

![image](https://github.com/user-attachments/assets/5937c2fe-4c8d-4ce9-8f1d-724435bd5497)


🧩 Trigger Jenkins Build
Click Build With Parameters

Fill in your preferred tags or versions

![image](https://github.com/user-attachments/assets/8d9a187e-17b4-4277-babb-ea5912def005)

✅ Observe the Pipeline
The stages will appear one by one:
![image](https://github.com/user-attachments/assets/674bae4c-981b-4b14-a52f-5dd6d02cda1f)

it will shown in Stage view as we installled plugin previously

![image](https://github.com/user-attachments/assets/ade40e94-16bc-4d51-8c82-f0a5b99b1928)

Check logs via Console Output:

![image](https://github.com/user-attachments/assets/95cb12be-ccdc-413a-9d9d-9e7ca3914e1c)

On success, all steps turn green:

![image](https://github.com/user-attachments/assets/dc9084a6-2436-4c8d-9182-23dab043b857)


📤 Docker Hub: Image Uploaded
Check your Docker Hub:

- Frontend
![image](https://github.com/user-attachments/assets/ebc3563d-4aa3-48ed-b74e-e38157ce0d0d)

- Backend
![image](https://github.com/user-attachments/assets/d394b045-2502-45c6-8d29-707c4e72bf92)

🎉 Application Deployed Successfully
You can now access the application running on your server!

![image](https://github.com/user-attachments/assets/7390cc93-a000-4d41-b014-21872bdce0ea)


![image](https://github.com/user-attachments/assets/1da605b2-ce0f-4516-9c50-ce2eeab5d3ab)

![image](https://github.com/user-attachments/assets/a3c274cb-a244-4df3-be14-75d3d66e997a)


✅ Final Suggestions
Secure your terraform.tfvars using .gitignore

Always use access tokens instead of passwords

Back up your ssh_key securely


   
