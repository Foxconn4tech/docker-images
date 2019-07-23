FROM python:3.6
# using debian stretch

MAINTAINER matej.racinsky@foxconn4tech.com

RUN apt-get update && apt-get install --no-install-recommends -y \
    wget \
    postgresql-client

# must install it that way so it does not need any display, see https://stackoverflow.com/questions/46399914/how-to-use-wkhtmltopdf-with-docker
RUN wget -nv -O /tmp/wkhtmltox.deb https://github.com/wkhtmltopdf/wkhtmltopdf/releases/download/0.12.5/wkhtmltox_0.12.5-1.stretch_amd64.deb && \
    apt-get -qy install /tmp/wkhtmltox.deb && \
    #tar vxf wkhtmltox-0.12.5_linux-generic-amd64.tar.xz && \
    #cp wkhtmltox/bin/wk* /usr/local/bin/ && \
    rm /tmp/wkhtmltox.deb
# packages we use
RUN pip install \
    Jinja2==2.10 \
    numpy==1.15.4 \
    pdfkit==0.6.1 \
    nose==1.3.7 \
    scipy==1.2.1 \
    seaborn==0.9.0 \
    scikit-learn==0.20.2 \
    PyYAML==3.13 \
    jupyter==1.0.0 \
    pytest==4.2.0 \
    pytest-cov==2.6.1 \
    psycopg2==2.8.3 \
    darkskylib==0.3.91 \
    schedule==0.6.0 \
    paho-mqtt==1.4.0