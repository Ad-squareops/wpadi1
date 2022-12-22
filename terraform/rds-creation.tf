resource "aws_db_instance" "rds" {
  allocated_storage      = 20
  db_name                = "mydb"
  identifier             = "testdb"
  max_allocated_storage  = 0
  engine                 = "mysql"
  engine_version         = "8.0.28"
  instance_class         = "db.t3.micro"
  username               = "admin"
  password               = "password"
  db_subnet_group_name   = "terraform-rds-adi-20221222092936693600000001"
  parameter_group_name   = "default.mysql8.0"
  skip_final_snapshot    = true
  port                   = 3306
  publicly_accessible    = true
  vpc_security_group_ids = ["sg-0b05b41c832f5a2f3"]
  storage_type           = "gp2"

  tags = {
    Name = "testdb"
  }
}

