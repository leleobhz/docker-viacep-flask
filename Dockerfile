FROM python:3-alpine

LABEL maintainer="Leonardo Amaral <docker@leonardoamaral.com.br>"

RUN apk add --no-cache git
RUN pip install flask viacep

# Build https://github.com/leogregianin/viacep-flask

RUN cd /tmp/build && \
    git clone https://github.com/leogregianin/viacep-flask.git && \
    cd viacep-flask && \
    pip install -r requirements.txt && \
    cd /

# Run flask

EXPOSE 5000

WORKDIR /tmp/build/viacep-flask
ENTRYPOINT ["python"]
CMD ["app.py"]
