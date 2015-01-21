# Nginx + PHP5 container

This container simply runs nginx and php5-fpm. It is meant to be user locally as a simple nginx & php server. To use this container, you just need to mount the php folder on your local machine to the nginx html folder in the container

**This is in no way meant to be used in production**

#### Build & Run
An example to run a folder of php in the tmp directory on the docker container and expose it on port 80

```bash
sudo docker build -t nginx-server .
sudo docker run -d --name nginx-server -p 80:80 -v /tmp/php:/usr/share/nginx/html nginx-test
```

#### Viewing Logs
Once the container is running, you can view the Nginx/PHP logs using the following command

```bash
sudo docker logs -f nginx-server
```
