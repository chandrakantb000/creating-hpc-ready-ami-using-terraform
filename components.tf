resource "aws_imagebuilder_component" "update_os_component" {
  name                  = "update-os-component"
  platform              = "Linux"
  version               = "1.0.0"
  supported_os_versions = ["Amazon Linux 2023", "Ubuntu 22.04", "Ubuntu 20.04", "RHEL 8", "RHEL 9"]
  data                  = file("./components/update-os.yaml")
    




}
