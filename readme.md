# 🚀 Jenkins CI/CD Pipeline - Roboshop Microservices

## 📋 Project Overview

Enterprise-grade Jenkins CI/CD pipelines for microservices deployment on AWS EKS. This project demonstrates production-ready DevOps practices with automated testing, deployment safety, and rollback mechanisms.

## 🏗️ Architecture

```
┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐
│   CATALOGUE-CI  │───▶│   CATALOGUE-CD  │───▶│   PRODUCTION    │
│   (Build & Push)│    │   (Deploy)      │    │   (Live System) │
└─────────────────┘    └─────────────────┘    └─────────────────┘
```

## 📁 Repository Structure

```
Jenkins/
├── README.md                           # This file
├── Jenkins-practice/                   # Learning pipeline
│   └── Jenkinsfile                    # Simple practice pipeline
├── Jenkins-roboshop/                  # Production pipelines
│   ├── catalogue-ci/                 # Continuous Integration
│   │   ├── Jenkinsfile              # CI Pipeline
│   │   ├── Dockerfile               # Container definition
│   │   ├── package.json            # Node.js dependencies
│   │   └── server.js               # Application code
│   └── catalogue-cd/               # Continuous Deployment
│       ├── Jenkinsfile            # CD Pipeline
│       ├── 01-namespace.yaml      # Kubernetes namespace
│       ├── application.yaml       # K8s application manifest
│       ├── values-dev.yaml       # Dev environment config
│       ├── values-qa.yaml        # QA environment config
│       └── values-prod.yaml      # Production environment config
└── jenkins-roboshop-infra/          # Infrastructure pipelines
    ├── 00-vpc.yml                   # VPC setup
    ├── 10-SG.yml                   # Security groups
    ├── 20-bastion.yml              # Bastion host
    ├── 60-acm.yml                  # SSL certificates
    ├── 70-frontend-alb.yml         # Application load balancer
    └── 80-eks.yml                  # EKS cluster
```

## 🎯 Pipeline Features

### 🔧 CI Pipeline (Continuous Integration)
- **Semantic Versioning**: Reads version from `package.json`
- **Docker Build**: Creates immutable container artifacts
- **Private Registry**: Pushes to AWS ECR with account isolation
- **Security**: Uses IAM roles and private repositories
- **Scalability**: Dedicated Jenkins agents for build isolation

### 🚀 CD Pipeline (Continuous Deployment)
- **Health Checks**: Validates deployment status before proceeding
- **Automatic Rollback**: Helm-based recovery on failure
- **Environment Parity**: Consistent deployment across dev/qa/prod
- **Progressive Testing**: Environment-specific test strategies
- **Zero Downtime**: Kubernetes rolling updates

## 🛠️ Technology Stack

| Component | Technology | Purpose |
|-----------|------------|---------|
| **CI/CD** | Jenkins | Pipeline orchestration |
| **Containers** | Docker | Application packaging |
| **Registry** | AWS ECR | Container image storage |
| **Orchestration** | Kubernetes (EKS) | Container orchestration |
| **Package Manager** | Helm | Kubernetes application management |
| **Cloud Provider** | AWS | Infrastructure platform |
| **Version Control** | Git | Source code management |

## ⚙️ Configuration

### Environment Variables
```groovy
environment {
    ACC_ID = "741448928336"        # AWS Account ID
    REGION = "us-east-1"           # AWS Region
    PROJECT = "roboshop"           # Project name
    COMPONENT = "catalogue"        # Service component
}
```

### AWS Credentials
- **CI Pipeline**: `AWS-VICKY-CRED`
- **CD Pipeline**: `AWS-VICKY-CRED`
- **Infrastructure**: `AWS-VICKY-CRED`

### EKS Cluster Naming Convention
```
${PROJECT}-${ENVIRONMENT}
Examples:
- roboshop-dev
- roboshop-qa  
- roboshop-prod
```

## 🚦 Pipeline Workflow

### CI Pipeline Flow
```
1. Read package.json version
2. Install Node.js dependencies
3. Build Docker image with version tag
4. Push to ECR repository
5. Notify on success/failure
```

### CD Pipeline Flow
```
1. Check current deployment health
2. Rollback if unhealthy
3. Deploy new version to target environment
4. Run environment-specific tests
5. Validate deployment success
6. Handle production change management
```

## 🔒 Security Features

- **Private Container Registry**: AWS ECR with account isolation
- **IAM Integration**: Role-based access control
- **Credential Management**: Jenkins credential store
- **Network Security**: Private EKS clusters
- **Image Scanning**: Container vulnerability assessment

## 🧪 Testing Strategy

### Development Environment
- **Functional Testing**: API endpoint validation
- **Unit Tests**: Component-level testing
- **Smoke Tests**: Basic health checks

### QA Environment  
- **Integration Testing**: Full system testing
- **Performance Testing**: Load and stress testing
- **Security Testing**: Vulnerability scanning

### Production Environment
- **Change Management**: CR approval process
- **Deployment Windows**: Scheduled maintenance windows
- **Rollback Testing**: Disaster recovery validation

## 📊 Monitoring & Observability

### Pipeline Metrics
- **Build Success Rate**: CI pipeline reliability
- **Deployment Frequency**: Release velocity
- **Lead Time**: Code to production time
- **Mean Time to Recovery**: Incident response time

### Application Metrics
- **Health Checks**: Kubernetes readiness/liveness probes
- **Performance**: Response time and throughput
- **Error Rates**: Application error tracking
- **Resource Usage**: CPU, memory, and network metrics

## 🚨 Incident Response

### Automatic Recovery
```groovy
// Health check validation
def deploymentStatus = sh(returnStdout: true, script: "kubectl rollout status...")
if (!deploymentStatus.contains("successfully rolled out")) {
    helm rollback $COMPONENT -n $PROJECT
}
```

### Manual Intervention Points
- **Production Approvals**: Manual gate for prod deployments
- **Change Management**: CR integration for compliance
- **Emergency Rollback**: Override mechanisms for critical issues

## 🎓 Learning Outcomes

### Jenkins Concepts Covered
- **Pipeline as Code**: Declarative pipeline syntax
- **Agent Management**: Labeled agents and distributed builds
- **Credential Management**: Secure secret handling
- **Conditional Execution**: Environment-based logic
- **Input Parameters**: User interaction and approvals
- **Post-build Actions**: Success/failure handling
- **Parallel Execution**: Concurrent stage processing

### DevOps Best Practices
- **Infrastructure as Code**: Terraform and Kubernetes manifests
- **Immutable Deployments**: Container-based artifacts
- **Progressive Delivery**: Environment-based promotion
- **Automated Testing**: Continuous quality assurance
- **Monitoring Integration**: Observability and alerting

## 🤝 Contributing

1. Fork the repository
2. Create feature branch (`git checkout -b feature/pipeline-enhancement`)
3. Commit changes (`git commit -am 'Add new pipeline feature'`)
4. Push to branch (`git push origin feature/pipeline-enhancement`)
5. Create Pull Request

## 📚 References

- [Jenkins Pipeline Documentation](https://www.jenkins.io/doc/book/pipeline/)
- [AWS EKS Best Practices](https://aws.github.io/aws-eks-best-practices/)
- [Helm Chart Development](https://helm.sh/docs/chart_best_practices/)
- [Kubernetes Deployment Strategies](https://kubernetes.io/docs/concepts/workloads/controllers/deployment/)

## 👥 Team

- **DevOps Engineer**: Vicky
- **AWS Account**: 741448928336
- **Project**: Roboshop Microservices Platform

## 📝 License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details.

---

## 🎯 Interview Ready Points

### Enterprise Architecture
- **Microservices CI/CD**: Independent service pipelines
- **Security First**: Private registries, IAM integration
- **Production Safety**: Health checks, automated rollbacks
- **Scalable Design**: Agent pools, parallel execution

### Business Value
- **Reduced Deployment Risk**: Automated safety mechanisms
- **Faster Time to Market**: Streamlined delivery pipeline
- **Improved Reliability**: Consistent deployment process
- **Compliance Ready**: Audit trails and change management

### Technical Excellence
- **Infrastructure as Code**: Reproducible environments
- **Container Native**: Cloud-native deployment strategy
- **Progressive Delivery**: Risk mitigation through staged rollouts
- **Observability**: Comprehensive monitoring and alerting

---

*Built with ❤️ for enterprise-grade DevOps excellence*