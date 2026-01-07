resource "aws_imagebuilder_image_pipeline" "my_pipeline" {

  name                             = "testing-pipeline-for-components"
  image_recipe_arn                 = aws_imagebuilder_image_recipe.test_all_components_recipe.arn
  infrastructure_configuration_arn = aws_imagebuilder_infrastructure_configuration.infrastructure.arn
   distribution_configuration_arn   = aws_imagebuilder_distribution_configuration.my_distribution.arn
}

# added the distribution configuration to specify how and where to distribute the built AMI
resource "aws_imagebuilder_distribution_configuration" "my_distribution" {
  name = "my-distribution-configuration"

  distribution {
    region = var.aws_region

    ami_distribution_configuration {
      name                 = "hpc-ready-ami-{{imagebuilder:buildDate}}"
      description          = "HPC Ready AMI built with Image Builder"
    }
  }

  distribution {
    region = "us-east-2"

    ami_distribution_configuration {
      name                 = "hpc-ready-ami-{{imagebuilder:buildDate}}"
      description          = "HPC Ready AMI built with Image Builder"
    }
  }

}