sudo docker login

# criando imagem
sudo docker build -t app \
    nodejs-with-postgres-api-example

# criando apelido
sudo docker tag app paulomatosj/nodejs-with-postgres-api-example

# sobe para o dockerhub
sudo docker push paulomatosj/nodejs-with-postgres-api-example

kubectl get nodes

kubectl describe node

minikube dashboard

# cria statefulset do postgres
kubectl create -f postgres-sts.json

kubectl get statefulset # kubectl get sts

kubectl get pods

kubectl logs postgres-0  # roda usando o nome do pod adquirido com o comando kubectl get pods

kubectl describe sts postgres
kubectl describe pod postgres-0

kubectl create -f postgres-svc.json

kubectl get svc
kubectl describe svc
kubectl describe service postgres-svc

kubectl create -f api-deployment.json 
kubectl get deploy
kubectl describe deploy api-heroes

kubectl get pod
kubectl describe pod api-heroes-5fd8f8ff6c-zpbj7

kubectl get pod -w # watch

kubectl logs api-heroes-5fd8f8ff6c-zpbj7
kubectl logs -f api-heroes-5fd8f8ff6c-zpbj7 # watch logs

# aumentou o número de pods e applica novamente o deployment

kubectl apply -f api-deployment.json 
kubectl get pod

kubectl create -f api-svc.json 
kubectl get svc # EXTERNAL-IP pending pra sempre pois está rodando no mibikube local, na cloud esse valor seria fornecido

kubectl describe csv api-heroes-svc

minikube service api-heroes-svc --url

kubectl delete -f . # deleta tudo de uma vez
kubectl create -f . # cria tudo de uma vez

minikube delete # deleta todos os recursos

kubectl expose <pod> --port=444 --name=frontend
kubectl port-forward <pod> 8080
kubectl exec <pod> -- command
kubectl label pods <pod> mylabel=awesome

kubectl rollout status deployment/api-heroes

kubectl rollout status deployment/api-heroes
kubectl get pods
kubectl set image deployment/api-heroes api-heroes=paulomatosj/nodejs-with-postgres-api-example:2
kubectl get pods
kubectl rollout history deployment/api-heroes
kubectl rollout undo deployment/heroes
kubectl rollout undo deployment/api-heroes
kubectl rollout history deployment/api-heroes
kubectl rollout undo deployment/api-heroes --to-revision=4
kubectl rollout history deployment/api-heroes
