FROM python:3.11.0a4-slim-buster

ENV DB_URL=url_test
ENV DB_USER=user_test
ENV DB_PASSWORD=password_test

RUN apt-get update -y && \
  apt-get install -y python-pip python-dev

WORKDIR /app

RUN pip install Flask

COPY . .

EXPOSE 5000

CMD [ "python", "./app.py"]