# hpess/devenv-jruby
This container is a development environment for jruby, expanding on the framework of [hpess/devenv](https://github.com/Hewlett-Packard-ESS/docker-devenv) by installing the tools required to develop in jruby:
 - Bundler, RSpec 

## Use
The easiest way is probably with a docker-compose file, as you need to pass in some environment variables to configure things.

docker-compose.yml:
```
devenv:
  image: hpess/devenv-jruby:master
  ports:
    - "2022:2202/tcp"
  volumes:
    - ./storage:/storage
```

## No SSH
By default, the hpess/devenv container will start an SSH daemon, this is because the purpose of the container is to enable people to easily pair program using wemux.  However if you don't want to do this just override the entrypoint to /bin/bash

## SSH Agent Forwarding
If you want to pass through your SSH identity, so that you can use git in the docker container with your credentials, use SSH Agent Forwarding:
```
ssh -T devenv@127.0.0.1 -p 2022
```

## Even easier use
If, like me, you work behind a corporate firewall etc sometimes - you might want to take a look at [hpess/dockerproxy](https://github.com/Hewlett-Packard-ESS/docker-proxy)
