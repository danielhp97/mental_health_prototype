# Installation

# Clone this repo:

1. If not installed, please install git.

2. Clone this repo
```git clone https://github.com/danielhp97/mental_health_prototype```

## Configurations
1. Make sure you have permissions to run 'install.sh':
```chmod +x install.sh```
2. Make sure you have Docker and docker-compose installed (on macOS, please install Docker Desktop and run all the following commands on the app terminal. Make sure the root dir is where this project is located.)

## Installation steps
1. run 'install.sh'
```./install.sh```


# Acccess the app
Make sure all the indicated ports are free on the local machine (they should by default) 

1. Frontend:
Access the following URL. ```http://localhost:<FRONTEND_PORT>```
2. Backend:
Access the following URL. ```http://localhost:<BACKEND_PORT>```

The ports can be edited on the ".env" file. Feel free to edit it.
Obs: the Same port will be in use if you want to reinstall using the install script.

# Restarts

If you want to reinstall the app, to make sure no conflicts exists (for example on the ports), on the root directory run.
```docker-compose -f "docker_compose.yml" down``` then run the ```./install.sh```script