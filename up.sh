. ./env.sh
docker-compose stop
docker-compose up -d
sleep 5
./add_secrets.sh
docker-compose logs -f
