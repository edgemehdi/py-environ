FROM edgemehdi/basic-pkgs 
MAINTAINER mehdi "mehdi@edge.com"

RUN apt-get update -y
RUN apt-get install -y python-virtualenv python-setuptools  python-pip python-dev build-essential freetds-dev libblas-dev liblapack-dev gfortran 

ADD re2  /re2/
WORKDIR /re2/
RUN ["make"]
RUN ["make", "install"]

COPY pyre2 /pyre2
WORKDIR /pyre2/
RUN ["python","setup.py","install"]

COPY . /app
WORKDIR /app

RUN pip install -r requirements.txt

ENTRYPOINT ["python"]
CMD ["app.py"]
