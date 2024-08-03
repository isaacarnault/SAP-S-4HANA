resource "aws_db_instance" "sql_server" {
  allocated_storage       = 100
  storage_type            = "gp2"
  engine                  = "sqlserver-se"
  engine_version          = "14.00.1000.169.v1"
  instance_class          = "db.m4.large"
  name                    = "sapdb"
  username                = var.db_username
  password                = var.db_password
  db_subnet_group_name    = module.vpc.database_subnet_group
  vpc_security_group_ids  = [aws_security_group.sql_server_sg.id]
  multi_az                = false
  publicly_accessible     = false

  tags = {
    Name = "sap-s4hana-db"
  }
}
