# running locally

  # Build and push image to docker hub (only arm64 works on m1)
  docker build -f Dockerfile.dev -t dnw2022/aspnetapp .
  docker push dnw2022/aspnetapp

  # So this does not work on my m1
  docker buildx build --platform linux/amd64 -f Dockerfile -t mvc .

  # To run using docker
  docker run -it --rm -p 8000:80 mvc

  # Or with kubernetes (check http ingress config)
  kubectl apply -f k8s
  
  # In the browser 
  browse to http://localhost
  
# Deployment to Google Kubernetes Engine (GKE)

Under IAM create service account and download key pair json file

Base64 encode the json file:

cat multi-k8s-339908-e1853ea369e6.json | base64

And add base64 string as secret to github repo