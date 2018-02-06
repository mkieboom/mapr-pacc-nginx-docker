# mapr-pacc-nginx-docker

##### Clone the project
```
git clone https://github.com/mkieboom/mapr-pacc-nginx-docker  
cd mapr-pacc-nginx-docker  
```

#### Build the Nginx PACC container
```
docker build -t mkieboom/mapr-pacc-nginx-docker .
```

#### Specify storage location
The storage path defaults to /mapr/demo.mapr.com/nginx but can be overriden by providing setting the NGINX_PATH variable in the below docker run commands, eg:  
```
-e NGINX_PATH=/mapr/demo.mapr.com/my_nginx_path
```

#### Run the Nginx PACC container
```
docker run -it \
--cap-add SYS_ADMIN \
--cap-add SYS_RESOURCE \
--device /dev/fuse \
-e MAPR_CLUSTER=demo.mapr.com \
-e MAPR_CLDB_HOSTS=MAPRN01 \
-e MAPR_CONTAINER_USER=mapr \
-e MAPR_CONTAINER_GROUP=mapr \
-e MAPR_CONTAINER_UID=5000 \
-e MAPR_CONTAINER_GID=5000 \
-e MAPR_MOUNT_PATH=/mapr \
-p 8181:80 \
mkieboom/mapr-pacc-nginx-docker
```

#### Run the Nginx PACC container as a deamon
```
docker run -d \
--name nginx \
--cap-add SYS_ADMIN \
--cap-add SYS_RESOURCE \
--device /dev/fuse \
-e MAPR_CLUSTER=demo.mapr.com \
-e MAPR_CLDB_HOSTS=MAPRN01 \
-e MAPR_CONTAINER_USER=mapr \
-e MAPR_CONTAINER_GROUP=mapr \
-e MAPR_CONTAINER_UID=5000 \
-e MAPR_CONTAINER_GID=5000 \
-e MAPR_MOUNT_PATH=/mapr \
-p 8181:80 \
mkieboom/mapr-pacc-nginx-docker
```

#### Connect to the Nginx UI
```
Open your browser and point to http://localhost:8181
```





