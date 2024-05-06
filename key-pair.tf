resource "aws_key_pair" "my_key" {
  key_name   = "api-server-key"
  public_key = file("~/.ssh/id_rsa.pub")
}
