# inception

This project aims to broaden your knowledge of system administration by using Docker.
You will virtualize several Docker images, creating them in your new personal virtual
machine.

## Rules

### make dinstall
Make rule to install doppler (https://www.doppler.com/) CLI to the VM

### make dsetup
Make rule to setup doppler project and environment in the VM. We need to have a DOPPLER_TOKEN in this part to set everything correclty. After setting doppler CLI and setting the project we can access the secrets in the terminal with `doppler secrets`
