resource "aws_instance" "s1" {
  ami                    = "ami-0ada6d94f396377f2"
  instance_type          = "t3a.small"
  availability_zone      = "us-east-2a"
  key_name               = "adikp1"
  security_groups        = [aws_security_group.pritunl-sg.id]
  subnet_id              = element(module.vpc.public_subnets, 0)
  vpc_security_group_ids = [aws_security_group.pritunl-sg.id]

  tags = {
    Name = "adi-test-public"
  }
}
##
