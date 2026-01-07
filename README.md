# Creating-hpc-ready-ami-using-terraform
This repository contains terraform files for automating the creation of hpc-ready-ami. 

Steps:

- [x] adding packages installation scripts
- [x] updating dependencies
- [x] testing for one component update-os  
- [x] creating configuration for infrastructure using tf
- [x] creation of recipe using tf
- [x] make output of image-pipeline visible in cloudwatch log group
- [x] creation of components (one by one)
- [x] for testing embedding scripts directly to components.

*   [ ] Solving the components not running issue
    *   [x] optimize-performance component(detect_os_version issue)
    *   [x] pcs-slurm component installation issue(fixed by adding SLURMEOF in heredoc as earlier adding EOF inside EOF gave error)
    *   [x] add AWS managed reboot-os component 
    *   [x] fix spack installation issue([1st issue was regarding chmod, basically efs-utils script was pasted so that gave error], [2nd issue is regarding memory that is after cloning, there is no space left on device.])
    *   [ ] Add apptainer component

- [ ] adding validation and test phases in all the components
- [x] creating distribution
- [ ] Next step adding the scripts to s3 buckets 
