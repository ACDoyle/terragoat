provider "aws" {
  region = "us-west-2"
}

resource "aws_security_group" "ssh_traffic" {
  name        = "ssh_traffic"
  description = "Allow SSH inbound traffic"
  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    git_commit           = "0162b38f2e337e785b83c4c7e823716e8183c012"
    git_file             = "terraform/simple_instance/ec2.tf"
    git_last_modified_at = "2022-02-10 18:38:26"
    git_last_modified_by = "bednyk@gmail.com"
    git_modifiers        = "bednyk"
    git_org              = "ACDoyle"
    git_repo             = "terragoat"
    yor_trace            = "5546d77a-be28-4bae-a796-cc09c93d31d9"
  }
}

resource "aws_instance" "web_server_instance" {
  ami             = data.aws_ami.ubuntu.id
  instance_type   = "t2.micro"
  security_groups = ["${aws_security_group.ssh_traffic.name}"]
  tags = {
    Name                 = "bc_workshop_ec2"
    git_commit           = "0162b38f2e337e785b83c4c7e823716e8183c012"
    git_file             = "terraform/simple_instance/ec2.tf"
    git_last_modified_at = "2022-02-10 18:38:26"
    git_last_modified_by = "bednyk@gmail.com"
    git_modifiers        = "bednyk"
    git_org              = "ACDoyle"
    git_repo             = "terragoat"
    yor_trace            = "c505badc-4740-474e-8cb0-a64e549a5729"
  }
}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-bionic-18.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}
