provider "aws" {
  region  ="us-east-1"
  access_key = "AKIAZ6KNEFOTPGDEA6M2"
  secret_key = "l1YduTGQSoKhfyz0776z2GZcMzhzBJXy4usa/Pez"
}

resource "aws_instance" "ec2_example" {
    ami = "ami-0715c1897453cabd1"  
    instance_type = "t2.micro" 
    tags = {
        Name = "Terraform EC2"
    }
}