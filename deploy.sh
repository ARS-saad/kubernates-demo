set -e

NAME="kubernetes-demo-api"
USERNAME="890iop"
IMAGE="$USERNAME/$NAME:latest"

echo "Building Docker image..."
docker buildx build -t $IMAGE .

echo "Pushing image to Docker Hub..."
docker push $IMAGE

echo "Applying kubernetes manifests..."
kubectl apply -f k8s/

echo "Getting pods..."
kubectl get pods

echo "Getting services..."
kubectl get services

echo "Fetching the main server"
kubectl get services $IMAGE-server
