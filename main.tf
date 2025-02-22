resource "aws_security_group" "main" {
  name        = local.sg_final_name
  description = "Allow port number 22 for ssh access"
  vpc_id = var.vpc_id


  #usally  we allow everything in egrees
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = merge(
    var.common_tags,
    var.sg_tags,
    {
      Name = "allow_ssh"
    }
  )
}
