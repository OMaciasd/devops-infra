resource "aws_ecs_task_definition" "service_b_task" {
  family                   = "service-b-task"
  container_definitions    = jsonencode([
    {
      name      = "service-b"
      image     = "<ECR_IMAGE_URL_SERVICE_B>"
      memory    = 512
      cpu       = 256
      essential = true
      portMappings = [
        {
          containerPort = 8081
          hostPort      = 8081
        }
      ]
    }
  ])
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = "256"
  memory                   = "512"
}

resource "aws_ecs_service" "service_b_service" {
  name            = "service-b-service"
  cluster         = aws_ecs_cluster.backend_cluster.id
  task_definition = aws_ecs_task_definition.service_b_task.arn
  desired_count   = 1
}
