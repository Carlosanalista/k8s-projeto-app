echo "Criando as imagens..."

docker build -t cadockerx5/pro-backend:1.0 backend/.
docker build -t cadockerx5/pro-database:1.0 database/.

echo "Subindo as imagens..."

docker push cadockerx5/pro-backend:1.0
docker push cadockerx5/pro-database:1.0

echo "Criando os serviços no Cluster..."

kubectl apply -f ./services.yml

echo "Criando os deployments..."

kubectl apply -f ./deployment.yml