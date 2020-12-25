resource "aws_ecr_repository" "rails-image" {
  name = "rails"
}

resource "aws_ecr_repository" "nginx-image" {
  name = "nginx"
}
