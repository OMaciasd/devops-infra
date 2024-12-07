# **🚀 Project Deployment Guide: Vue Frontend & Java Microservices on AWS**

![aws-4][aws-4]

---

## **📚 Contents**

- [**🚀 Project Deployment Guide: Vue Frontend \& Java Microservices on AWS**](#-project-deployment-guide-vue-frontend--java-microservices-on-aws)
  - [**📚 Contents**](#-contents)
  - [**📖 Introduction**](#-introduction)
  - [**🔧 Prerequisites**](#-prerequisites)
  - [**🚀 Steps for Deployment**](#-steps-for-deployment)
    - [**🖼️ Step 1: Setup Frontend**](#️-step-1-setup-frontend)
    - [**🔧 Step 2: Setup Backend Microservices**](#-step-2-setup-backend-microservices)
    - [**🌐 Step 3: Configure Infrastructure with Terraform**](#-step-3-configure-infrastructure-with-terraform)
  - [**🛡️ Monitoring and Security**](#️-monitoring-and-security)
  - [**🌟 Benefits of the Setup**](#-benefits-of-the-setup)
  - [📌 Conclusion](#-conclusion)
  - [**Vuex Authentication**](#vuex-authentication)
    - [**Authentication with Vuex**](#authentication-with-vuex)
      - [**Authentication Flow**](#authentication-flow)
      - [**Vuex Store Configuration**](#vuex-store-configuration)

---

## **📖 Introduction**

This project provides a comprehensive guide to deploying a 🌐 Vue.js frontend and 🔧 Java-based microservices backend on AWS using best practices for DevOps and Infrastructure as Code (IaC). The solution includes CI/CD pipelines for automation and monitoring for performance and security.

---

## **🔧 Prerequisites**

1. **🛠 Technical Knowledge**:

   - Familiarity with Vue.js, Java Spring Boot, Docker, Terraform, and AWS.

2. **⚙️ Required Tools**:

   - Terraform and AWS CLI installed and configured.

   - Docker installed locally for image creation.

   - GitHub repository access for source code management.

3. **🌐 AWS Resources**:

   - IAM roles with permissions for ECS, S3, and CodePipeline.

   - Pre-created S3 bucket for frontend hosting.

   - ECR repository for Docker images.

---

## **🚀 Steps for Deployment**

### **🖼️ Step 1: Setup Frontend**

1. **📂 Prepare the Vue Application**:

   - Clone the Vue.js repository:

     ```bash
     git clone https://github.com/omaciasd/frontend-vue.git
     cd frontend-vue

     ```

   - Build the application:

   ![npm][npm]

     ```bash
     npm install
     npm run build

     ```

2. **🗂️ Deploy to S3**:

   - Sync the `dist/` folder to the S3 bucket:

     ```bash
     aws s3 sync dist/ s3://frontend-vue-app --acl public-read

     ```

3. **✅ Verify Deployment**:

   - Access the application via the S3 bucket's public URL.

---

### **🔧 Step 2: Setup Backend Microservices**

1. **📂 Prepare Microservices**:

   - Clone and build each microservice:

     ```bash
     git clone https://github.com/omaciasd/service-a.git
     cd service-a
     mvn clean package

     ```

2. **🐳 Dockerize and Push to ECR**:

   - Build and tag the Docker image:

     ```bash
     docker build -t service-a .
     docker tag service-a:latest <AWS_ACCOUNT_ID>.dkr.ecr.us-east-1.amazonaws.com/service-a:latest
     docker push <AWS_ACCOUNT_ID>.dkr.ecr.us-east-1.amazonaws.com/service-a:latest

     ```

---

### **🌐 Step 3: Configure Infrastructure with Terraform**

1. **📦 Initialize Terraform**:

   - Navigate to the Terraform directory and initialize:

     ```bash
     cd devops-infra/terraform
     terraform init

     ```

2. **🚀 Apply the Configuration**:

   - Deploy the resources:

     ```bash
     terraform plan
     terraform apply

     ```

---

## **🛡️ Monitoring and Security**

1. **📊 CloudWatch Metrics**:

   - Enable ECS metrics and create alarms for high CPU or memory usage.

2. **🔒 Security Best Practices**:

   - Use IAM roles for ECS tasks.

   - Encrypt sensitive data with AWS Secrets Manager.

---

## **🌟 Benefits of the Setup**

- **⚡ Scalable Infrastructure**: Easily handle traffic spikes with ECS and S3.

- **🤖 Automated Pipelines**: Streamlined development lifecycle with GitHub Actions.

- **🔍 Comprehensive Monitoring**: CloudWatch for real-time insights.

---

## 📌 Conclusion

This deployment guide offers a robust solution for managing both the **frontend Vue.js** application and **Java microservices** on AWS, leveraging **Terraform** for infrastructure provisioning and **CI/CD pipelines** for automation. The setup ensures scalability, security, and a streamlined development process.

---

## **Vuex Authentication**

### **Authentication with Vuex**

For this project, **Vuex** is used to manage the authentication state of the user. The user must log in before being able to access any protected routes like **Home**, **About**, or **Contact**.

#### **Authentication Flow**

1. **Login**:

   - The user logs in via the **Login.vue** component.

   ![login][login]

   - Upon login, the user state is set in **Vuex** using the `setUser` action.

   - The user is then redirected to the **Home** route.

   ![app][app]

2. **Protected Routes**:

   - Routes such as **Home**, **About**, and **Contact** are protected by a **Vue Router navigation guard**.

   - If the user is not authenticated (i.e., the `user` state is `null`), the user is redirected to the login page.

3. **Logout**:

   - The user can log out via the **UserProfile.vue** component.

   - Upon logout, the `clearUser` action in Vuex is called to clear the user state, and the user is redirected back to the login page.

#### **Vuex Store Configuration**

The Vuex store is used to manage the authentication state of the user.

[aws-4]: ../assets/images/aws/aws-4.png
[login]: ../assets/images/vue/login.png
[app]: ../assets/images/vue/app.png
[npm]: ../assets/images/vue/npm.png
