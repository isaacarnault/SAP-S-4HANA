resource "aws_instance" "sap_s4hana" {
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name      = var.key_name
  subnet_id     = element(var.subnets, 0)
  user_data     = file("userdata.sh")

  vpc_security_group_ids = var.security_group_ids

  tags = {
    Name = "SAP S/4HANA"
  }
}
