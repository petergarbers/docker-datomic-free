# docker-datomic-free

This repository will create a datomic-free transactor (0.9.5206) on a docker
image

##Usage


### Create a dockerfile that looks something like this:

```bash

FROM atyz/datomic-free:latest

CMD ["config/dev.properties]

```

### Add your properties file
Add your transactor properties at `config/dev.properties`

### Create a docker-compose file that looks similar to:

```code

datomic-free:
  build: .
  ports:
    - "4334:4334"

```
