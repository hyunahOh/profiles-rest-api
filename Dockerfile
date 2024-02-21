FROM python:3.9-alpine3.13

EXPOSE 8000

COPY ./app /app
WORKDIR /app

RUN python -m venv /py && \
    apk --no-cache add zip

ENV PATH="/py/bin:$PATH"
