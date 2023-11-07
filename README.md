# Host-Static-Website-on-AWS-S3-Using-Terraform

## Prerequisites

Install **Terraform** and **AWS CLI** for this simple Static Website on **AWS S3**.

Check this [guide](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli) for **Terraform**.

Check this [guide](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html) for **AWS CLI**.

For **AWS Access Key** and **Secret Access Key** for configuring **AWS CLI**, visit this [blog post](https://aws.amazon.com/pt/blogs/security/wheres-my-secret-access-key/). 


## Provider

Simple ```provider.tf``` configuration from Terraform to AWS.

## S3 Bucket

As you can see at ``` main.tf ```,

Please, for changing the **bucket name**, be careful to follow the [Bucket Naming Rules](https://docs.aws.amazon.com/AmazonS3/latest/userguide/bucketnamingrules.html).

[Static website hosting](https://docs.aws.amazon.com/AmazonS3/latest/userguide/WebsiteHosting.html) is **Enabled**.

[Access for Permissions Overview](https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies.html) is **Enabled**.

[Block Public Access](https://docs.aws.amazon.com/AmazonS3/latest/userguide/access-control-block-public-access.html) is **Denied**.

[Access Control List](https://docs.aws.amazon.com/AmazonS3/latest/userguide/acl-overview.html) for this bucket is **Public-Read**.


## Uploading Files to S3

At ```aws_s3_object``` is set to upload 3 files from WebFiles folder, **index.html**, **error.html** and **meow.jpg** (yes, its my **cat**!)

It's a simple index page. An error page. Nothing special (except the **cat**).

## Terraform

Use ```terraform init``` to initialize terraform.

Use ```terraform apply``` to create a S3 Bucket and upload the files.
