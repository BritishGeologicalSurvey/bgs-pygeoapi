# Docker Deployment Template

A simple template to help deploy docker images.

- Builds, tests, deploys and secuity scans your deployments.
- Deploys to Development and DMZ environments
- Deployment and Networking settings configured using standard Kubernetes objects.


### Project Files

- `.gitlab-ci.yml` - controls the build, test, deploy stages. You'll need to edit and extend this for your requirements.
- `Dockerfile` and `content` directory - Provides a very simple webserver example. Update this with your own Dockerfile.
- `kube-deploy/kube-config.sh` - script used by the CI to setup kubernetes connection
- `kube-deploy/deploy.sh` - script used by the CI to deploy the kubernetes config files
- `kube-deploy/manifests` - directory of kubernetes config files to apply. By default these configs include: the deployment, networking and docker registry connection details.
