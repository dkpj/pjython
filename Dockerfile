FROM python:3

WORKDIR /app

# Add the backend
COPY app/be  /app/be

# Install backend dependencies
RUN pip install -r /app/be/requirements.txt


# Start and serve the flask rest api
CMD python3 /app/be/rest-server.py