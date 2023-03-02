FROM ubuntu:20.04@sha256:9fa30fcef427e5e88c76bc41ad37b7cc573e1d79cecb23035e413c4be6e476ab

ENV LC_ALL=C.UTF-8
ENV LANG=C.UTF-8

RUN apt-get update -y && apt-get install python3-pip -y

ADD requirements.txt /app/
WORKDIR /app
RUN /bin/bash -c "pip3 install --no-cache-dir -r requirements.txt"

ADD /app/ /app/

EXPOSE 8080

CMD ["gunicorn", "-b", "0.0.0.0:8080", "wsgi", "-k", "gevent"]
