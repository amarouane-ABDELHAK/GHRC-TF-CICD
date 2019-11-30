# GHRC-TF-CICD

A docker image to build and deploy [GHRC](https://gitlab.com/ghrc-cloud/ghrc-tf-deploy) repo  to Bamboo-CI.

## How to Use
`cd to your cloned repo`
You should define a build.sh in your repo. build.sh contains the logic of your build+deployment <br>

`docer run --rm -v $PWD:/home/bamboo/workstation amarouane/ghrc-tf-cicd`
#### If you want to pass a cutom build your repo  run
`docer run --rm -v $PWD:/home/bamboo/workstation amarouane/ghrc-tf-cicd -e custom.sh`
### Custome script should be in the root directory of your cloned repo


