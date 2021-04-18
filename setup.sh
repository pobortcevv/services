minikube start --driver=virtualbox --memory='3000' --disk-size 5000MB;
minikube addons enable metallb
minikube addons enable dashboard

eval $(minikube -p minikube docker-env);
kubectl apply -f srcs/yaml/metallb-config.yaml

docker build -t nginx_my srcs/nginx/
kubectl apply -f srcs/yaml/nginx.yaml

minikube dashboard
