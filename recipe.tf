# data "aws_region" "current" {}

# data "aws_imagebuilder_image" "latest" {
#   arn = "arn:aws:imagebuilder:${data.aws_region.current.name}:aws:image/amazon-linux-2023-arm64/x.x.x"
# }

resource "aws_imagebuilder_image_recipe" "update_os_test" {
  name         = "update-os-test"
  version      = "1.0.0"
  description  = "Test ImageBuilder recipe for Update OS component"
  parent_image = "ami-0c5ddb3560e768732" # Ubuntu 22.04 ami (us-east-2)

  component {
    component_arn = aws_imagebuilder_component.update_os_component.arn
  }
}



