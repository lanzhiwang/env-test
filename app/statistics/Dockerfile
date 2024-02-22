FROM docker-mirrors.alauda.cn/library/python:3.11

WORKDIR /workspace

COPY pip.conf /root/.pip/pip.conf

COPY statistics_env_logs.py statistics_env_logs.py

COPY entrypoint.sh entrypoint.sh

RUN pip install pandas

ENTRYPOINT ["./entrypoint.sh"]
