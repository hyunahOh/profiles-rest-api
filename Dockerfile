FROM python:3.9-alpine3.13

EXPOSE 8000

COPY ./app /app
COPY ./requirements.txt /tmp/requirements.txt
WORKDIR /app

RUN python -m venv /py && \
    apk --no-cache add zip && \
    adduser --disabled-password --no-create-home -D django-user && \
    /py/bin/pip install -r /tmp/requirements.txt

ENV PATH="/py/bin:$PATH"

USER django-user