minikube start --driver=virtualbox --memory='3000' --disk-size 5000MB;
minikube addons enable metallb
minikube addons enable dashboard

eval $(minikube -p minikube docker-env);

docker pull metallb/speaker:v0.8.2
docker pull metallb/controller:v0.8.2
kubectl apply -f srcs/yaml/metallb-config.yaml

docker build -t nginx_my srcs/nginx/
kubectl apply -f srcs/yaml/nginx.yaml

docker build -t mysql:v1 srcs/mysql/
kubectl apply -f srcs/yaml/mysql.yaml

docker build -t wordpress srcs/wordpress/
kubectl apply -f srcs/yaml/wordpress.yaml

docker build -t phpmyadmin srcs/phpmyadmin/
kubectl apply -f srcs/yaml/phpmyadmin.yaml

docker build -t ftps srcs/ftps/
kubectl apply -f srcs/yaml/ftps.yaml

docker build -t influxdb srcs/influxdb/
kubectl apply -f srcs/yaml/influxdb.yaml

docker build -t grafana srcs/grafana/
kubectl apply -f srcs/yaml/grafana.yaml

minikube dashboard
