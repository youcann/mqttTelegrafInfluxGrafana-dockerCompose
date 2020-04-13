#!/bin/bash
time_s=300
dt_s=2
N=$(expr $time_s / $dt_s)
echo "[N: $N, endtime=$time_s seconds, dt=$dt_s seconds]"

for CNT in $(seq 1 $N)
do
	val1=$CNT
	val2=$(expr $N - $CNT)
	val3=$RANDOM
	echo "(sensors/Sensor1:$val1, sensors/Sensor2:$val2, sensors/Sensor3:$val3)"
	docker run --rm -it --net host ruimarinho/mosquitto mosquitto_pub -h localhost -t "sensors/Sensor1" -m "$val1" > /dev/null
	docker run --rm -it --net host ruimarinho/mosquitto mosquitto_pub -h localhost -t "sensors/Sensor2" -m "$val2" > /dev/null
	docker run --rm -it --net host ruimarinho/mosquitto mosquitto_pub -h localhost -t "sensors/Sensor3" -m "$val3" > /dev/null
	sleep $dt_s
done
