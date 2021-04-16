#!/bin/sh
minikube start --vm-driver=virtualbox
minikube addons enable metallb;
minikube addons enable dashboard;

kubectl apply -f srcs/yaml/metallb-config.yaml;

eval $(minikube -p minikube docker-env);
docker build -t nginx:latest srcs/nginx/;
kubectl apply -f srcs/yaml/nginx.yaml;

minikube dashboard
