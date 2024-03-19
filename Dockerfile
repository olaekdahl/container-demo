FROM python:3.9-slim

WORKDIR /usr/src/app

COPY . .

RUN pip install -r requirements.txt --no-cache-dir
RUN chmod +x entrypoint.sh

EXPOSE 5000

ENTRYPOINT [ "/usr/src/app/entrypoint.sh" ]
CMD ["python", "app.py"]

# docker run -v /var/run/docker.sock:/var/run/docker.sock -dp 5002:5000