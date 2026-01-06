# data "aws_region" "current" {}

# data "aws_imagebuilder_image" "latest" {
#   arn = "arn:aws:imagebuilder:${data.aws_region.current.name}:aws:image/amazon-linux-2023-arm64/x.x.x"
# }

resource "aws_imagebuilder_image_recipe" "test_all_components_recipe" {         
  name         = "test-all-components-recipe"                                   # recipe name
  version      = "1.0.4"
  description  = "Test ImageBuilder recipe for all components"
  parent_image = "ami-0c5ddb3560e768732" # Ubuntu 22.04 ami-id (us-east-2)

  # While installing spack component image build fails with "No space left on device" error on default ubuntu ami root volume size of 8GB.
  # So increasing the root volume size to 50GB.
  block_device_mapping {
    device_name = "/dev/xvda"

    ebs {
      delete_on_termination = true
      volume_size = 40
      volume_type = "gp3"
    }
  }


  #

# Below we defined the sequence of components to be applied to the base image

  component {
    component_arn = aws_imagebuilder_component.update_os_component.arn
  }

  component {
    component_arn = "arn:aws:imagebuilder:${var.aws_region}:aws:component/reboot-linux/x.x.x"
  }

  
  component {
    component_arn = aws_imagebuilder_component.optimize_performance_component_1_0_1.arn
  }

  component {
    component_arn = aws_imagebuilder_component.ssm_agent_component.arn
  }
   
  component {
    component_arn = aws_imagebuilder_component.cloudwatch_agent_component.arn
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

# added lifecycle policy to reverses the default terraform behavior of destroying and recreating the resource on changes to certain attributes.
# Now when changes are made to the recipe, terraform will create the new version before destroying the old one. And this version will be referenced by the pipeline.
# Suppose if we want to keep the previous recipe version  then we can add "retain_previous_version = true" inside lifecycle block.
    lifecycle {
    create_before_destroy = true
  }

  
}





