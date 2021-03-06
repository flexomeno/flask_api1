FROM python:3.8

# Creating Application Source Code Directory
RUN mkdir -p /usr/src/app

# Setting Home Directory for containers
WORKDIR /usr/src/app

# Installing python dependencies
COPY requeriments.txt /usr/src/app/
RUN pip install --no-cache-dir -r requeriments.txt

# Copying src code to Container
COPY . /usr/src/app

# Application Environment variables
#ENV APP_ENV development
ENV PORT 1234

# Exposing Ports
EXPOSE $PORT

# Setting Persistent data
VOLUME ["/app-data"]

# Running Python Application
CMD python3 api.py