from flask import Flask
import docker
import os

app = Flask(__name__)
client = docker.from_env()

@app.route('/')
def hello_container():
    return "Hello, container v3!"

@app.route('/metadata')
def metadata():
    # Assuming you have passed the container ID as an environment variable
    container_id = os.environ.get('CONTAINER_ID')
    if not container_id:
        return {"error": "Container ID not set in environment variables."}

    container = client.containers.get(container_id)
    metadata = {
        "id": container.id,
        "name": container.name,
        "image": container.image.tags,
        "status": container.status
    }
    return metadata

if __name__ == "__main__":
    app.run(host='0.0.0.0')