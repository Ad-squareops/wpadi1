resource "aws_db_subnet_group" "dbsub" {
  name       = "adi-subnet-group-rds"
  subnet_ids = ["subnet-0137f79e0f79ac457", "subnet-0f538e3830ee89ae2"]

  tags = {
    Name = "Adi DB subnet group"
  }
}

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
  parameter_group_name   = "default.mysql8.0"
  skip_final_snapshot    = true
  port                   = 3306
  publicly_accessible    = true
  vpc_security_group_ids = ["sg-0b05b41c832f5a2f3"]
  db_subnet_group_name   = aws_db_subnet_group.dbsub.id
  storage_type           = "gp2"

  tags = {
    Name = "testdb"
  }
}
