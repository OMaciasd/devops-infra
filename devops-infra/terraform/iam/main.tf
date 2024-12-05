resource "aws_iam_role" "sagemaker_execution_role" {
  name = "sagemaker-execution-role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Action = "sts:AssumeRole",
        Principal = {
          Service = "sagemaker.amazonaws.com"
        }
      }
    ]
  })
}

resource "aws_sagemaker_model" "my_model" {
  name               = "secure-model"
  execution_role_arn = aws_iam_role.sagemaker_execution_role.arn
  primary_container {
    image = "811284229777.dkr.ecr.us-east-1.amazonaws.com/xgboost:latest"
    model_data_url = "s3://my-secure-bucket/model.tar.gz"
  }
}
