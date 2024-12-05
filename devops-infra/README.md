# Project Overview

**Description**:

This project is a web application that integrates a **Frontend** developed with **Vue.js**, a **Backend** consisting of **4 Java microservices**, and an automated **CI/CD pipeline** using **AWS**, **Terraform**, and **Docker**. The architecture is scalable, secure, and designed for integration in a **multi-cloud** environment.

---

## Table of Contents

- [Project Overview](#project-overview)
  - [Table of Contents](#table-of-contents)
  - [Project Description](#project-description)
  - [Technologies Used](#technologies-used)
  - [Project Structure](#project-structure)
  - [Prerequisites](#prerequisites)
  - [Project Setup](#project-setup)
    - [**Frontend**](#frontend)
    - [**Backend**](#backend)
    - [**Terraform**](#terraform)
  - [Deployment](#deployment)
    - [**Deployment on AWS with Terraform**](#deployment-on-aws-with-terraform)
  - [CI/CD Pipeline](#cicd-pipeline)
  - [Testing](#testing)
    - [**Unit Tests**](#unit-tests)
    - [**Integration Tests**](#integration-tests)
  - [Monitoring and Security](#monitoring-and-security)
    - [**Alerts and Security**](#alerts-and-security)
  - [Disaster Recovery](#disaster-recovery)
    - [**Backup and Failover**](#backup-and-failover)
  - [Contributing](#contributing)
  - [License](#license)

---

## Project Description

This project implements a solution based on **microservices** using **Vue.js** for the frontend and **Java** for the backend, deployed on **AWS** using **Docker** containers. The infrastructure and deployment are automated using **Terraform** and **GitHub Actions**.

The application is designed to be **scalable**, **resilient**, and **secure**, and is prepared for **disaster recovery** using **AWS Route 53** and **AWS Glacier** for long-term backups.

---

## Technologies Used

- **Frontend**:

  - Vue.js
  - HTML/CSS
  - Axios for API consumption

- **Backend**:

  - Java (Spring Boot)
  - Docker for containers
  - AWS Lambda for serverless functions

- **Infrastructure and Orchestration**:

  - **AWS** (EC2, S3, Lambda, RDS, Route 53)
  - **Terraform** for infrastructure as code
  - **Docker** for containers
  - **ECS** for container orchestration
  - **GitHub Actions** for CI/CD

- **Security**:

  - IAM Roles for access control
  - SSL/TLS on the applications with **Certbot**

- **Monitoring**:

  - **Prometheus** for metrics
  - **Grafana** for data visualization
  - **CloudWatch Logs** for event logging

- **Disaster Recovery**:

  - **S3 Glacier** for long-term backups
  - **Route 53** for failover DNS

---

## Project Structure

The project is divided into the following main components:

```plaintext
.                                   # Root of the project
├── frontend-vue                    # Frontend source code (Vue.js)
│   ├── src                         # Source code for the Vue.js application
│   ├── public                      # Static assets like images and fonts
│   └── Dockerfile                  # Docker configuration for the frontend container
│
├── backend                         # Java Microservices (Spring Boot)
│   ├── microservice-1              # First Java microservice
│   ├── microservice-2              # Second Java microservice
│   ├── microservice-3              # Third Java microservice
│   ├── microservice-4              # Fourth Java microservice
│   └── Dockerfile                  # Docker configuration for the backend containers
│
├── terraform                       # Infrastructure as Code (Terraform)
│   ├── modules                     # Reusable Terraform modules
│   └── main.tf                     # Main Terraform configuration file
│
├── scripts                         # Additional scripts (deployment, maintenance)
│   ├── deploy.sh                   # Deployment script
│   └── setup.sh                    # Setup script
│
├── .github                         # CI/CD pipeline configuration (GitHub Actions)
│   └── workflows                   # Folder with GitHub Actions workflows
│       └── ci-cd.yml               # CI/CD workflow configuration file
│
└── README.md                       # This file (README.md)

```

---

## Prerequisites

Before running the project, make sure you have the following installed:

- **AWS CLI**: To interact with AWS infrastructure.
- **Docker**: To build containers for the applications.
- **Terraform**: To manage infrastructure as code.
- **Node.js**: To run the Vue.js-based frontend.
- **Java**: To compile and run the backend microservices.

---

## Project Setup

### **Frontend**

1. Navigate to the frontend directory:

   ```bash
   cd frontend-vue

    ```

2. Install the required dependencies:

   ```bash
   npm install

    ```

3. Run the project locally:

   ```bash
   npm run serve

    ```

---

### **Backend**

1. Navigate to the frontend directory:

   ```bash
   cd backend-service/main/java/run/com/example/servicea/

    ```

2. Compile and run the service:

   ```bash
   mvn spring-boot:run

    ```

---

### **Terraform**

1. Initialize the Terraform directory:

   ```bash
   terraform init

    ```

---

## Deployment

### **Deployment on AWS with Terraform**

1. Create an AWS account or use an existing one.

2. Configure AWS credentials:

   ```bash
   aws configure


    ```

3. Run Terraform to deploy the infrastructure to AWS:

   ```bash
   terraform apply

    ```

---

## CI/CD Pipeline

The project uses GitHub Actions for CI/CD automation. The workflow is defined in .github/workflows/ci-cd.yml.

1. CI/CD Pipeline: Every time a push is made to the main branch, the pipeline is automatically triggered:

   - **Linting** and Testing of the code.
   - **Build** of Docker images.
   - **Deployment** to AWS ECS for the backend and S3 for the frontend.

2. To view the pipeline status, go to the Actions tab in the GitHub repository.

---

## Testing

### **Unit Tests**

Each backend microservice includes unit tests that are automatically executed in the CI pipeline.

### **Integration Tests**

Integration tests are done using Postman and Swagger to simulate interactions between the microservices and the API.

---

## Monitoring and Security

The project is configured for continuous monitoring using Prometheus and Grafana. Metrics include microservice performance, database status, and frontend traffic metrics.

1. Prometheus collects metrics from AWS CloudWatch and the microservices.
2. Grafana visualizes these metrics in interactive dashboards.

### **Alerts and Security**

- Alerts are configured in Grafana to notify about any anomalies in the infrastructure, such as CPU or memory spikes.

- SSL/TLS is implemented on the frontend using Certbot.

---

## Disaster Recovery

### **Backup and Failover**

- AWS Route 53 is used to handle failover between regions. If one region goes down, the traffic is automatically redirected to another region.

- Data is backed up in S3 and archived in S3 Glacier for long-term recovery.

---

## Contributing

If you'd like to contribute to the project, please follow these steps:

- Fork the repository.
- Create a new branch (feature/my-feature).
- Make your changes and commit them with a clear message.
- Push to your branch.
- Open a Pull Request explaining the changes you've made.

---

## License

If you'd like to contribute to the project, please follow these steps:

This project is licensed under the MIT License. See the LICENSE file for more details.

---
