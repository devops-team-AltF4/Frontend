resource "aws_codestarconnections_connection" "github" {
  name          = "project4-front"
  provider_type = "GitHub"
}

resource "aws_codepipeline" "codepipeline" {
  name     = "frontend-staging"
  role_arn = aws_iam_role.codepipeline_role.arn

  artifact_store {
    location = aws_s3_bucket.codepipeline_bucket.bucket
    type     = "S3"

    # encryption_key {
    #   id   = data.aws_kms_alias.s3kmskey.arn
    #   type = "KMS"
    # }
  }

  stage {
    name = "Source"

    action {
      run_order        = 1
      name             = "Source"
      category         = "Source"
      owner            = "AWS"
      region           = "ap-northeast-2"
      provider         = "CodeStarSourceConnection"
      version          = "1"
      output_artifacts = ["SourceArtifact"]

      configuration = {
        ConnectionArn    = aws_codestarconnections_connection.github.arn
        FullRepositoryId = "devops-team-AltF4/Frontend"
        BranchName       = "main"
        OutputArtifactFormat = "CODE_ZIP"
      }
    }
  }

  stage {
    name = "Build"

    action {
      run_order = 1
      name             = "Build"
      category         = "Build"
      owner            = "AWS"
      region           = "ap-northeast-2"
      provider         = "CodeBuild"
      input_artifacts  = ["SourceArtifact"]
      output_artifacts = ["BuildArtifact"]
      version          = "1"

      configuration = {
        ProjectName = "front-build"
      }
    }
  }

  stage {
    name = "Deploy"

    action {
      run_order       = 1
      name            = "Deploy"
      category        = "Deploy"
      owner           = "AWS"
      provider        = "S3"
      region          = "ap-northeast-2"
      input_artifacts = ["BuildArtifact"]
      version         = "1"

      configuration = {
        BucketName = "project4-frontend-react"
        Extract = "true"
      }
    }
  }
}
