resource "aws_imagebuilder_image_pipeline" "my_pipeline" {

  name                             = "my-pipeline"
  image_recipe_arn                 = aws_imagebuilder_image_recipe.update_os_test.arn
  infrastructure_configuration_arn = aws_imagebuilder_infrastructure_configuration.infrastructure.arn
#   distribution_configuration_arn   = aws_imagebuilder_distribution_configuration.distribution.arn
}