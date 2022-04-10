# WATonomous Server Cluster Challenge

Franklin Gao's submission to the WATonomous Server Cluster Challenge

Goals:

-   Dockerize a generic application and publish it to Docker Hub.
-   Authenticate with the WATO AWS account through console and CLI.
-   Create and SSH into an EC2 Instance using Terraform

[Docker file](https://github.com/FranklinGao123/wato-infra-challenge-s22/blob/master/docker/Dockerfile)

URL to my image on Docker Hub: https://hub.docker.com/r/franklingao123/hello-world/tags

[Terraform File](https://github.com/FranklinGao123/wato-infra-challenge-s22/blob/master/aws/main.tf)

EC2 Instance's Public IP: http://ec2-18-208-239-233.compute-1.amazonaws.com:3000/

## Discussion Questions

Why use Docker for this?

-   Docker allows for running the same image across different evironments and platforms

Why use Terraform for this?

-   Terraform allows for infrastructure as code (IaC)
-   Managing and provisioning code can be automated instead of being done manually
-   Mitigates human error and easier version control

How can we improve this further?

-   Automate this whole process
-   Create a custom ami, on top of the Ubuntu image, you can install docker so it wouldn't have to be done everytime the VM starts

How would you automate the step where you had to ssh into the EC2 server and start the container?

-   See line 44-53 in [main.tf](https://github.com/FranklinGao123/wato-infra-challenge-s22/blob/master/aws/main.tf) for the automation code (not tested yet)

Are there any other tools we could use instead of Docker or Terraform for this?

-   Instead of Terraform, you could you AWS CLI or AWS CloudFormation
-   Instead of Docker, you could Kubernetes/Openshift
-   For automation, Ansible could also be used instead of Terraform

In what situations would you use them over our current tools?

-   Terraform works for many service providers while AWS CLI and AWS CloudFormation are strictly targeted for managing AWS services
-   In general Docker is used for more small-sizing due to its scalability and orchestration while Kubernetes/Openshift are used for the enterprise-level
-   Ansible is better at automation and deployment while Terraform is better at managing infrastructure
