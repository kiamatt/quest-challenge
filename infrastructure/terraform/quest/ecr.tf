resource "aws_ecr_repository" "quest" {
  name                 = "quest"
  image_tag_mutability = "IMMUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }
}