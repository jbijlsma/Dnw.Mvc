docker build -t dnw2022/aspnetapp:latest -f ./Dockerfile .
echo "$DOCKER_PASSWORD" | docker login -u $DOCKER_ID --password-stdin
docker push dnw2022/aspnetapp:latest

kubectl apply -f k8s

kubectl rollout restart deployment/aspnetapp-deployment
#kubectl rollout restart deployment/my-release-ingress-nginx-controller