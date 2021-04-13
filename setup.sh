minikube start 
minikube addons enable metallb;
kubectl apply -f srcs/yaml/metallb-config.yaml;
minikube addons enable dashboard;
docker build -t nginx:latest srcs/nginx/;
kubectl apply -f srcs/yaml/nginx.yaml;
minikube dashboard
