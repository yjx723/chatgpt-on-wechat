FROM zhayujie/chatgpt-on-wechat:master

LABEL maintainer="jingxian-young@hotmail.com"
ARG TZ='Asia/Shanghai'

ARG CHATGPT_ON_WECHAT_VER

RUN echo /etc/apt/sources.list
# RUN sed -i 's/deb.debian.org/mirrors.tuna.tsinghua.edu.cn/g' /etc/apt/sources.list
ENV BUILD_PREFIX=/app

ADD . ${BUILD_PREFIX}

#RUN apt-get update \
#    &&apt-get install -y --no-install-recommends bash ffmpeg espeak libavcodec-extra\
#    && cd ${BUILD_PREFIX} \
#    && cp config-template.json config.json \
#    && /usr/local/bin/python -m pip install --no-cache --upgrade pip \
#    && pip install --no-cache -r requirements.txt \
#    && pip install --no-cache -r requirements-optional.txt \
#    && pip install azure-cognitiveservices-speech

WORKDIR ${BUILD_PREFIX}

COPY app.py /app.py
COPY plugins/config.json /plugins/config.json

#RUN chmod +x /entrypoint.sh
#    && mkdir -p /home/noroot \
#    && groupadd -r noroot \
#    && useradd -r -g noroot -s /bin/bash -d /home/noroot noroot \
#    && chown -R noroot:noroot /home/noroot ${BUILD_PREFIX} /usr/local/lib

USER root

EXPOSE 80

ENTRYPOINT ["/entrypoint.sh"]
