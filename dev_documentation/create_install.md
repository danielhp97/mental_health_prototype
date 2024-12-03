# Steps

# Save images locally
(For now not uploading to the docker shared registry)

run

```
docker save -o frontend.tar mental_health_prototype-frontend
xattr -c install_files/frontend.tar 
docker save -o messaging.tar mental_health_prototype-messaging
docker save -o database.tar mental_health_prototype-database
docker save -o auth.tar mental_health_prototype-auth
docker save -o backend.tar mental_health_prototype-backend
```