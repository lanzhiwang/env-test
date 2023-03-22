# env-test

### 本地运行(docker)
```shell
# pull image
docker pull env-test:v0.7

# prepare network
docker network create my-network
docker network ls # 查看my-network

# server mode
docker run -it --rm --name env-test_server --net=my-network -p 3389:3389 -e IPERF_SERVER_LISTEN_ADDR=0.0.0.0 -e RUN_MODE=server -e IPERF_SERVER_LISTEN_PORT=3389 env-test:v0.7
docker inspect env-test_server|grep IPAddress  # 查看server ip addr

# normal(client) mode
docker run -it --rm --name env-test_client --net=my-network -e RUN_MODE=normal -e IPERF3_SERVER_ADDR=172.18.0.2 -e IPERF3_SERVER_PORT=3389 env-test:v0.7

```

### node运行(host)
```shell
server:10.0.128.156
client:10.0.131.158

server模式：
docker run -it --rm --name env-test_server --net=host -p 3389:3389 -e IPERF_SERVER_LISTEN_ADDR=10.0.128.156 -e RUN_MODE=server -e IPERF_SERVER_LISTEN_PORT=3389 registry.alauda.cn:60080/middleware/env-test:20220929154924

client模式：
docker run -it --rm --name env-test_client --net=host -e SLEEP_TIME=3600 -e RUN_MODE=normal -e IPERF3_SERVER_ADDR=10.0.128.156 -e IPERF3_SERVER_PORT=3389 registry.alauda.cn:60080/middleware/env-test:20220929154924
```
