FROM python:3.10.5-slim-buster

WORKDIR /app

RUN pip3 install fastapi
RUN pip3 install uvicorn[standard]
RUN pip3 install sqlalchemy
RUN pip3 install psycopg2-binary


COPY . .


CMD [ "python3", "main.py"]
