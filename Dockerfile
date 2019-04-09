FROM python

LABEL maintainer="Leonardo Amaral <docker@leonardoamaral.com.br>"

RUN pip install requests
RUN pip install git+https://github.com/leogregianin/viacep-python.git

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
