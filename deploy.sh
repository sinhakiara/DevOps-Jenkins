#!/bin/bash
mkdir -p tempdir/templates &> /dev/null

cp -rf app.py tempdir/.
cp -rf templates/* tempdir/templates/.

echo "FROM python:3" >> tempdir/Dockerfile
echo "RUN pip3 install flask" >> tempdir/Dockerfile
echo "COPY ./templates /home/myapp/templates/" >> tempdir/Dockerfile
echo "COPY app.py /home/myapp/" >> tempdir/Dockerfile
echo "EXPOSE 5050" >> tempdir/Dockerfile
echo 'ENTRYPOINT ["python3"]' >> tempdir/Dockerfile
echo 'CMD ["/home/myapp/app.py"]' >> tempdir/Dockerfile
cd tempdir

docker build -t "myapp" . 

docker run -d -t -p 5050:5050 --name mywebapp myapp:latest
docker inspect -f "{{json .State.Status}}" mywebapp













