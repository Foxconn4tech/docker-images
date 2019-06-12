FROM python:3.6

MAINTAINER matej.racinsky@foxconn4tech.com

RUN apt-get update && apt-get install --no-install-recommends -y \
    wget

# must install it that way so it does not need any display, see https://stackoverflow.com/questions/46399914/how-to-use-wkhtmltopdf-with-docker
RUN wget https://github.com/wkhtmltopdf/wkhtmltopdf/releases/download/0.12.3/wkhtmltox-0.12.3_linux-generic-amd64.tar.xz && \
    tar vxf wkhtmltox-0.12.3_linux-generic-amd64.tar.xz && \
    cp wkhtmltox/bin/wk* /usr/local/bin/ && \
    rm wkhtmltox-0.12.3_linux-generic-amd64.tar.xz
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
    pytest-cov==2.6.1
