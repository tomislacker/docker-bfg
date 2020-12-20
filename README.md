[![Docker Stars](https://img.shields.io/docker/stars/bmcclure89/docker-bfg.svg?style=flat-square)](https://hub.docker.com/r/bmcclure89/docker-bfg/) [![Docker Pulls](https://img.shields.io/docker/pulls/bmcclure89/docker-bfg.svg?style=flat-square)](https://hub.docker.com/r/bmcclure89/docker-bfg/) [![Build Status](https://dev.azure.com/brandonmcclure89/docker-bfg/_apis/build/status/brandonmcclure.docker-bfg?branchName=main)](https://dev.azure.com/brandonmcclure89/docker-bfg/_build/latest?definitionId=13&branchName=main)

# docker-bfg
Containerizes the
[BFG Repo-Cleaner](https://rtyley.github.io/bfg-repo-cleaner/) because I hate
running Java natively.

## Usage
### Building Container

```sh
make container BFG_VERSION=1.13.0
```

### Easily Using the Container

```sh
make install BFG_VERSION=1.13.0
```

### clone your repo as a mirror
`git clone --mirror https://github.com/tomislacker/docker-bfg.git`

### Manually Using the Container

```sh
docker run \
    --rm \
    -v $(readlink -m $(pwd)):/code \
    -w /code \
    tomislacker/bfg:1.13.0 # Then add your args here
```

##### Use BFG to remove a list of secrets from history
Create a list of secrets inside of the parent folder of your bare repo, in a file named secrets.txt

then run the image, and pass these arguments to filter those patterns out of the git history
```
docker run `
--rm `
 -v ${PWD}/docker-bfg.git:/code -w /code `
 -v ${PWD}/secrets.txt:/home/secrets.txt `
 -v ${PWD}/bfgReport:/code.bfg-report -w /code.bfg-report `
  tomislacker/bfg:1.13.0 --replace-text /home/secrets.txt /code
   ```