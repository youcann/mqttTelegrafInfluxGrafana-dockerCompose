FROM python:3

ADD monitorValueCount.py /

RUN pip install influxdb
RUN pip install apscheduler

CMD [ "python", "-i", "./monitorValueCount.py" ]
