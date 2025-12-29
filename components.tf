resource "aws_imagebuilder_component" "update_os_component" {
  name                  = "update-os-component"
  platform              = "Linux"
  version               = "1.0.0"
  supported_os_versions = ["Amazon Linux 2023", "Ubuntu 22.04", "Ubuntu 20.04", "RHEL 8", "RHEL 9"]
  data                  = file("./components/update-os.yaml")
    
}

resource "aws_imagebuilder_component" "optimize_performance_component" {
  name                  = "optimize-performance-component"
  platform              = "Linux"
  version               = "1.0.0"
  supported_os_versions = ["Amazon Linux 2023", "Ubuntu 22.04", "Ubuntu 20.04", "RHEL 8", "RHEL 9"]
  data                  = file("./components/optimize-performance.yaml")
  
}


resource "aws_imagebuilder_component" "cloudwatch_agent_component" {
  name                  = "cloudwatch-agent-component"
  platform              = "Linux"
  version               = "1.0.0"
  supported_os_versions = ["Amazon Linux 2023", "Ubuntu 22.04", "Ubuntu 20.04", "RHEL 8", "RHEL 9"]
  data                  = file("./components/install-cloudwatch-agent.yaml")
  
}

resource "aws_imagebuilder_component" "ssm_agent_component" {
  name                  = "ssm-agent-component"
  platform              = "Linux"
  version               = "1.0.0"
  supported_os_versions = ["Amazon Linux 2023", "Ubuntu 22.04", "Ubuntu 20.04", "RHEL 8", "RHEL 9"]
  data                  = file("./components/install-ssm-agent.yaml")
  
}


resource "aws_imagebuilder_component" "efa_install_component" {
  name                  = "efa-install-component"
  platform              = "Linux"
  version               = "1.0.0"
  supported_os_versions = ["Amazon Linux 2023", "Ubuntu 22.04", "Ubuntu 20.04", "RHEL 8", "RHEL 9"]
  data                  = file("./components/install-efa.yaml")
  
}


resource "aws_imagebuilder_component" "lustre_install_component" {
  name                  = "lustre-install-component"
  platform              = "Linux"
  version               = "1.0.0"
  supported_os_versions = ["Amazon Linux 2023", "Ubuntu 22.04", "Ubuntu 20.04", "RHEL 8", "RHEL 9"]
  data                  = file("./components/install-lustre.yaml")
  
}


resource "aws_imagebuilder_component" "pcs_agent_install_component" {
  name                  = "pcs-agent-install-component"
  platform              = "Linux"
  version               = "1.0.0"
  supported_os_versions = ["Amazon Linux 2023", "Ubuntu 22.04", "Ubuntu 20.04", "RHEL 8", "RHEL 9"]
  data                  = file("./components/install-pcs-agent.yaml")
  
}

resource "aws_imagebuilder_component" "pcs_slurm_install_component" {
  name                  = "pcs-slurm-install-component"
  platform              = "Linux"
  version               = "1.0.0"
  supported_os_versions = ["Amazon Linux 2023", "Ubuntu 22.04", "Ubuntu 20.04", "RHEL 8", "RHEL 9"]
  data                  = file("./components/pcs-slurm-install.yaml")
  
}

resource "aws_imagebuilder_component" "efs-utils-install_component" {
  name                  = "efs-utils-install-component"
  platform              = "Linux"
  version               = "1.0.0"
  supported_os_versions = ["Amazon Linux 2023", "Ubuntu 22.04", "Ubuntu 20.04", "RHEL 8", "RHEL 9"]
  data                  = file("./components/install-efs-utils.yaml")
  
}


resource "aws_imagebuilder_component" "spack_install_component" {
  name                  = "spack-install-component"
  platform              = "Linux"
  version               = "1.0.0"
  supported_os_versions = ["Amazon Linux 2023", "Ubuntu 22.04", "Ubuntu 20.04", "RHEL 8", "RHEL 9"]
  data                  = file("./components/spack-install.yaml")
  
}

