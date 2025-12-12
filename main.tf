provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "one" {
  count                  = 4
  ami                    = "ami-01b9f1e7dc427266e"
  instance_type          = "c7i-flex.large"
  key_name               = "aneesh-sg"
  vpc_security_group_ids = ["sg-0125b8b1685a464c7"]
  tags = {
    Name = var.instance_names[count.index]
  }
}

variable "instance_names" {
  default = ["jenkins", "tomcat-1", "tomcat-2", "Monitoring server"]
}



