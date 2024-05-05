resource "aws_ebs_volume" "ebs-volume" {
  availability_zone = var.availability_zone
  size              = var.size
  type              = var.ebs_type["gp2"]
}

resource "aws_volume_attachment" "ebs-volume-attachment" {
  device_name = var.device_name
  volume_id   = aws_ebs_volume.ebs-volume.id
  instance_id = var.instance_id
}
