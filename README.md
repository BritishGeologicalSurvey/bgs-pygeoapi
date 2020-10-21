# PyGeoAPI

Test deployment of [PyGeoAPI](https://pygeoapi.io/)

http://pygeoapi-1430-master.kube-idev.bgslcdevops.test/pygeoapi/ 

# Docker Deployment Template

A simple and fully automated template to help deploy docker images.

- The template is *very minimal* as it makes use of standardised functionality in GitLab and Kubernetes.
- Builds, tests, deploys and secuity scans your deployments.
- Deploys to Development and DMZ environments
- Deployment and Networking settings configured using standard Kubernetes objects.

### Project Files

- `.gitlab-ci.yml` - controls the build, test, deploy stages. You'll need to edit and extend this for your requirements.
- `Dockerfile` and `content` directory - Provides a very simple example webserver. Update this with your own Dockerfile.
- `kube-deploy/kube-config.sh` - script used by the CI to setup kubernetes connection
- `kube-deploy/deploy.sh` - script used by the CI to deploy the kubernetes config files
- `kube-deploy/manifests` - directory of kubernetes config files to apply. By default these configs include: the deployment, networking and docker registry connection details. You can add extra config files in here if you need to.

### Credentials

Access to the Development Kubernetes cluster and Internal Docker Registry (`$DOCKER_SECRET`) is already provided to all GitLab projects. So no configuration is needed to start deploying to the development cluster.

The DMZ cluster credentials can be provided on a per user/project/group basis. Please contact @wael for more information.

### Environments and Branching Strategies

The template can be adjusted for any branching strategy. By default:
- all branches and tags will deploy to a new seperate development environment.
- environments are deployed into completely independent and isolated namespaces in the development kubernetes cluster. This makes working on feature branches really nice as you can see the results of your work deployed and tested before integrating into your master or default branch.
- GitLab automatically manages assigns a unique kubernetes namespace name e.g: `<project_name>-<project_id>-<environment>`. Which might look like: `simple-docker-example-1357-master`
- Kubernetes automatically creates networking rules to allow immediate access to your development deployment e.g.
http://simple-docker-example-1357-master.kube-idev.bgslcdevops.test/
- development environments are automatically removed after 1 week or when the branch is deleted or by manually running the stop job.
- anything merged into the `production-dmz` branch will deploy to the production dmz kubernetes cluster
- the `APP_HOSTNAME` variable in the DMZ deploy section of the `.gitlab-ci.yml` file should be set to the final application hostname (e.g. `simple-docker-example.bgs.ac.uk`).
- it is likely for new applications that an external DNS entry needs to be requested and pointed at the DMZ kubernetes cluster. @agd or sns can do this.

### Tests and Secuirty Scans

At the bottom of the CI file there is a template `include` section where a list of standard GitLab templates are imported to test and scan your deployments. The type of scans to include is dependant on your project. As they are generic checks/tests, some of them work better than others. A key one to include for docker builds is the `Container-Scanning.gitlab-ci.yml` template. Results are stored in artifacts, within the secuity pages of the projects and also visible in Merge Requests.
