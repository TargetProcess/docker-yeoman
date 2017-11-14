# Yeoman generator base image

This Docker image is intended as the base for other yeoman generator images.

## Creating a generator image

To create a new yeoman generator, create a Dockerfile like this:

```
FROM targetprocess/yeoman
  
RUN npm install --global --silent GENERATOR-NAME
    
ENTRYPOINT ["entrypoint.sh", "GENERATOR-NAME"]
```

Then build the docker image:

```
docker build -t targetprocess/generator-GENERATOR-NAME .
```

To run the generator manually to create a new project, use:

```
mkdir ~/PROJECT-NAME
cd ~/PROJECT-NAME
docker run -it -e LOCAL_USER_ID=$(id -u) -e LOCAL_GROUP_ID=$(id -g) -v "$(pwd):/generated" --rm targetprocess/generator-GENERATOR-NAME
```

Environment variables `LOCAL_USER_ID` and `LOCAL_GROUP_ID` are optional for Windows or Mac OS.

This will run ``yo GENERATOR-NAME`` within the Docker container and will build the project in the current directory.
