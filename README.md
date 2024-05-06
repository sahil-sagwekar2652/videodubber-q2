# Videodubber test api q2

[![My Skills](https://skillicons.dev/icons?i=aws,py,flask,terraform&perline=4)](https://skillicons.dev)

### Functionality
- Use terraform to provision AWS EC2 instance and related resources.
- Use the `remote-exec` provisioner to execute the `setup.sh` file remotely.
- The `setup.sh` file -
    - clones this repo
	- installs requirements
	- creates a systemd service
	- starts the service (uses gunicorn webserver for production deployment)

### Requirements
- You need to have `id_rsa` and `id_rsa.pub` key files inside your `~/.ssh` directory. If not you can modify the code inside `key-pair.tf` and line 11 in `mumble-server.tf`
