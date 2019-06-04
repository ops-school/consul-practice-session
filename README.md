# consul-practice-session

### Steps to bring up the environment:
* Make sure your credentials for the AWS TerraForm provider are set (file or environemnt variables)
* cd to `terraform` dir
* Update key_name & region variables (or you will be prompted for it) with the name of your ssh key pair in AWS
* Run `terraform init`
* Run `terraform plan`
* Run `terraform apply`

### Steps to register a service are in the service_registration folder:
* Each method has it's own directory
* Instructions are in the `commands.txt` file
* Additional resources (json files) are in each directory


### metrics session
* for the shared metrics and consul session we will use the terraform_metrics directory
#### what do we have in this directory?
this terraform will create the following
1. three node consul cluster
2. one metrics EC2 instance with the following installed
   - docker
   - consul client
   - dummyExporter docker image
   - grafana docker image
   - node exporter
   - prometheus
   - this instance will join the consul cluster as a client.

### Steps to bring up the environment:
* if you do not have a default_vpc copy the the default_vpc.tf from the default_vpc directory
* cd terraform_metrics
* Run `terraform init`
* Run `terraform plan`
* Run `terraform apply`

