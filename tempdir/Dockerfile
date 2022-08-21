FROM python:3
RUN pip3 install flask
COPY ./templates /home/myapp/templates/
COPY app.py /home/myapp/
EXPOSE 5050
ENTRYPOINT ["python3"]
CMD ["/home/myapp/app.py"]
