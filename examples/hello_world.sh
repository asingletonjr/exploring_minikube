#!/bin/bash -x
# Description: Install minikube for docker 'hello world' image use

# MAC OS
# brew install minikube

# check version (1.16.0 as of 12/20)
minikube --version

# start base pods
minikube start

# access running local pods
kubectl get po -A

# start local dashboard of running services instead of using cli
minikube dashboard

# deploy sample application
kubectl create deployment hello-minikube --image=k8s.gcr.io/echoserver:1.4
kubectl expose deployment hello-minikube --type=NodePort --port=8080

# check running services
kubectl get services hello-minikube

# map localhost port and open browser for application
minikube service hello-minikube

# port mapping option 2 (requires user to manually open browser tab localhost:7080)
kubectl port-forward service/hello-minikube 7080:8080