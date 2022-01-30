# Instalação Kubernetes

[install-kubectl-linux](https://kubernetes.io/docs/tasks/tools/install-kubectl-linux/#install-using-native-package-management)

# Install Minikube

[minikube](https://minikube.sigs.k8s.io/docs/start/)


# Para ErrImageNeverPull

Para corrigir isso, eu uso o minikube docker-envcomando que gera variáveis ​​de ambiente necessárias para apontar o daemon local do Docker para o registro interno do Docker do minikube:

```shell
> minikube docker-env 
export DOCKER_TLS_VERIFY=”1" 
export DOCKER_HOST=”tcp://172.17.0.2:2376" 
export DOCKER_CERT_PATH=”/home/user/.minikube/certs” 
export MINIKUBE_ACTIVE_DOCKERD=”minikube”
# Para apontar seu shell para o docker-daemon do minikube, execute: 
# eval $(minikube -p minikube docker-env)
```

Para aplicar essas variáveis, utilizo o comando proposto:

```shell
> eval $(minikube -p minikube docker-env)
```

Fonte: [how-to-run-locally-built-docker-images-in-kubernetes](https://medium.com/swlh/how-to-run-locally-built-docker-images-in-kubernetes-b28fbc32cc1d)

# Docker hub
https://hub.docker.com/r/danielso2007/kubernetes

## Login
https://hub.docker.com/repository/docker/danielso2007/kubernetes

# Create a Secret based on existing credentials

[configure-pod-container/pull-image-private-registry](https://kubernetes.io/docs/tasks/configure-pod-container/pull-image-private-registry/#registry-secret-existing-credentials)


```
kubectl create secret generic regcred \
    --from-file=.dockerconfigjson=<path/to/.docker/config.json> \
    --type=kubernetes.io/dockerconfigjson
```

kubectl create secret docker-registry regcred --docker-server=<your-registry-server> --docker-username=<your-name> --docker-password=<your-pword> --docker-email=<your-email>
