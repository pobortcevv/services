minikube start --driver=virtualbox --memory='3000' --disk-size 5000MB;
minikube addons enable metallb
minikube addons enable dashboard

eval $(minikube -p minikube docker-env);
docker pull metallb/speaker:v0.8.2
docker pull metallb/controller:v0.8.2
kubectl apply -f srcs/yaml/metallb-config.yaml

docker build -t nginx_my srcs/nginx/
kubectl apply -f srcs/yaml/nginx.yaml
docker build -t wordpress srcs/wordpress/
kubectl apply -f srcs/yaml/wordpress.yaml
docker build -t my_sql srcs/mysql/
kubectl apply -f srcs/yaml/mysql.yaml

minikube dashboard
