resource "aws_codebuild_project" "front" {
  name               = "terrform-front-build"
  project_visibility = "PRIVATE"
  description        = "codebuild_project"
  build_timeout      = 60
  queued_timeout     = 480
  badge_enabled      = false
  encryption_key     = data.aws_kms_alias.s3.arn
  service_role       = aws_iam_role.codebuild_role.arn

  artifacts {
    name                   = "tf-front-build"
    packaging              = "NONE"
    type                   = "CODEPIPELINE"
    encryption_disabled    = false
    override_artifact_name = false
  }

  cache {
    type = "NO_CACHE"
  }

  environment {
    compute_type                = "BUILD_GENERAL1_SMALL"
    image                       = "aws/codebuild/amazonlinux2-x86_64-standard:3.0"
    type                        = "LINUX_CONTAINER"
    image_pull_credentials_type = "CODEBUILD"
  }

  source {
    type                = "CODEPIPELINE"
    git_clone_depth     = 0
    insecure_ssl        = false
    report_build_status = false
  }

  logs_config {
    cloudwatch_logs {
      status = "ENABLED"
    }

    s3_logs {
      status              = "DISABLED"
      encryption_disabled = false
    }
  }
  tags = {
    Environment = "Test"
  }
}