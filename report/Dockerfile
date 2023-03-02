FROM python:latest
WORKDIR /app
COPY requirements.txt ./
ADD app.py ./
WORKDIR /app
RUN pip install -r requirements.txt
ENTRYPOINT ["python"]
CMD ["app.py"]
EXPOSE 8080