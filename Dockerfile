FROM python:3.9-slim

WORKDIR /usr/src/app

COPY . .

RUN pip install -r requirements.txt --no-cache-dir

EXPOSE 5000

CMD ["python", "app.py"]