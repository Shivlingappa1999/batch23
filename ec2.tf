provider "aws" {
  region="ap-southeast-2"
  access_key = ""
  secret_key = ""
}

data "aws_secretsmanager_secret_version" "credentials" {
  secret_id = "ec2/credentials"
}

resource "aws_instance" "example" {
  ami           = "ami-0720cb7af233b0529"
  instance_type = "t3.micro"
  key_name = "tfshivkey"
  vpc_security_group_ids = "sg-0562ed1ae2d1c49ca"
  tags = {
    Name = "Myec2"
    env="dev"
    name="shinu"
  }
}