. ./env.sh
docker-compose stop
docker-compose up -d
sleep 8
./add_secrets.sh
docker-compose logs -f
