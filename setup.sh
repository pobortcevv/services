minikube start 
minikube addons enable metallb;
minikube addons enable dashboard;

eval $(minikube docker-env);

kubectl apply -f srcs/yaml/metallb-config.yaml;

docker build -t nginx:latest srcs/nginx/;
kubectl apply -f srcs/yaml/nginx.yaml;

minikube dashboard
