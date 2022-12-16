packer {
  required_plugins {
    amazon = {
      version = ">= 1.1.1"
      source  = "github.com/hashicorp/amazon"
    }
  }
}

source "amazon-ebs" "packer-adi" {
  ami_name      = "packer-adi"
  source_ami    = "ami-0ada6d94f396377f2"
  instance_type = "t3a.small"
  region        = "us-east-2"
  ssh_username  = "ubuntu"

  tags = {
    Name = "AdiAMI222"
  }
}


build {
  sources = [
    "source.amazon-ebs.packer-adi"
  ]

  provisioner "shell" {
    script = "./install.sh"
  }
}
