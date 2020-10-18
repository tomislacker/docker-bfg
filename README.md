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

### Manually Using the Container

```sh
docker run \
    --rm \
    -v $(readlink -m $(pwd)):/code \
    -w /code \
    tomislacker/bfg:1.13.0 # Then add your args here
```

#### Run example using windows/another bind mount to get the bfg report back
```
docker run `
    --rm `
    -v ${PWD}/yourRepo:/code -w /code `
    -v ${PWD}/bfgReport:/code.bfg-report -w /code.bfg-report `
    tomisslacker/bfg:1.13.0 # Then add your args here
```