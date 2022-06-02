resource "aws_s3_bucket" "project4-frontend-staging" {
  bucket = "project4-frontend-staging"
  acl    = "private"
  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Id": "Policy1653280892783",
  "Statement": [
    {
      "Sid": "Stmt1653280884718",
      "Effect": "Allow",
      "Principal": "*",
      "Action": "s3:*",
      "Resource": "arn:aws:s3:::project4-frontend-staging/*"
    }
  ]
}
POLICY
}