resource "aws_s3_bucket" "practice_bucket" {
  bucket = "${var.env}-${var.bucket-name}"

  tags = {
    Name        = "${var.env}-${var.bucket-name}"
    Environment = "${var.env}"
  }
}
