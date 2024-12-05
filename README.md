# 🚀 DevOps Project for Microservices and Frontend Deployment in AWS

![aws][aws]

This project focuses on deploying a microservices-based backend and a Vue.js frontend using AWS services. It incorporates CI/CD pipelines, container orchestration, and infrastructure automation to ensure scalability, security, and streamlined deployments.

---

## 🗂️ Table of Contents

- [🚀 DevOps Project for Microservices and Frontend Deployment in AWS](#-devops-project-for-microservices-and-frontend-deployment-in-aws)
  - [🗂️ Table of Contents](#️-table-of-contents)
  - [📖 Project Description](#-project-description)
    - [🎯 Objectives](#-objectives)
    - [📂 Project Structure](#-project-structure)
  - [✅ Requirements](#-requirements)
  - [🔧 Installation and Setup](#-installation-and-setup)
    - [🔄 Clone the Repositories](#-clone-the-repositories)
  - [⚙️ Initialize Terraform](#️-initialize-terraform)
    - [📋 Review the Infrastructure Plan](#-review-the-infrastructure-plan)
    - [⚡ Apply Infrastructure](#-apply-infrastructure)
    - [🔍 Verify the Created Resources](#-verify-the-created-resources)
  - [⚙️ CI/CD Pipelines Overview](#️-cicd-pipelines-overview)
  - [📦 Deploying Microservices and Frontend](#-deploying-microservices-and-frontend)
    - [Frontend](#frontend)
    - [Backend](#backend)
  - [📈 Benefits](#-benefits)
  - [🏗️ Architecture](#️-architecture)
  - [🤝 Contributing](#-contributing)
  - [📜 License](#-license)

---

## 📖 Project Description

This project involves the deployment of a Vue.js frontend and a backend composed of multiple microservices in AWS. It integrates CI/CD pipelines, Terraform for Infrastructure as Code (IaC), and monitoring tools to ensure operational efficiency.

### 🎯 Objectives

1. **Deploy Microservices Backend**: Utilize ECS to orchestrate Dockerized Java microservices.

2. **Frontend Hosting**: Deploy a Vue.js application on AWS S3 with public access.

3. **Infrastructure Automation**: Leverage Terraform to provision AWS resources.

4. **CI/CD Pipelines**: Automate build, test, and deployment processes using GitHub Actions.

---

### 📂 Project Structure

```plaintext
.
├── frontend-vue/
│   ├── src/
│   ├── .github/workflows/
│   │   └── deploy-to-s3.yml
├── backend-services/
│   ├── service-a/
│   ├── service-b/
│   ├── service-c/
│   ├── service-d/
│   └── .github/workflows/
│       └── ci-cd-backend.yml
├── devops-infra/
│   ├── terraform/
│   │   ├── ecs/
│   │   ├── s3/
│   │   ├── network/
│   │   └── variables.tf
├── README.md

```

---

## ✅ Requirements

- **[AWS CLI](https://aws.amazon.com/cli/)**: Manage AWS resources.
- **[Terraform](https://www.terraform.io/)**: Automate infrastructure provisioning.
- **[Docker](https://www.docker.com/)**: Build and manage containers.
- **[GitHub Actions](https://github.com/features/actions)**: Automate CI/CD workflows.
- **[Java](https://www.oracle.com/java/)**: For backend services.
- **[Node.js](https://nodejs.org/)**: For frontend build tools.

---

## 🔧 Installation and Setup

### 🔄 Clone the Repositories

```bash
git clone https://github.com/omaciasd/frontend-vue.git
git clone https://github.com/omaciasd/backend-services.git
git clone https://github.com/omaciasd/devops-infra.git

```

---

## ⚙️ Initialize Terraform

Run this command to prepare the Terraform environment and install the required modules:

```bash
terraform init

```

- Download required modules: Fetches all necessary modules defined in the Terraform configuration files.

- Configure the backend: Initializes the backend to store the remote state (if configured).

- Validate configurations: Ensures that all .tf files are compatible and ready for use.

---

### 📋 Review the Infrastructure Plan

This command generates a plan that shows the resources that will be created or updated.

```bash
terraform plan

```

---

### ⚡ Apply Infrastructure

Run the following command to create the resources in AWS:

```bash
terraform apply

```

Make sure to confirm by typing yes when Terraform prompts for approval.

---

### 🔍 Verify the Created Resources

Access the AWS Management Console and confirm that the services (S3, ECS, RDS, etc.) have been provisioned as expected.

---

## ⚙️ CI/CD Pipelines Overview

The project uses GitHub Actions for CI/CD workflows:

- **Frontend Pipeline**: Builds the Vue.js application and deploys it to an S3 bucket.

- **Backend Pipeline**: Builds Docker images for the microservices, pushes them to ECR, and deploys them on ECS.

---

## 📦 Deploying Microservices and Frontend

### Frontend

Run the GitHub Action workflow located in `frontend-vue/.github/workflows/deploy-to-s3.yml`.

### Backend

Run the workflows located in `backend-services/.github/workflows/ci-cd-backend.yml`.

---

## 📈 Benefits

- **Scalability**: Backend services managed on ECS with load balancing.
- **Automation**: Streamlined CI/CD pipelines for efficient deployments.
- **Security**: Integrated IAM roles and security groups for resource isolation.

---

## 🏗️ Architecture

![aws2][aws2]

The architecture incorporates:

- **S3 Bucket**: For static website hosting.

- **ECS Cluster**: For backend microservices.

- **RDS**: For database management.

- **CI/CD Pipelines**: Automated with GitHub Actions.

For more details, refer to the [Architecture Guide](./docs/guides/ARCHITECTURE.md).

---

## 🤝 Contributing

To contribute to this project, please check out our [Contribution Guide](./docs/guides/CONTRIBUTING.md) for instructions on setting up your development environment and the process for submitting contributions.

---

## 📜 License

This project is licensed under the MIT License. See the [LICENSE](./LICENSE) file for details.

---

[aws]: ./docs/assets/images/aws/aws.png
[aws2]: ./docs/assets/images/aws/aws-2.png
