# MEDIAWIKI PROBLEM STATEMENT

All the Code used and written in this repo are solely written by me and used all the opensoruce tools like Terraform and Ansible for IAAC and SCM

# Problem Statement
The problem statement was to build a complete End to End deployment of [MEDIAWIKI](https://www.mediawiki.org/wiki/MediaWiki) app with Infrastructure Up and Running and Software Configuration Integrated with it on the fly.

>  ### Terraform or any IaC tool with any Configuration Management tool integrated.

---

# Approach

The approach to solve the above problem was to use the most common IAAC tool `Terraform` with `Ansible` on top of it to setup infra and setup necessary utilities to make the application up and running

### Tool Used

* Terraform
* Ansible

# Installation

### Install Terraform

To install Terraform, find the [appropriate package](https://www.terraform.io/downloads.html) for your system and download it as a zip archive.

After downloading Terraform, unzip the package. Terraform runs as a single binary named `terraform`. Any other files in the package can be safely removed and Terraform will still function.

Finally, make sure that the `terraform` binary is available on your `PATH`. This process will differ depending on your operating system.

Print a colon-separated list of locations in your `PATH`.
```
    $ echo $PATH
```

Move the Terraform binary to one of the listed locations. This command assumes that the binary is currently in your downloads folder and that your `PATH` includes `/usr/local/bin`, but you can customize it if your locations are different.

```
$ mv ~/Downloads/terraform /usr/local/bin/
```

### Install Ansible

To install Ansible, find the [appropriate flavour](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html) for your system

```
$ sudo apt update
$ sudo apt install software-properties-common
$ sudo apt-add-repository --yes --update ppa:ansible/ansible
$ sudo apt install ansible
```

# :rocket: Launch
To get App up and running follow the below to launch your application `mediawiki` and the complete end to end infra setup

1. Edit the `provider.tf`

- change  the following line and add `{user-name}` with your username
- change `{profile}` with your aws profile with all the access to allow run this terraform code

```
provider "aws" {
  region = "us-east-1"
  shared_credentials_file = "/Users/{user-name}/.aws/credentials"    ## {user-name} : Replace it with your username and path with your to allow access to aws credentials files
  profile                 = "{profile}"                        ## {profile} : Enter the profile that you want to use. By Default the profile is : default
}
```

2. Get the `canonical Id` for your account

Run the following Command and you will get the canonical Id for you account for the `data` in `terraform` to fetch `ami` with respective filters

```
aws ec2 describe-images --filters "Name=name,Values=ubuntu/images/hvm-ssd/ubuntu-bionic-18.04*"  --query 'Images[*].{CanonicalID:OwnerId, N:Name}' | head -n6
```

3. Run the following command to run the `terraform` code

```
terraform init

terraform plan -var 'Name=mediawiki' -var 'Team=infra-team' -var 'Project=Mediawiki-Project'   -var 'account_id={canonical_id}'    #get the canonical_id from step 2

terraform apply -var 'Name=mediawiki' -var 'Team=infra-team' -var 'Project=Mediawiki-Project' -var 'account_id={canonical_id}' -auto-approve


```

The following variable pass on with the commands are for the Tagging purpose of the complete project. There is another variable called `{canonical_id}` you can substitute it with the `canonical id` of your account which you can get via `step2`
