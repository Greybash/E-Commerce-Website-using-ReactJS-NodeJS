kubectl get nodes

kubectl create namespace e-commerce
kubectl apply -f mongodb.yaml -n e-commerce
kubectl apply -f backend.yaml -n e-commerce
kubectl apply -f frontend.yaml -n e-commerce

kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/main/deploy/static/provider/cloud/deploy.yaml
kubectl get pods -n ingress-nginx
sleep 15
kubectl get pods -n ingress-nginx
kubectl apply -f ingress.yaml -n e-commerce
sleep 15
kubectl get ingress -n e-commerce



kubectl get svc -n e-commerce -o wide