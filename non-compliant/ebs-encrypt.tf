# Create EC2 Instance
resource "aws_instance" "ebs-noencrytion" {
  ami                         = "ami-0aa2b7722dc1b5612"
  instance_type               = "t2.small"
  associate_public_ip_address = true
  source_dest_check           = false
  key_name                    = "areef"
  
  # root disk
  root_block_device {
    volume_size           = "20"
    volume_type           = "gp2"
    encrypted             = false 
    delete_on_termination = true
  }
  # data disk
  ebs_block_device {
    device_name           = "/dev/xvda"
    volume_size           = "50"
    volume_type           = "gp2"
    encrypted             = false
    delete_on_termination = true
  }
  
  tags = {
    Name        = "regula1"
    Environment = "dev"
  }
}
