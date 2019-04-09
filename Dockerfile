FROM alpine

LABEL maintainer="Leonardo Amaral <docker@leonardoamaral.com.br>"

RUN apk add --no-cache bash git py-pip
RUN pip install --upgrade pip
RUN pip install flask

# Build https://github.com/leogregianin/viacep-python

RUN mkdir /tmp/build && \
    cd /tmp/build && \
    git clone https://github.com/leogregianin/viacep-python.git && \
    cd viacep-python && \
    pip install -r requirements.txt && \
    python setup.py install && \
    cd /

# Build https://github.com/leogregianin/viacep-flask

RUN cd /tmp/build && \
    git clone https://github.com/leogregianin/viacep-flask.git && \
    cd viacep-flask && \
    pip install -r requirements.txt && \
    cd /

# Run flask

WORKDIR /tmp/build/viacep-flask
ENTRYPOINT ["python"]
CMD ["app.py"]
