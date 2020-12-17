from influxdb import InfluxDBClient
import os
import time
from datetime import datetime

_HOST="localhost"
_DATABASE="sensors"
_MEASUREMENT="mqtt_consumer"

def init():
    client = InfluxDBClient(host=_HOST, port=8086, database=_DATABASE)
    return client

def countValuesYesterday(client):
    result=client.query(f"select count(*) from {_MEASUREMENT} where time > now()-2d  group by time(1d)")
    c_vals=list(list(result.get_points())[1].values())[1:]
    count_min=min(c_vals)
    return count_min

def checkCount(client,minCount):
    if(countValuesYesterday(client) >= minCount):
        return True
    return False


if __name__ == "__main__":
    client=init()
    print(checkCount(client,10000))

