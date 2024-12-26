FROM python:3.9.11
ENV PYTHONUNBUFFERED 1
RUN mkdir -p /root/workspace
COPY ./container/requirements.txt /root/workspace/
ADD ./src/app/ /root/workspace/app
WORKDIR /root/workspace
RUN pip install --upgrade pip \
    && pip install --upgrade setuptools \
    && pip install -r requirements.txt

WORKDIR /root/workspace/app

EXPOSE 8080

CMD ["gunicorn", "--reload", "-b", ":8080", "config.wsgi:application","-w","2","-k","gevent"]
