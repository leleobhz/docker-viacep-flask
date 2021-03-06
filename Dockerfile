FROM python:alpine

LABEL maintainer="Leonardo Amaral <docker@leonardoamaral.com.br>"

RUN apk add --no-cache --virtual .build-deps \
    git

# Install requests

RUN pip install requests

# Build https://github.com/leogregianin/viacep-python

RUN pip install git+https://github.com/leogregianin/viacep-python.git

# Build https://github.com/leogregianin/viacep-flask

RUN mkdir -p /tmp/build && \
    cd /tmp/build && \
    git clone https://github.com/leogregianin/viacep-flask.git && \
    cd viacep-flask && \
    pip install --ignore-installed -r requirements.txt && \
    cd /

RUN apk del .build-deps

# Run flask

EXPOSE 5000

WORKDIR /tmp/build/viacep-flask
ENTRYPOINT ["python", "-m", "flask", "run", "--host=0.0.0.0"]
