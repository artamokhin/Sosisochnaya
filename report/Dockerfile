FROM gitlab.praktikum-services.ru:5050/std-012-056/sausage-store/python:latest
WORKDIR /app
COPY requirements.txt ./
ADD app.py ./
WORKDIR /app
RUN pip install -r requirements.txt
ENTRYPOINT ["python"]
CMD ["app.py"]
EXPOSE 8080