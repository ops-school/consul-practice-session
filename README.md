# consul-practice-session

### Steps to bring up the environment:
* Make sure your credentials for the AWS TerraForm provider are set (file or environemnt variables)
* cd to `terraform` dir
* Update key_name variable (or you will be prompted for it) with the name of your ssh key pair in AWS
* Run `terraform init`
* Run `terraform plan`
* Run `terraform apply`

### Steps to register a service are in the service_registration folder:
* Each method has it's own directory
* Instructions are in the `commands.txt` file
* Additional resources (json files) are in each directory
