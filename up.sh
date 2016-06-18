. ./env.sh
docker-compose up -d
sleep 5
./add_secrets.sh
docker-compose logs -f
