resource "aws_ami_from_instance" "demoinstance1-image" {
  name               = "terraform-example"
  source_instance_id = aws_instance.demoinstance1.id
}