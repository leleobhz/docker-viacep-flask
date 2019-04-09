FROM python:2-alpine

LABEL maintainer="Leonardo Amaral <docker@leonardoamaral.com.br>"

RUN apk add --no-cache git
RUN pip install flask requests
RUN pip install viacep

# Build https://github.com/leogregianin/viacep-flask

RUN mkdir -p /tmp/build && \
    cd /tmp/build && \
    git clone https://github.com/leogregianin/viacep-flask.git && \
    cd viacep-flask && \
    pip install -r requirements.txt && \
    cd /

# Run flask

EXPOSE 5000

WORKDIR /tmp/build/viacep-flask
ENTRYPOINT ["python"]
CMD ["app.py"]
