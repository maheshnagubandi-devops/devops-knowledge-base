# Container Commands

## Docker Basics
- `docker ps`: List running containers
- `docker ps -a`: List all containers (including stopped)
- `docker images`: List images
- `docker pull image:tag`: Download image
- `docker run image`: Run container from image
- `docker run -d image`: Run in detached mode
- `docker run -it image bash`: Interactive terminal
- `docker run --name container_name image`: Named container
- `docker run -p host_port:container_port image`: Port mapping
- `docker run -v /host/path:/container/path image`: Volume mounting
- `docker run -e VAR=value image`: Set environment variables

## Docker Container Management
- `docker start container`: Start stopped container
- `docker stop container`: Stop running container
- `docker restart container`: Restart container
- `docker kill container`: Force stop container
- `docker rm container`: Remove container
- `docker rm $(docker ps -aq)`: Remove all containers

## Docker Image Management
- `docker build -t image_name:tag .`: Build image
- `docker tag image_name:old_tag image_name:new_tag`: Tag image
- `docker push image_name:tag`: Push to registry
- `docker rmi image`: Remove image
- `docker inspect image`: Image details

## Docker Logging and Debugging
- `docker logs container`: View logs
- `docker logs -f container`: Follow logs
- `docker logs --tail 50 container`: Last 50 lines
- `docker exec -it container bash`: Enter container shell
- `docker inspect container`: Container details
- `docker stats`: Container resource usage
- `docker top container`: Processes in container

## Docker System Management
- `docker system prune`: Remove unused images, containers, networks
- `docker system prune -a`: Remove all unused (including tagged images)
- `docker volume ls`: List volumes
- `docker network ls`: List networks
- `docker ps -q`: List only container IDs

## Docker Compose
- `docker-compose up`: Start services
- `docker-compose up -d`: Start in detached mode
- `docker-compose down`: Stop and remove services
- `docker-compose logs`: View logs
- `docker-compose exec service command`: Run command in service
- `docker-compose ps`: List services
- `docker-compose restart service`: Restart service

## Kubernetes Basics
- `kubectl get pods`: List all pods
- `kubectl get pods -n namespace`: Pods in specific namespace
- `kubectl get pods -A`: Pods in all namespaces
- `kubectl get nodes`: List nodes
- `kubectl get services`: List services
- `kubectl get deployments`: List deployments
- `kubectl get all`: All resources

## Kubernetes Pod Management
- `kubectl describe pod pod_name`: Pod details
- `kubectl logs pod_name`: View pod logs
- `kubectl logs pod_name -c container_name`: Logs from specific container
- `kubectl logs pod_name -f`: Follow logs
- `kubectl exec -it pod_name -- bash`: Enter pod shell
- `kubectl exec pod_name -- command`: Run command in pod
- `kubectl delete pod pod_name`: Delete pod
- `kubectl port-forward pod_name local_port:pod_port`: Port forwarding

## Kubernetes Deployment Management
- `kubectl create deployment name --image=image`: Create deployment
- `kubectl apply -f deployment.yaml`: Apply deployment
- `kubectl delete deployment name`: Delete deployment
- `kubectl scale deployment name --replicas=3`: Scale replicas
- `kubectl rollout status deployment name`: Rollout status
- `kubectl rollout history deployment name`: Rollout history
- `kubectl rollout undo deployment name`: Rollback deployment
- `kubectl set image deployment name container=image`: Update image

## Kubernetes Debugging
- `kubectl describe node node_name`: Node details
- `kubectl get events`: Cluster events
- `kubectl top nodes`: Node resource usage
- `kubectl top pods`: Pod resource usage
- `kubectl logs deployment_name`: Logs from deployment

## Common Container Troubleshooting
- Check if container is running: `docker ps | grep container`
- Check logs for errors: `docker logs container`
- Check resource usage: `docker stats`
- Enter container for debugging: `docker exec -it container bash`
- Check network connectivity: `docker exec container ping host`
- View container processes: `docker top container`
- For Kubernetes: `kubectl describe pod` and `kubectl logs pod`
- Check pod events: `kubectl get events --sort-by='.lastTimestamp'`

## Interview Tips
- Know the difference between `docker ps` (running) and `docker ps -a` (all)
- Be familiar with port mapping and volume mounting
- Understand the difference between `docker stop` and `docker kill`
- Know how to view logs and enter containers for debugging
- Be ready to explain Kubernetes pod lifecycle
- Understand deployment replicas and scaling
- Know how to troubleshoot container issues with `describe` and `logs`
