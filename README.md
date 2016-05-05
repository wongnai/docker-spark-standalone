# spark-standalone
Spark Standalone Dockerfile

docker run --name spark-master -d --net=host skrityak/spark-standalone master
docker run --name spark-worker1 -d --net=host skrityak/spark-standalone worker spark://MASTER_HOST_OR_IP:7077
docker run --name spark-worker2 -d --net=host skrityak/spark-standalone worker spark://MASTER_HOST_OR_IP:7077
