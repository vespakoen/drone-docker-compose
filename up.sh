. ./env.sh
./recompiledrone.sh
docker-compose stop
docker-compose build
docker-compose up -d
sleep 8
./add_secrets.sh
docker-compose logs -f
