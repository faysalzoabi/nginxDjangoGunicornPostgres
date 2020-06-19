FROM python:3.7

ENV PYTHONUNBUFFERRED 1

# by default docker container run as root
# RUN apt-get update -y && apt-get install libpq-dev python3.7-dev

COPY requirements.txt /requirements.txt
RUN pip install -r /requirements.txt

RUN mkdir /app
WORKDIR /app
ADD ./app /app
CMD ["gunicorn", "--chdir", "app", "--bind", ":8000", "app.wsgi:application"]