FROM python:3.9-alpine3.13

EXPOSE 8000

COPY ./profiles_api /app/profiles_api
COPY ./profiles_project /app/profiles_project
COPY ./manage.py /app/manage.py
COPY ./requirements.txt /tmp/requirements.txt
WORKDIR /app

RUN python -m venv /py && \
    apk --no-cache add zip && \
    /py/bin/pip install -r /tmp/requirements.txt
#    adduser --disabled-password --no-create-home -D django-user

ENV PATH="/py/bin:$PATH"

#USER django-user