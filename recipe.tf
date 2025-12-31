# data "aws_region" "current" {}

# data "aws_imagebuilder_image" "latest" {
#   arn = "arn:aws:imagebuilder:${data.aws_region.current.name}:aws:image/amazon-linux-2023-arm64/x.x.x"
# }

resource "aws_imagebuilder_image_recipe" "test_all_components_recipe" {         
  name         = "test-all-components-recipe"                                   # recipe name
  version      = "1.0.1"
  description  = "Test ImageBuilder recipe for all components"
  parent_image = "ami-0c5ddb3560e768732" # Ubuntu 22.04 ami-id (us-east-2)

# Below we defined the sequence of components to be applied to the base image

  component {
    component_arn = aws_imagebuilder_component.update_os_component.arn
  }
  
  component {
    component_arn = aws_imagebuilder_component.optimize_performance_component_1_0_1.arn
  }
  
  component {
    component_arn = aws_imagebuilder_component.cloudwatch_agent_component.arn
  }
  
  component {
    component_arn = aws_imagebuilder_component.ssm_agent_component.arn
  }
  
  component {
    component_arn = aws_imagebuilder_component.efa_install_component.arn
  }
  
  component {
    component_arn = aws_imagebuilder_component.lustre_install_component.arn
  }
  
  component {
    component_arn = aws_imagebuilder_component.pcs_agent_install_component.arn
  }
  
  component {
    component_arn = aws_imagebuilder_component.pcs_slurm_install_component.arn
  }
  
  component {
    component_arn = aws_imagebuilder_component.efs-utils-install_component.arn
  }

  component {
    component_arn = aws_imagebuilder_component.spack_install_component.arn
  }


    lifecycle {
    create_before_destroy = true
  }

  
}





