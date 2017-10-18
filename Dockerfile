FROM gliderlabs/alpine:3.6
MAINTAINER Maks Balashov <maksbalashov@gmail.com>
ENV LIBRARY_PATH=/lib:/usr/lib
RUN addgroup -S -g 777 django && adduser -D -S -G django -u 777 django
RUN apk -U upgrade && apk -U add python3 ca-certificates musl-dev gcc python3-dev postgresql-dev \
    gettext openjpeg openjpeg-tools openjpeg-dev libjpeg-turbo \
    libjpeg-turbo-utils libjpeg-turbo-dev musl freetype freetype-dev \
    libwebp lcms2 tiff zlib zlib-dev libffi-dev \
    g++ gcc libxslt-dev && \
    update-ca-certificates && \
    python3 -m ensurepip && \
    rm -r /usr/lib/python*/ensurepip && \
    pip3 install --upgrade pip setuptools && \
    rm -r /root/.cache && \
    ln -s /usr/bin/python3 /usr/bin/python && \
    ln -s /usr/bin/pip3 /usr/bin/pip

RUN pip install -U Django django-ckeditor django-environ django-model-utils \
    django-solo django-suit gunicorn ipython Pillow psycopg2 pytils raven

RUN mkdir -p /code/public/static && mkdir -p /code/public/media && chown -R django:django /code
WORKDIR /code
VOLUME ["/code"]
EXPOSE 8000
CMD ["gunicorn", "-c", "gunicorn.py", "-k", "gevent", "core.wsgi"]
