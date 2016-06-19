# drone-docker-compose

Trying to get drone 0.5 to work with docker compose.  
Linux only at the moment.  

# Requirements

- docker & docker-compose
- sqlite3
- jq
- apache2-utils (for htpasswd)
- npm
- lt (`npm install -g localtunnel`)

## Generating a htpasswd file

For the registry ([must be Bcrypt](https://docs.docker.com/registry/configuration/#auth))

```shell
htpasswd -cbB ./registry/htpasswd username password
```

# Running it

**Add an env.sh file:**

```shell
export DRONE_GITHUB_CLIENT=YOUR_GITHUB_APP_CLIENT_KEY_HERE
export DRONE_GITHUB_SECRET=YOUR_GITHUB_APP_SECRET_KEY_HERE
export DRONE_AGENT_SECRET=INSERT_RANDOM_UNIQUE_STRING_HERE
export DRONE_USER_TOKEN=THE_TOKEN_ON_YOUR_DRONE_PROFILE
export DOCKER_REGISTRY_URL=YOUR_DOCKER_REGISTRY_URL
# use https://index.docker.io/v1/ for the default registry
export DOCKER_REGISTRY_USERNAME=YOUR_DOCKER_REGISTRY_USERNAME
export DOCKER_REGISTRY_PASSWORD=YOUR_DOCKER_REGISTRY_PASSWORD
export DOCKER_REGISTRY_HTTP_SECRET=INSERT_RANDOM_LONG_STRONG_HERE
```

**Symlink drone into gopath**

```shell
mkdir -p $GOPATH/src/github.com/drone
ln -s /path/to/this/project/drone $GOPATH/src/github.com/drone/drone
```

**Start drone + 1 drone agent:**

```shell
./up.sh
```

**Expose to the world**

```shell
lt --port 8000
```

Grab the localtunnel url and update it in the github oAuth developer application callback url
and the webhook url on the repository settings (only the hostname part)

**Trigger a build:**

Increments a build number and pushes to github.

```shell
./trigger_build.sh
```

## Running with nginx

Make sure to use the `nginx:alpine` image as the other ones [do not include support for Bcrypt](https://github.com/nginxinc/docker-nginx/issues/29) which is needed for the registry.

https://github.com/docker/distribution/blob/master/docs/recipes/nginx.md
