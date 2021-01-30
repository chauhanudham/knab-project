                                                         Technical Document 

Prerequisite for this Project 

1.	Linux Ubuntu 18.4 Server , 
2.	Terraform v0.11.1, 
3.	AWS Cloud Accounts with required access to provision resources, 
4.	Github Credentials or public Source Code .
5.	Docker 


Terraform Setup in Local Machine

1.	Define infrastructure as code to increase operator productivity and transparency.
2.	Terraform provides an elegant user experience for operators to safely and predictably make changes to infrastructure.
3.	Terraform Setup in local machine like centos and ubuntu  as per the Client requirement .
4.	Run the below command with user root as well as sudo user .

$ curl -O https://releases.hashicorp.com/terraform/0.11.1/terraform_0.11.1_linux_amd64.zip
$ unzip terraform_0.11.1_linux_amd64.zip -d /usr/bin/
Or 
$ unzip terraform_0.11.1_linux_amd64.zip -d /usr/local/bin/
cd /root 
$vim .bashrc 
export PATH="$PATH:/usr/bin/terraform"
Or 
export PATH="$PATH:/usr/local/bin/terraform"
$ source .bashrc

Infra provisioning & Docker Web server 
1.	Create a Directory and clone the code from github . 
$ mkdir -p /opt/infra-code 
$ cd /opt/infra-code 
$ git clone https://github.com/chauhanudham/knab-project.git
2.	After Clone the Code from github and provide the Access key ID and Secret access key in terraform.tfvars file .
3.	Run the below commands to create the private and public key in this path 
$ cd  /opt/infra-code/knab-project
$ ssh-keygen -f sap-key
$ cd scripts 
$ chmod +x script.sh
$ cd /opt/infra-code/knab-project
$ terraform init
$ terraform plan
$ terraform apply 

Hit the public ip or if you have load balancer then use the load balance public ip and may be Dns name on the web browser and then you get “Welcome to nginx!” page will be Open.




