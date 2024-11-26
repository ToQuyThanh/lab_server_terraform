# lab_server_terraform

This repository contains Terraform scripts to set up an AWS EC2 instance with secure access using a PEM SSH key.

---

## **Generate SSH Key PEM**

To access the EC2 instance, you need to generate a PEM-format SSH key. Use the following command to generate the key:

```bash
ssh-keygen -m PEM -t rsa -b 4096 -C "this@email.com" -f "D:\Thanh\SSH\lab1_key"
```

### **Explanation of the Command:**
- `-m PEM`: Specifies the key format as PEM, required for EC2 access.
- `-t rsa`: Generates an RSA key.
- `-b 4096`: Sets the key length to 4096 bits for better security.
- `-C "this@email.com"`: Adds a comment (your email) to the key for identification.
- `-f "D:\Thanh\SSH\lab1_key"`: Specifies the file path and name for the key.

---

## **Terraform Setup**

### **Steps to Deploy:**

1. **Install Terraform**:  
   Download and install Terraform from [Terraform's official website](https://www.terraform.io/downloads).

2. **Configure AWS Credentials**:  
   Make sure your AWS credentials are configured. Use the AWS CLI or create an access key and set it up:
   ```bash
   aws configure
   ```

3. **Edit Variables**:  
   Update the necessary variables in `variables.tf` (e.g., region, instance type, key name).

4. **Initialize Terraform**:  
   Run the following command to initialize the Terraform working directory:
   ```bash
   terraform init
   ```

5. **Validate Configuration**:  
   Check for any syntax errors in the configuration files:
   ```bash
   terraform validate
   ```

6. **Apply Terraform Plan**:  
   Deploy the infrastructure using:
   ```bash
   terraform apply
   ```

   Confirm the deployment when prompted by typing `yes`.

---

- Keep the private key (`lab1_key`) secure and do not share it.
- Ensure the security group allows access to port 22 for SSH.
- Always follow best practices for managing AWS credentials and resources.

---

## **Cleanup**

To destroy the infrastructure and avoid unnecessary costs, use:
```bash
terraform destroy
```
