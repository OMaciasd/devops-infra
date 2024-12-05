# Configuración del proveedor AWS
provider "aws" {
  region = "us-east-1"  # Cambia la región según tus necesidades
}

# Crear una VPC (si no tienes una existente)
resource "aws_vpc" "my_vpc" {
  cidr_block = "10.0.0.0/16"
}

# Crear una subred privada
resource "aws_subnet" "private_subnet" {
  vpc_id                  = aws_vpc.my_vpc.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = false
}

# Crear un grupo de seguridad para Lambda
resource "aws_security_group" "lambda_sg" {
  name        = "lambda_sg"
  description = "Security group for Lambda function"
  vpc_id      = aws_vpc.my_vpc.id
}

# Crear una función Lambda
resource "aws_lambda_function" "lambda_function" {
  function_name = "my-lambda-function"
  runtime       = "java11"  # Usando Java 11
  role          = aws_iam_role.lambda_role.arn
  handler       = "com.example.Handler::handleRequest"  # El nombre de tu clase y método handler

  # Código fuente, usando un archivo ZIP o S3 como origen
  filename      = "path/to/your/lambda.jar"  # Ruta al archivo JAR
  source_code_hash = filebase64sha256("path/to/your/lambda.jar")

  # Configuración de VPC
  vpc_config {
    subnet_ids          = [aws_subnet.private_subnet.id]
    security_group_ids  = [aws_security_group.lambda_sg.id]
  }

  memory_size = 128
  timeout     = 60
}

# Crear un rol IAM para Lambda
resource "aws_iam_role" "lambda_role" {
  name = "lambda_role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action    = "sts:AssumeRole"
        Effect    = "Allow"
        Principal = {
          Service = "lambda.amazonaws.com"
        }
      }
    ]
  })
}

# Permisos de acceso a la VPC para Lambda
resource "aws_iam_role_policy_attachment" "lambda_policy_attachment" {
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaVPCAccessExecutionRole"
  role       = aws_iam_role.lambda_role.name
}

