kubectl get nodes

kubectl create namespace e-commerce
sleep 5
kubectl apply -f mongodb.yaml -n e-commerce
kubectl apply -f backend.yaml -n e-commerce
kubectl apply -f frontend.yaml -n e-commerce

kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/main/deploy/static/provider/cloud/deploy.yaml
sleep 30
kubectl wait --for=condition=Ready pod/ingress-nginx --timeout=160s

kubectl get pods -n ingress-nginx

kubectl apply -f ingress.yaml -n e-commerce
sleep 90

kubectl get svc -n e-commerce -o wide
sleep 15

kubectl get all -n e-commerce
sleep 30
kubectl get endpoints -n ingress-nginx
kubectl get ingress -n e-commerce



