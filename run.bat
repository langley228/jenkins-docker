cd src
docker-compose -f docker-compose.jmeter.env.yml -p test up -d mongo
docker-compose -f docker-compose.jmeter.yml -p test up

docker cp test-jmeter-1:/opt/data/result .\
dir