resource "aws_imagebuilder_image_pipeline" "my_pipeline" {

  name                             = "testing-pipeline-for-components"
  image_recipe_arn                 = aws_imagebuilder_image_recipe.test_all_components_recipe.arn
  infrastructure_configuration_arn = aws_imagebuilder_infrastructure_configuration.infrastructure.arn
#   distribution_configuration_arn   = aws_imagebuilder_distribution_configuration.distribution.arn
}