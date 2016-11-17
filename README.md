# docker-bfg
Containerizes the
[BFG Repo-Cleaner](https://rtyley.github.io/bfg-repo-cleaner/) because I hate
running Java natively.

## Usage
### Building Container

```sh
make container BFG_VERSION=1.12.14
```

### Easily Using the Container

```sh
make install BFG_VERSION=1.12.14
```

### Manually Using the Container

```sh
docker run \
    --rm \
    -v $(readlink -m $(pwd)):/code \
    -w /code \
    tomislacker/bfg:1.12.14 # Then add your args here
```
