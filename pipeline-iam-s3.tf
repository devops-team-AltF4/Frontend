
resource "aws_s3_bucket" "codepipeline_bucket" {
  bucket_prefix = "pipeline-bucket"
}

resource "aws_s3_bucket_acl" "codepipeline_bucket_acl" {
  bucket = aws_s3_bucket.codepipeline_bucket.id
  acl    = "private"
}

data "aws_kms_alias" "s3" {
  name = "alias/aws/s3"
}

resource "aws_iam_role" "codepipeline_role" {
  name = "Pipeline-Role"

  assume_role_policy = "${file("iam/pipeline-role-assume.json")}"
}

resource "aws_iam_role_policy" "codepipeline_policy" {
  name = "CodePipeline-Policy"
  role = aws_iam_role.codepipeline_role.id
  policy = "${file("iam/pipeline-role-policy.json")}"
}

resource "aws_iam_role" "codedeploy_role" {
  name = "CodeDeploy-Role"

  assume_role_policy = "${file("iam/codedeploy-assume.json")}"
}

resource "aws_iam_role_policy" "codedeploy_policy" {
  name = "CodeDeploy-Policy"
  role = aws_iam_role.codedeploy_role.id
  policy = "${file("iam/codedeploy-policy.json")}"
}

resource "aws_iam_role_policy_attachment" "codedeploy_policy" {
  role       = aws_iam_role.codedeploy_role.id
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSCodeDeployRole"
}

resource "aws_iam_role" "codebuild_role" {
  name = "CodeBuild-Role"

  assume_role_policy = "${file("iam/codebuild-assume.json")}"
}

resource "aws_iam_role_policy" "codebuild_policy" {
  name = "Codebuild-Policy"
  role = aws_iam_role.codebuild_role.id
  policy = "${file("iam/codebuild-policy.json")}"
}
